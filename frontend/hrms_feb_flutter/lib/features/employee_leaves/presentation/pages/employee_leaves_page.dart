import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrms/app_colors.dart';
import 'package:hrms/core/logging/page_logger_mixin.dart';
import 'package:hrms/core/services/api_service.dart';
import 'package:hrms/core/widgets/custom_appbar.dart';
import 'package:hrms/core/widgets/custom_app_drawer.dart';
import 'package:hrms/core/widgets/custom_selection_bottom_sheet.dart';
import 'package:hrms/features/employee_leaves/presentation/controllers/employee_leaves_bloc.dart';
import 'package:hrms/features/employee_leaves/presentation/controllers/employee_leaves_event.dart';
import 'package:hrms/features/employee_leaves/presentation/controllers/employee_leaves_state.dart';
import 'package:hrms/features/employee_leaves/presentation/widgets/daily_records_card.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../auth/data/data_sources/auth_storage.dart';
import '../../../auth/domain/entities/user.dart';

class EmployeeLeavesPage extends StatelessWidget {
  final ApiService apiservice;

  const EmployeeLeavesPage({super.key, required this.apiservice});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Employee Leave", showBackButton: true),
      drawer: const CustomAppDrawer(),
      body: EmployeeLeavesBody(apiservice: apiservice),
    );
  }
}

class EmployeeLeavesBody extends StatefulWidget {
  final ApiService apiservice;

  const EmployeeLeavesBody({super.key, required this.apiservice});

  @override
  State<EmployeeLeavesBody> createState() => _EmployeeLeavesBodyState();
}

