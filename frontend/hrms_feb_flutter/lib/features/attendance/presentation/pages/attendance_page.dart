import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrms/core/logging/page_logger_mixin.dart';
import 'package:hrms/core/widgets/custom_app_drawer.dart';
import 'package:hrms/core/widgets/custom_appbar.dart';
import 'package:hrms/features/attendance/domain/entities/attendance_data.dart';
import 'package:hrms/features/attendance/presentation/controllers/attendance_bloc.dart';
import 'package:hrms/features/attendance/presentation/controllers/attendance_state.dart';
import 'package:intl/intl.dart';
import '../../../auth/data/data_sources/auth_storage.dart';
import '../../../../core/services/api_service.dart';
import '../widgets/attendance_mini_card.dart';
import '../controllers/attendance_event.dart';
import '../../data/data_sources/attendance_remote_data_source.dart';
import '../../data/repositories/attendance_repositories_impl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../../core/widgets/shimmer_loader.dart';
import 'package:hrms/core/widgets/custom_selection_bottom_sheet.dart';
import 'package:hrms/core/widgets/common_refresh.dart';

class AttendancePage extends StatefulWidget {
  final ApiService apiservice;

  const AttendancePage({super.key, required this.apiservice});

  @override
  State<AttendancePage> createState() => _AttendanceState();
}

class _AttendanceState extends State<AttendancePage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AuthStorage.getUser(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: LoadingAnimationWidget.fourRotatingDots(
              color: Colors.blue,
              size: 50,
            ),
          );
        }
        if (!snapshot.hasData) {
          return const Center(child: Text("No user found"));
        }

        final user = snapshot.data!;

        return BlocProvider(
          create: (context) {
            final remoteDataSource = AttendanceRemoteDataSource(
              widget.apiservice,
            );
            final repository = AttendanceRepositoriesImpl(remoteDataSource);
            final bloc = AttendanceBloc(repository);

            // Dispatch initial event
            return bloc;
          },
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: const CustomAppBar(
              title: "Attendance",
              showBackButton: true,
            ),
            drawer: const CustomAppDrawer(),
            body: AttendanceBody(user: user),
          ),
        );
      },
    );
  }
}

class AttendanceBody extends StatefulWidget {
  final dynamic user;

  const AttendanceBody({super.key, required this.user});

  @override
  _AttendaceState createState() => _AttendaceState();
}