class _EmployeeLeavesBodyState extends State<EmployeeLeavesBody>
    with PageLogger<EmployeeLeavesBody> {
  @override
  String get pageName => 'Employee Leaves';

  /// Provide dynamic metadata for logging
  @override
  Map<String, dynamic>? get pageMetadata => {
    'Month': selectedMonth,
    'Year': selectedYear,
    'Status': selectedLeaveStatus,
  };

  String? selectedLeaveStatus = "Pending for approval";
  int? selectedMonth = DateTime.now().month;
  int? selectedYear = DateTime.now().year;
  late final List<int> yearItems = _generateYearItems();

  User? loggedUser;

  // -------------------- Dropdown helpers --------------------
  Widget _buildCustomDropdown<T>({
    required String title,
    required T? selectedItem,
    required List<T> items,
    required String Function(T) itemLabelBuilder,
    required void Function(T) onSelected,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: AppColors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        InkWell(
          onTap: () async {
            if (items.isEmpty) return;

            await showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (context) {
                final screenHeight = MediaQuery.of(context).size.height;
                final maxHeight = screenHeight * 0.5;

                return ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: maxHeight),
                  child: CustomSelectionBottomSheet<T>(
                    items: items,
                    selectedItem: selectedItem,
                    itemLabelBuilder: itemLabelBuilder,
                    onApply: (value) {
                      onSelected(value);
                    },
                  ),
                );
              },
            );
          },
          borderRadius: BorderRadius.circular(8),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            decoration: BoxDecoration(
              color: const Color(0xFFE6E6E6),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xFFE6E6E6), width: 1.5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  selectedItem != null
                      ? itemLabelBuilder(selectedItem)
                      : 'Select',
                  style: const TextStyle(fontSize: 16),
                ),
                const Icon(Icons.arrow_drop_down, color: Colors.black),
              ],
            ),
          ),
        ),
      ],
    );
  }

  List<int> _generateYearItems() {
    int currentYear = DateTime.now().year;
    // From currentYear down to 2021
    return List.generate(
      currentYear - 2021 + 1,
      (index) => currentYear - index,
    );
  }

  // -------------------- Lifecycle --------------------
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadUser();
    });
  }

  Future<void> _loadUser() async {
    final user = await AuthStorage.getUser();
    if (!mounted) return;

    loggedUser = user;

    if (loggedUser != null) {
      // Fetch initial leaves
      context.read<EmployeeLeavesBloc>().add(
        FetchEmployeeLeavesData(
          loggedUser!.userId,
          loggedUser!.emprole,
          selectedMonth!,
          selectedYear!,
        ),
      );
    }

    setState(() {});
  }

  String formatDays(double value) {
    if (value % 1 == 0) return value.toInt().toString();
    return value.toString();
  }

  // -------------------- Build --------------------
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: RefreshIndicator(
        onRefresh: () async {
          if (loggedUser != null) {
            context.read<EmployeeLeavesBloc>().add(
              FetchEmployeeLeavesData(
                loggedUser!.userId,
                loggedUser!.emprole,
                selectedMonth!,
                selectedYear!,
              ),
            );
          }
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              // Leave Status Dropdown
              _buildCustomDropdown<String>(
                title: 'Leave Status',
                selectedItem: selectedLeaveStatus,
                items: ['all', 'Approved', 'Pending for approval'],
                itemLabelBuilder: (item) => item == 'all' ? 'All' : item,
                onSelected: (value) {
                  setState(() {
                    selectedLeaveStatus = value;
                    logPageActivity(
                      action: 'Changed Leave Status',
                      metadata: pageMetadata,
                    );
                  });
                },
              ),
              const SizedBox(height: 20),
              // Month & Year dropdowns
              Row(
                children: [
                  Expanded(
                    child: _buildCustomDropdown<int>(
                      title: 'Select Month',
                      selectedItem: selectedMonth,
                      items: List.generate(12, (index) => index + 1),
                      itemLabelBuilder: (item) => [
                        "January",
                        "February",
                        "March",
                        "April",
                        "May",
                        "June",
                        "July",
                        "August",
                        "September",
                        "October",
                        "November",
                        "December",
                      ][item - 1],
                      onSelected: (value) {
                        setState(() {
                          selectedMonth = value;
                          if (loggedUser != null) {
                            context.read<EmployeeLeavesBloc>().add(
                              FetchEmployeeLeavesData(
                                loggedUser!.userId,
                                loggedUser!.emprole,
                                selectedMonth!,
                                selectedYear!,
                              ),
                            );
                          }
                          logPageActivity(
                            action: 'Changed Month',
                            metadata: pageMetadata,
                          );
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: _buildCustomDropdown<int>(
                      title: 'Select Year',
                      selectedItem: selectedYear,
                      items: yearItems,
                      itemLabelBuilder: (item) => item.toString(),
                      onSelected: (value) {
                        setState(() {
                          selectedYear = value;
                          if (loggedUser != null) {
                            context.read<EmployeeLeavesBloc>().add(
                              FetchEmployeeLeavesData(
                                loggedUser!.userId,
                                loggedUser!.emprole,
                                selectedMonth!,
                                selectedYear!,
                              ),
                            );
                          }
                          logPageActivity(
                            action: 'Changed Year',
                            metadata: pageMetadata,
                          );
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              const Text(
                'Employee Leaves',
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              BlocBuilder<EmployeeLeavesBloc, EmployeeLeavesState>(
                builder: (context, state) {
                  if (state is EmployeeLeavesLoading) {
                    return Center(
                      child: LoadingAnimationWidget.fourRotatingDots(
                        color: Colors.blue,
                        size: 50,
                      ),
                    );
                  }
                  if (state is EmployeeLeavesLoaded) {
                    final filteredLeaves = state.leavesData.where((leave) {
                      if (selectedLeaveStatus == 'all') return true;
                      return leave.status.toLowerCase().trim() ==
                          selectedLeaveStatus!.toLowerCase().trim();
                    }).toList();

                    if (filteredLeaves.isEmpty) {
                      return const Center(child: Text('No data found'));
                    }

                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: filteredLeaves.length,
                      itemBuilder: (context, index) {
                        final leave = filteredLeaves[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: DailyRecordsCard(
                            name: leave.name,
                            employeeId: leave.employeeId,
                            status: leave.status,
                            leaveType: leave.leaveType,
                            noOfDays: formatDays(leave.noOfDays),
                            fromDate: leave.fromDate ?? '',
                            toDate: leave.toDate ?? '',
                            appliedOn: leave.appliedOn ?? '',
                            reportingManagerName: leave.reportingManagerName,
                            onAction: (action) {
                              if (action is Map &&
                                  action['action'] == 'REJECT') {
                                context.read<EmployeeLeavesBloc>().add(
                                  LeaveActionEvent(
                                    action: action['action'],
                                    userId: loggedUser!.userId,
                                    emprole: loggedUser!.emprole,
                                    leave: leave,
                                    month: selectedMonth!,
                                    year: selectedYear!,
                                    approverComments:
                                        action['approverComments'],
                                  ),
                                );
                              } else {
                                context.read<EmployeeLeavesBloc>().add(
                                  LeaveActionEvent(
                                    action: action,
                                    userId: loggedUser!.userId,
                                    emprole: loggedUser!.emprole,
                                    leave: leave,
                                    month: selectedMonth!,
                                    year: selectedYear!,
                                  ),
                                );
                              }
                            },
                          ),
                        );
                      },
                    );
                  }
                  if (state is EmployeeLeavesError) {
                    return Center(child: Text(state.message));
                  }
                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