class _AttendaceState extends State<AttendanceBody>
    with PageLogger<AttendanceBody> {
  @override
  String get pageName => 'Attendance';

  @override
  Map<String, dynamic>? get pageMetadata => {
    'Month': selectedMonth,
    'Year': selectedYear,
  };

  late final List<int> months = List.generate(12, (i) => i + 1);

  // DESCENDING year list: currentYear -> 2023
  late final List<int> years = List.generate(
    DateTime.now().year - 2023 + 1,
    (i) => DateTime.now().year - i,
  );

  int? selectedMonth;
  int? selectedYear;
  String? fullMonthName;

  double workedHours = 0;
  int totalLateby = 0;
  int totalEarlyby = 0;
  double lateDays = 0;
  double earlyDays = 0;
  double leaveDays = 0.0;
  int totalFullLate = 0;
  int lateLeftFinal = 0;
  double lateLeaveDays = 0.0;
  List<String> weekendWorkDaysList = [];
  List<DailyDetail> dailyDetails = [];

  @override
  void initState() {
    super.initState();
    selectedMonth = DateTime.now().month;
    selectedYear = DateTime.now().year;
    fullMonthName = DateFormat('MMMM').format(DateTime(0, selectedMonth!));

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // Dispatch initial fetch
      context.read<AttendanceBloc>().add(
        FetchAttendanceData(widget.user.userId, selectedMonth!, selectedYear!),
      );

      // Log "Opened Page" after user and BLoC are ready
      _logPageOpenedIfNeeded();
    });
  }

  /// Log the first time the page opens
  void _logPageOpenedIfNeeded() {
    logPageActivity(action: 'Opened Page Attendance', metadata: pageMetadata);
  }

  Widget _customDropdown<T>({
    required String title,
    required T selectedItem,
    required List<T> items,
    required String Function(T) labelBuilder,
    required ValueChanged<T> onSelected,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (_) {
                final maxHeight = MediaQuery.of(context).size.height * 0.5;
                return ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: maxHeight),
                  child: CustomSelectionBottomSheet<T>(
                    items: items,
                    selectedItem: selectedItem,
                    itemLabelBuilder: labelBuilder,
                    onApply: onSelected,
                  ),
                );
              },
            );
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            decoration: BoxDecoration(
              color: const Color(0xFFE2E8F0),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(labelBuilder(selectedItem)),
                const Icon(Icons.arrow_drop_down),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AttendanceBloc, AttendanceState>(
      listener: (context, state) {
        if (state is AttendanceLoaded) {
          final data = state.data;

          setState(() {
            workedHours = data.hoursWorked;
            totalLateby = data.totalLateby;
            totalEarlyby = data.totalEarlyby;
            lateDays = data.lateDays;
            earlyDays = data.earlyDays;
            leaveDays = data.leaveDays;
            lateLeaveDays = data.lateLeaveDays;
            weekendWorkDaysList = data.weekendWorkDaysList;
            dailyDetails = data.dailyDetails;

            totalFullLate = totalLateby + totalEarlyby;
            lateLeftFinal = (240 - totalFullLate).clamp(0, 240);
          });
        }
      },
      builder: (context, state) {
        if (state is AttendanceLoading) return ShimmerLoader();
        return _bodyContent();
      },
    );
  }

  Widget _bodyContent() {
    return CommonRefresh(
      onRefresh: () async {
        context.read<AttendanceBloc>().add(
          FetchAttendanceData(
            widget.user.userId,
            selectedMonth!,
            selectedYear!,
          ),
        );
        // Optional: log refresh if you want
      },

      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Row(
                children: [
                  // Month Dropdown
                  Expanded(
                    flex: 1,
                    child: _customDropdown<int>(
                      title: "Month",
                      selectedItem: selectedMonth!,
                      items: months,
                      labelBuilder: (m) =>
                          DateFormat('MMMM').format(DateTime(0, m)),
                      onSelected: (value) {
                        setState(() => selectedMonth = value);
                        context.read<AttendanceBloc>().add(
                          FetchAttendanceData(
                            widget.user.userId,
                            selectedMonth!,
                            selectedYear!,
                          ),
                        );

                        logPageActivity(
                          action: 'Changed Month',
                          metadata: {
                            'Month': selectedMonth,
                            'Year': selectedYear,
                          },
                        );
                      },
                    ),
                  ),

                  const SizedBox(width: 16),

                  // Year Dropdown
                  Expanded(
                    flex: 1,
                    child: _customDropdown<int>(
                      title: "Year",
                      selectedItem: selectedYear!,
                      items: years,
                      labelBuilder: (y) => y.toString(),
                      onSelected: (value) {
                        setState(() => selectedYear = value);
                        context.read<AttendanceBloc>().add(
                          FetchAttendanceData(
                            widget.user.userId,
                            selectedMonth!,
                            selectedYear!,
                          ),
                        );

                        logPageActivity(
                          action: 'Changed Year',
                          metadata: {
                            'Month': selectedMonth,
                            'Year': selectedYear,
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: const Color(0xFFE2E8F0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xFFE2E8F0),
                        ),
                        padding: const EdgeInsets.all(12),
                        width: 350,
                        height: 100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/icons/Attendance_Detail_ Calender.png',
                                  width: 20,
                                  height: 20,
                                  fit: BoxFit.cover,
                                ),
                                const SizedBox(width: 4),
                                const Text(
                                  "Attendance Details",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "$fullMonthName $selectedYear",
                              style: const TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),
              Row(
                children: [
                  AttendanceMiniCard(
                    cardTitle: "Worked Hours",
                    cardValue: workedHours,
                    cardIcon: Image.asset(
                      'assets/icons/Worked_Hours.png',
                      width: 24,
                      height: 24,
                      fit: BoxFit.cover,
                    ),
                  ),
                  AttendanceMiniCard(
                    cardTitle: "Leave Days",
                    cardValue: leaveDays,
                    cardIcon: Image.asset(
                      'assets/icons/Leave_Days.png',
                      width: 24,
                      height: 24,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),
              Row(
                children: [
                  AttendanceMiniCard(
                    cardTitle: "Late Days",
                    cardValue: lateDays,
                    cardIcon: Image.asset(
                      'assets/icons/Late_Days.png',
                      width: 24,
                      height: 24,
                      fit: BoxFit.cover,
                    ),
                  ),
                  AttendanceMiniCard(
                    cardTitle: "Early Days",
                    cardValue: earlyDays,
                    cardIcon: Image.asset(
                      'assets/icons/Early_Days.png',
                      width: 24,
                      height: 24,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),

              AttendanceMaincard(
                totalLateText: "Total Late (in Min)",
                lateLeftText: "Late Minutes Left",
                totalEarlyText: "Total Early (in min)",
                lateLeaveText: "Late Leave Days",
                totalLateValue: totalLateby.toString(),
                lateLeftValue: lateLeftFinal.toString(),
                totalEarlyValue: totalEarlyby.toString(),
                lateLeaveValue: lateLeaveDays % 1 == 0
                    ? lateLeaveDays.toInt().toString()
                    : lateLeaveDays.toString(),
              ),

              const Padding(
                padding: EdgeInsets.symmetric(vertical: 30),
                child: Center(
                  child: Text(
                    "Daily Records",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),

              if (dailyDetails.isEmpty)
                const Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      "No attendance records found",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                )
              else
                Column(
                  children: dailyDetails.map((attendance) {
                    final date = DateTime.tryParse(attendance.date);
                    final shortDate = date != null
                        ? DateFormat('EEE, MMM d').format(date)
                        : 'N/A';

                    final isWeekendWorked =
                        date != null &&
                        weekendWorkDaysList.contains(attendance.date);

                    final fullStatus = switch (attendance.status) {
                      'P' => 'Present',
                      'A' =>
                        isWeekendWorked
                            ? 'Absent'
                            : date != null && date.weekday == DateTime.sunday
                            ? 'Sunday'
                            : date != null && date.weekday == DateTime.saturday
                            ? 'Saturday'
                            : 'Absent',
                      'H' => 'Holiday',
                      _ => 'Unknown',
                    };

                    return DailyAttendanceRecords(
                      checkIn: attendance.checkIn,
                      checkOut: attendance.checkOut,
                      shortDate: shortDate,
                      fullDate: attendance.date,
                      status: fullStatus,
                      workedHrs: attendance.workedHours,
                      late: attendance.lateBy,
                      early: attendance.earlyBy,
                    );
                  }).toList(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
