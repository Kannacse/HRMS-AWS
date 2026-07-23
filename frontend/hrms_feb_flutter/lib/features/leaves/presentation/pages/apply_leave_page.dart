import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrms/core/logging/page_logger_mixin.dart';
import 'package:hrms/core/widgets/common_refresh.dart';
import 'package:hrms/core/widgets/custom_app_drawer.dart';
import 'package:hrms/core/widgets/custom_appbar.dart';
import 'package:hrms/core/widgets/custom_selection_bottom_sheet.dart';
import 'package:hrms/features/leaves/data/data_sources/holiday_weekend_remote_data_source.dart';
import 'package:hrms/features/leaves/data/repositories/holiday_weekend_repository_impl.dart';
import 'package:hrms/features/leaves/presentation/controllers/holiday_weekend_bloc.dart';
import 'package:hrms/features/leaves/presentation/controllers/holiday_weekend_event.dart';
import 'package:hrms/features/leaves/presentation/controllers/holiday_weekend_state.dart';
import 'package:hrms/features/leaves/presentation/controllers/leave_type_bloc.dart';
import 'package:hrms/features/leaves/presentation/widgets/late_early_selector.dart';
import '../../../auth/data/data_sources/auth_storage.dart';
import '../controllers/apply_leave_bloc.dart';
import '../../../../app_colors.dart';
import '../../presentation/widgets/custom_leave_button.dart';
import '../controllers/apply_leave_event.dart';
import '../controllers/apply_leave_state.dart';
import '../../data/data_sources/apply_leave_remote_data_source.dart';
import '../../data/repositories/leave_repository_impl.dart';
import '../../../../core/services/api_service.dart';
import '../controllers/leave_type_event.dart';
import '../controllers/leave_type_state.dart';
import 'package:intl/intl.dart';
import '../../data/data_sources/leave_type_remote_data_source.dart';
import '../../data/repositories/leave_type_repository.impl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../widgets/leave_mode_selector.dart';
import '../widgets/leave_period_selector.dart';

class ApplyLeavePage extends StatelessWidget {
  final ApiService apiservice;

  const ApplyLeavePage({super.key, required this.apiservice});

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

        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) {
                final remoteDataSource = ApplyLeaveRemoteDataSource(apiservice);
                final repository = LeaveRepositoryImpl(remoteDataSource);
                final bloc = ApplyLeaveBloc(repository);

                // Dispatch initial event
                return bloc;
              },
            ),
            BlocProvider<LeaveTypeBloc>(
              create: (context) {
                final remoteDataSource = LeaveTypeRemoteDataSource(apiservice);
                final repository = LeaveTypeRepositoryImpl(remoteDataSource);
                final bloc = LeaveTypeBloc(repository);
                // dispatch initial event here
                bloc.add(FetchLeaveTypes(user.userId));

                return bloc;
              },
            ),
            BlocProvider(
              create: (context) {
                final remote = HolidayWeekendRemoteDataSource(apiservice);
                final repository = HolidayWeekendRepositoryImpl(remote);
                final bloc = HolidayWeekendBloc(repository);

                // DISPATCH EVENT HERE (ONCE)
                bloc.add(FetchHolidayWeekend(user.userId, DateTime.now().year));

                return bloc;
              },
            ),
          ],

          child: Scaffold(
            appBar: const CustomAppBar(
              title: "Leave Request",
              showBackButton: true,
            ),
            drawer: const CustomAppDrawer(),

            body: MultiBlocListener(
              listeners: [
                BlocListener<HolidayWeekendBloc, HolidayWeekendState>(
                  listener: (context, state) {
                    if (state is HolidayWeekendLoaded) {}
                  },
                ),
              ],

              child: BlocConsumer<ApplyLeaveBloc, ApplyLeaveState>(
                listener: (context, state) {
                  if (state is ApplyLeaveLoaded) {
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              state.success ? Icons.check_circle : Icons.error,
                              color: state.success ? Colors.green : Colors.red,
                              size: 50,
                            ),
                            const SizedBox(height: 15),
                            Text(
                              state.success ? "Success!" : "Error!",
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              state.successMsg,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        actions: [
                          Center(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: state.success
                                    ? Colors.green
                                    : Colors.red,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop(); // Close dialog
                                if (state.success) {
                                  Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    '/dashboard',
                                    (route) => false,
                                  );
                                }
                              },
                              child: const Text("OK"),
                            ),
                          ),
                        ],
                      ),
                    );
                  } else if (state is ApplyLeaveError) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(state.message)));
                  }
                },

                builder: (context, state) {
                  return ApplyLeaveBody(user: user);
                },
              ),
            ),
          ),
        );
      },
    );
  }
}

class ApplyLeaveBody extends StatefulWidget {
  final dynamic user;

  const ApplyLeaveBody({super.key, required this.user});

  @override
  _ApplyLeaveBodyState createState() => _ApplyLeaveBodyState();
}

class _ApplyLeaveBodyState extends State<ApplyLeaveBody> with PageLogger<ApplyLeaveBody> {
  @override
  String get pageName => 'Apply Leave';

  @override
  void initState() {
    super.initState();

    // Get Now
    final now = DateTime.now();

    // Set selectedFromDate to Midnight (00:00:00)
    selectedFromDate = _stripTime(now);

    // Set text
    _fromdatepicker.text = "${now.day}/${now.month}/${now.year}";
  }

  DateTime _stripTime(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  int? selectedLeaveType;

  List<int> weekdayList = [];
  int sandwichLeave = 0;

  bool _frontendErrorShown = false;

  String leavetypeintext = '';

  DateTime? selectedFromDate;
  DateTime? selectedToDate;

  final TextEditingController _fromdatepicker = TextEditingController();
  final TextEditingController _todatepicker = TextEditingController();
  final TextEditingController _compdatepicker = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController totalDaysController = TextEditingController();

  final TextEditingController compOffHoursCtrl = TextEditingController();
  final TextEditingController compOffMinutesCtrl = TextEditingController();

  double remainingLeaves = 0.0;

  int selectedLateEarly = 1;

  //comp off
  void _autoFormatHours() {
    int h = int.tryParse(compOffHoursCtrl.text) ?? 0;

    if (h < 0) h = 0;
    if (h > 23) h = 23;

    compOffHoursCtrl.text = h.toString().padLeft(2, '0');
  }

  void _autoFormatMinutes() {
    int m = int.tryParse(compOffMinutesCtrl.text) ?? 0;

    if (m < 0) m = 0;
    if (m > 59) m = 59;

    compOffMinutesCtrl.text = m.toString().padLeft(2, '0');
  }

  String get compOffDuration {
    final h = compOffHoursCtrl.text.padLeft(2, '0');
    final m = compOffMinutesCtrl.text.padLeft(2, '0');
    return '$h:$m';
  }

  void _openLeaveTypeSheet(
    BuildContext parentContext,
    Map<int, String> leaveTypes,
  ) {
    showModalBottomSheet(
      context: parentContext,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (sheetContext) {
        return CustomSelectionBottomSheet<int>(
          items: leaveTypes.keys.toList(),
          selectedItem: selectedLeaveType,
          itemLabelBuilder: (id) => leaveTypes[id]!,
          onApply: (value) {
            setState(() {
              selectedLeaveType = value;
              leavetypeintext = leaveTypes[value]!;
              leaveTypeError = null;
            });

            // Recalculate days
            if (selectedFromDate != null && selectedToDate != null) {
              _calculateTotalDays();
            }

            if (selectedDay == 2 ){
              selectedToDate = selectedFromDate;
              _todatepicker.text =
                  "${selectedFromDate!.day}/${selectedFromDate!.month}/${selectedFromDate!.year}";
              totalDaysController.text = "0.5";
            }

            // Fetch balance (skip OT & Comp Off)
            if (value != 8 && value != 10) {
              parentContext.read<ApplyLeaveBloc>().add(
                FetchLeaveBalance(value, widget.user.userId),
              );
            }

            //show dialog box for OT and comp off
            if (value == 8 || value == 10) {
              setState(() {
                // CLEAR TO DATE
                selectedToDate = null;
                _todatepicker.clear();
                totalDaysController.clear();
                selectedDay = 1;
                selectedPeriod = null;
              });
              Future.delayed(const Duration(milliseconds: 200), () {
                showDialog(
                  context: parentContext,
                  barrierDismissible: false,
                  builder: (dialogContext) {
                    return AlertDialog(
                      title: const Text(
                        'Alert',
                        textAlign: TextAlign.center,

                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      content: Text(
                        value == 8
                            ? 'Please enter the time in the reason box for manager approval. '
                                  'If approved, the chosen date will be reflected in attendance.'
                            : 'Please select your comp off working day.',
                        style: TextStyle(fontSize: 16),
                      ),
                      actions: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.secondaryBlue,
                            foregroundColor: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.of(dialogContext).pop();
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              });
            }
          },
        );
      },
    );
  }

  HolidayWeekendLoaded? _holidayState(BuildContext context) {
    final state = context.read<HolidayWeekendBloc>().state;
    return state is HolidayWeekendLoaded ? state : null;
  }

  bool isSunday(DateTime date) {
    return date.weekday == DateTime.sunday;
  }

  bool isSaturday(DateTime date) {
    return date.weekday == DateTime.saturday;
  }

  bool isHoliday(DateTime date, List<String> holidays) {
    final formatted = DateFormat('yyyy-MM-dd').format(date);
    return holidays.contains(formatted);
  }

  bool isWorkingSaturday(DateTime date, List<String> workingSaturdays) {
    final formatted = DateFormat('yyyy-MM-dd').format(date);
    return workingSaturdays.contains(formatted);
  }

  bool isDisabledDate(BuildContext context, DateTime date) {
    //maternity leave (allow all dates)
    if (selectedLeaveType == 9) return false;

    final state = _holidayState(context);
    if (state == null) return false;

    // ❌ Disable all Sundays
    if (isSunday(date)) return true;

    // ❌ Disable holidays
    if (isHoliday(date, state.holidays)) return true;

    // ❌ Disable Saturdays EXCEPT working Saturdays
    if (isSaturday(date) && !isWorkingSaturday(date, state.weekends)) {
      return true;
    }

    return false;
  }

  // Helper to find the next available valid date
  DateTime _getValidInitialDate(BuildContext context) {
    // Start with either the already selected date OR today
    DateTime date = selectedFromDate ?? _stripTime(DateTime.now());

    // If the date is disabled, keep adding 1 day until we find a valid one
    while (isDisabledDate(context, date)) {
      date = date.add(const Duration(days: 1));
    }
    return date;
  }

  // Open from Date Picker
  Future<void> _pickFromDate() async {
    final DateTime initialDate = _getValidInitialDate(context);
    final DateTime? fromPicked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      selectableDayPredicate: (date) {
        return !isDisabledDate(context, date);
      },
    );

    if (fromPicked != null) {
      setState(() {
        selectedFromDate = fromPicked;
        _fromdatepicker.text =
            "${fromPicked.day}/${fromPicked.month}/${fromPicked.year}";

        // 🔥 LIVE VALIDATION
        if (selectedToDate != null &&
            selectedFromDate!.isAfter(selectedToDate!)) {
          fromDateError = "From date should be less than To date";
          toDateError = "To date should be greater than From date";
        } else {
          fromDateError = null;
          toDateError = null;
        }

        // Half-day logic
        if (selectedDay == 2) {
          selectedToDate = fromPicked;
          _todatepicker.text =
              "${fromPicked.day}/${fromPicked.month}/${fromPicked.year}";
          totalDaysController.text = "0.5";
        }
      });
    }

    // Only calculate for FULL DAY
    if (selectedDay == 1) {
      _calculateTotalDays();
    }
  }

  // Open to date picker
  Future<void> _pickToDate() async {
    // Half day → just return FromDate as ToDate
    if (selectedDay == 2) {
      if (selectedFromDate != null) {
        setState(() {
          selectedToDate = selectedFromDate;
          _todatepicker.text =
              "${selectedFromDate!.day}/${selectedFromDate!.month}/${selectedFromDate!.year}";
          toDateError = null;
        });
      }
      return; // stop here
    }
    final DateTime initialDate = _getValidInitialDate(context);
    // Full day → open picker
    final DateTime? toPicked = await showDatePicker(
      context: context,
      initialDate: selectedFromDate ?? initialDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      selectableDayPredicate: (date) {
        return !isDisabledDate(context, date);
      },
    );

    if (toPicked != null) {
      setState(() {
        selectedToDate = toPicked;
        _todatepicker.text =
            "${toPicked.day}/${toPicked.month}/${toPicked.year}";

        // 🔥 LIVE VALIDATION
        if (selectedFromDate != null &&
            selectedToDate!.isBefore(selectedFromDate!)) {
          toDateError = "To date should be greater than From date";
          fromDateError = "From date should be less than To date";
        } else {
          toDateError = null;
          fromDateError = null;
        }
      });
    }
    if (fromDateError == null && toDateError == null) {
      _calculateTotalDays();
    }
  }

  Future<void> _pickCompDate() async {
    final DateTime initialDate = _getValidInitialDate(context);
    final DateTime? compPicked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      selectableDayPredicate: (date) {
        return isDisabledDate(context, date);
      },
    );

    if (compPicked != null) {
      setState(() {
        selectedToDate = compPicked;
        _todatepicker.text =
            "${compPicked.day}/${compPicked.month}/${compPicked.year}";
      });
    }
  }

  // Calculate total days
  void _calculateTotalDays() {
    weekdayList.clear();

    if (selectedFromDate == null || selectedToDate == null) {
      totalDaysController.text = '';
      return;
    }

    if (selectedToDate!.isBefore(selectedFromDate!)) {
      totalDaysController.text = '0';
      return;
    }

    final state = _holidayState(context);
    if (state == null) return;

    int validDays = 0;
    DateTime current = selectedFromDate!;

    while (!current.isAfter(selectedToDate!)) {
      bool isValidDay;
      if (selectedLeaveType == 9) {
        // Count ALL days (including weekends & holidays)
        isValidDay = true;
      } else {
        // Exclude disabled dates for other leave types
        isValidDay = !isDisabledDate(context, current);
      }
      if (isValidDay) {
        validDays++;

        // Collect weekday ONLY for non-maternity
        if (selectedLeaveType != 9) {
          weekdayList.add(current.weekday); // 1–7
        }
      }
      current = current.add(const Duration(days: 1));
    }

    totalDaysController.text = validDays.toString();
  }

  int selectedDay = 1;
  int? selectedPeriod = 1;

  // Validation error messages
  String? descriptionError;
  String? leaveTypeError;
  String? fromDateError;
  String? toDateError;
  String? compOffHourError;

  void _validateAndApplyLeave() {
    _frontendErrorShown = false;
    setState(() {
      descriptionError = descriptionController.text.trim().isEmpty
          ? "Please enter description"
          : null;

      leaveTypeError = selectedLeaveType == null
          ? "Please select leave type"
          : null;

      fromDateError = selectedFromDate == null
          ? "Please select from date"
          : null;

      toDateError = selectedDay == 1 && selectedToDate == null
          ? "Please select to date"
          : null;
    });

    // Overtime validation
    if (selectedLeaveType == 8) {
      final int hours = int.tryParse(compOffHoursCtrl.text) ?? 0;
      final int minutes = int.tryParse(compOffMinutesCtrl.text) ?? 0;

      if (hours == 0 && minutes == 0) {
        setState(() {
          compOffHourError = "Please enter compensatory hours or minutes";
        });
        return;
      } else {
        setState(() {
          compOffHourError = null;
        });
      }
    }

    // Normalize OT time ONLY after validation passes
    if (selectedLeaveType == 8) {
      if (compOffHoursCtrl.text.trim().isEmpty) {
        compOffHoursCtrl.text = "00";
      }
      if (compOffMinutesCtrl.text.trim().isEmpty) {
        compOffMinutesCtrl.text = "00";
      }

      _autoFormatHours();
      _autoFormatMinutes();
    }

    if (weekdayList.contains(DateTime.monday) ||
        weekdayList.contains(DateTime.friday)) {
      sandwichLeave = 1;
    } else {
      sandwichLeave = 0;
    }

    if (descriptionController.text.isNotEmpty &&
        selectedLeaveType != null &&
        selectedFromDate != null &&
        (selectedLeaveType == 8 || selectedToDate != null)) {
      double totalDaysDouble = double.tryParse(totalDaysController.text) ?? 0.0;

      // Validation for Casual Leave
      if (selectedLeaveType == 1) {
        final now = DateTime.now();
        final today = DateTime(now.year, now.month, now.day);
        final today9am = DateTime(now.year, now.month, now.day, 9, 0, 0);
        // If applying for today
        if (selectedFromDate!.year == now.year &&
            selectedFromDate!.month == now.month &&
            selectedFromDate!.day == now.day) {
          if (now.isAfter(today9am)) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Alert'),
                  content: Text('You cannot apply for today after 9:00 AM.'),
                  actions: [
                    TextButton(
                      child: Text('OK'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
            _frontendErrorShown = true;
            return;
          }
        }
        // If applying for a date before today (past days)
        if (selectedFromDate!.isBefore(today)) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Alert'),
                content: Text(
                  'You cannot apply casual leave for past dates. Only current or future dates are allowed.',
                ),
                actions: [
                  TextButton(
                    child: Text('OK'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
          _frontendErrorShown = true;
          return;
        }
      }

      //LOP Validation
      if (totalDaysDouble > remainingLeaves) {
        double lossOfPay = totalDaysDouble - remainingLeaves;
        String formatNum(num n) =>
            n % 1 == 0 ? n.toInt().toString() : n.toString();
        final parentContext = context;
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Alert'),
              content: Text(
                "Kindly note your Leave balance is ${formatNum(remainingLeaves)} ${remainingLeaves > 1 ? 'days' : 'day'}, "
                "Your leave request is for a total of ${formatNum(totalDaysDouble)} ${totalDaysDouble > 1 ? 'days' : 'day'} in $leavetypeintext. "
                "The Remaining ${formatNum(lossOfPay)} ${lossOfPay > 1 ? 'days' : 'day'} will be considered as Loss of Pay.",
              ),
              actions: [
                TextButton(
                  child: Text('Cancel'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                    if (selectedDay == 1) {
                      selectedPeriod = null;
                    }
                    _submitLeaveRequest(parentContext);
                  },
                ),
              ],
            );
          },
        );
        _frontendErrorShown = true;
        return;
      }

      if (selectedDay == 1) {
        selectedPeriod = null;
      }
      if (_frontendErrorShown) return;
      _submitLeaveRequest(context);
    }
  }

  void _submitLeaveRequest(BuildContext context) {
    final dateFormat = DateFormat('yyyy-MM-dd');
    final DateTime from = selectedFromDate!;
    final DateTime to = selectedLeaveType == 8 || selectedDay == 2
        ? selectedFromDate!
        : selectedToDate!;

    final leaveData = {
      'userId': widget.user.userId,
      'description': descriptionController.text,
      'leavetypeId': selectedLeaveType,
      'fromDate': dateFormat.format(from),
      'toDate': dateFormat.format(to),
      'appliedLeavesdaycount': double.tryParse(totalDaysController.text) ?? 0.0,
      'leaveDay': selectedDay,
      'leavePeriod': selectedPeriod,
      'compensatory_hrs': selectedLeaveType == 8 ? compOffDuration : null,
      'late_early': selectedLeaveType == 8 ? selectedLateEarly : null,
      'sandwichLeave': sandwichLeave,
    };
    context.read<ApplyLeaveBloc>().add(ApplyLeave(leaveData));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HolidayWeekendBloc, HolidayWeekendState>(
      listener: (context, state) {
        if (state is HolidayWeekendLoaded) {
          setState(() {
            // 3. Once holidays are loaded, validate the initial date.
            // If 'today' (set in initState) is a holiday/Sunday,
            // this function finds the next valid working day.
            final validDate = _getValidInitialDate(context);

            selectedFromDate = validDate;
            _fromdatepicker.text =
                "${validDate.day}/${validDate.month}/${validDate.year}";

            if (selectedDay == 1 && selectedToDate == null) {
              // selectedToDate = validDate;
            }

            // Recalculate days
            _calculateTotalDays();
          });
        }
      },

      child: BlocBuilder<LeaveTypeBloc, LeaveTypeState>(
        builder: (context, state) {
          if (state is LeaveTypeLoading) {
            return Center(
              child: LoadingAnimationWidget.fourRotatingDots(
                color: Colors.blue,
                size: 50,
              ),
            );
          } else if (state is LeaveTypeLoaded) {
            final Map<int, String> leaveTypes = {
              ...state.leaveTypes,
              // 8: "Overtime Request",
              // 10: "Comp Off",
            };

            // Use leaveTypes in your dropdowns or lists
            return CommonRefresh(
              onRefresh: () async {
                // Clear all entered data
                setState(() {
                  selectedLeaveType = null;
                  final now = DateTime.now();
                  selectedFromDate = _stripTime(now);
                  _fromdatepicker.text = "${now.day}/${now.month}/${now.year}";
                  selectedToDate = null;
                  _fromdatepicker.clear();
                  _todatepicker.clear();
                  _compdatepicker.clear();
                  descriptionController.clear();
                  totalDaysController.clear();
                  selectedDay = 1;
                  selectedPeriod = 1;
                  descriptionError = null;
                  leaveTypeError = null;
                  fromDateError = null;
                  toDateError = null;
                  compOffHoursCtrl.clear();
                  compOffMinutesCtrl.clear();
                  selectedLateEarly = 1;
                });
                context.read<ApplyLeaveBloc>().add(ResetLeaveBalance());

                // Reload leave types and holidays
                context.read<LeaveTypeBloc>().add(
                  FetchLeaveTypes(widget.user.userId),
                );
                context.read<HolidayWeekendBloc>().add(
                  FetchHolidayWeekend(widget.user.userId, DateTime.now().year),
                );
              },
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 40),
                      Text(
                        "Description",
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        width: 400,
                        height: 120,
                        child: TextField(
                          controller: descriptionController,
                          maxLength: 300,
                          expands: true,
                          minLines: null,
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                            hintText: "Enter description...",
                            filled: true,
                            fillColor: Color(0xFFE6E6E6),
                            contentPadding: EdgeInsets.all(15),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: Color(0xFFE6E6E6), // border color
                                width: 1.5, // border width
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: Color(0xFFE6E6E6), // border color
                                width: 1.5, // border width
                              ),
                            ),
                          ),
                          onEditingComplete: () {
                            FocusScope.of(
                              context,
                            ).unfocus(); // ⬅ hides keyboard
                          },
                          onChanged: (_) {
                            if (descriptionError != null) {
                              setState(() => descriptionError = null);
                            }
                          },
                        ),
                      ),
                      if (descriptionError != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Text(
                            descriptionError!,
                            style: TextStyle(color: Colors.red, fontSize: 12),
                          ),
                        ),

                      SizedBox(height: 20),

                      Text(
                        "Leave Type",
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        width: 400,
                        child: SizedBox(
                          width: 400,
                          child: InkWell(
                            onTap: () =>
                                _openLeaveTypeSheet(context, leaveTypes),
                            child: Container(
                              height: 48,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFFE6E6E6),
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: const Color(0xFFE6E6E6),
                                  width: 1.5,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    selectedLeaveType == null
                                        ? "Select Leave Type"
                                        : leaveTypes[selectedLeaveType]!,
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                  const Icon(Icons.keyboard_arrow_down_rounded),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                      if (leaveTypeError != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Text(
                            leaveTypeError!,
                            style: TextStyle(color: Colors.red, fontSize: 12),
                          ),
                        ),

                      SizedBox(height: 40),
                      // Progress bar
                      BlocBuilder<ApplyLeaveBloc, ApplyLeaveState>(
                        builder: (context, state) {
                          final double usedLeaves = state.usedLeaves;
                          final double totalLeaves = state.totalLeaves;
                          final bool hasBalance = totalLeaves > 0;
                          final bool isOTorCompOff =
                              selectedLeaveType == 8 || selectedLeaveType == 10;

                          // Avoid division by zero
                          final double safeTotal = totalLeaves > 0
                              ? totalLeaves.toDouble()
                              : 1.0;

                          // Clamp used leaves
                          final double safeUsedLeaves = usedLeaves.clamp(
                            0.0,
                            safeTotal,
                          );

                          // Progress value
                          final double progressValue = hasBalance
                              ? (safeUsedLeaves / safeTotal).clamp(0.0, 1.0)
                              : 0.0;

                          // Remaining leaves
                          remainingLeaves = hasBalance
                              ? (safeTotal - safeUsedLeaves).clamp(
                                  0.0,
                                  double.infinity,
                                )
                              : 0.0;

                          final String progressText = hasBalance
                              ? "${usedLeaves % 1 == 0 ? usedLeaves.toInt() : usedLeaves}/${totalLeaves % 1 == 0 ? totalLeaves.toInt() : totalLeaves}"
                              : "0/0";

                          final bool noLeavesLeft =
                              hasBalance && safeUsedLeaves >= safeTotal;

                          final String statusText = noLeavesLeft
                              ? "No leaves remaining"
                              : "${remainingLeaves % 1 == 0 ? remainingLeaves.toStringAsFixed(0) : remainingLeaves.toStringAsFixed(1)} ${remainingLeaves > 1 ? "days" : "day"} remaining";

                          if (isOTorCompOff) {
                            return const SizedBox.shrink(); // 🚫 Hide balance
                          }

                          return Column(
                            children: [
                              Container(
                                height: 30,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: const Color(0xFFE6E6E6),
                                    width: 1.5,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 6,
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Stack(
                                          children: [
                                            Container(
                                              height: 10,
                                              decoration: BoxDecoration(
                                                color: const Color(0xFFE6E6E6),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                            ),
                                            FractionallySizedBox(
                                              widthFactor: progressValue,
                                              child: Container(
                                                height: 10,
                                                decoration: BoxDecoration(
                                                  gradient:
                                                      const LinearGradient(
                                                        colors: [
                                                          Color(0xFF003F7F),
                                                          Color(0xFF0096FF),
                                                        ],
                                                      ),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        progressText,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              const SizedBox(height: 6),

                              if (hasBalance)
                                Text(
                                  statusText,
                                  style: const TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                            ],
                          );
                        },
                      ),
                      if (selectedLeaveType != 8 && selectedLeaveType != 10)
                        SizedBox(height: 20),

                      if (selectedLeaveType != 8 && selectedLeaveType != 10)
                        Text(
                          "Leave Mode",
                          style: TextStyle(
                            color: AppColors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      if (selectedLeaveType != 8 && selectedLeaveType != 10)
                        SizedBox(height: 10),

                      //Radio buttons for leave mode
                      if (selectedLeaveType != 8 && selectedLeaveType != 10)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            LeaveModeSelector(
                              label: "Full Day",
                              value: 1,
                              selectedDay: selectedDay,
                              onChanged: (value) {
                                setState(() {
                                  selectedDay = value;
                                  fromDateError = null;
                                  toDateError = null;

                                  if (selectedDay == 2 &&
                                      selectedFromDate != null) {
                                    // Half day → force same date & 0.5
                                    selectedToDate = selectedFromDate;
                                    _todatepicker.text =
                                        "${selectedFromDate!.day}/${selectedFromDate!.month}/${selectedFromDate!.year}";
                                    totalDaysController.text = "0.5";
                                  } else if (selectedDay == 1) {
                                    // Back to full day → recalculate
                                    _calculateTotalDays();
                                  }
                                });
                              },
                            ),
                            LeaveModeSelector(
                              label: "Half Day",
                              value: 2,
                              selectedDay: selectedDay,
                              onChanged: (value) {
                                setState(() {
                                  selectedDay = value;
                                  fromDateError = null;
                                  toDateError = null;

                                  if (selectedDay == 2 &&
                                      selectedFromDate != null) {
                                    // Half day → force same date & 0.5
                                    selectedToDate = selectedFromDate;
                                    _todatepicker.text =
                                        "${selectedFromDate!.day}/${selectedFromDate!.month}/${selectedFromDate!.year}";
                                    totalDaysController.text = "0.5";
                                  } else if (selectedDay == 1) {
                                    // Back to full day → recalculate
                                    _calculateTotalDays();
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                      if (selectedLeaveType != 8 && selectedLeaveType != 10)
                        SizedBox(height: 20),

                      if (selectedDay == 2)
                        if (selectedLeaveType != 8 && selectedLeaveType != 10)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //Leave Period Selection
                              Text(
                                "Leave Period",
                                style: TextStyle(
                                  color: AppColors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              if (selectedLeaveType != 8 &&
                                  selectedLeaveType != 10)
                                SizedBox(height: 10),

                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  LeavePeriodSelector(
                                    label: "Morning",
                                    value: 1,
                                    selectedPeriod: selectedPeriod,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedPeriod = value;
                                      });
                                    },
                                  ),
                                  LeavePeriodSelector(
                                    label: "Afternoon",
                                    value: 2,
                                    selectedPeriod: selectedPeriod,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedPeriod = value;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                      if (selectedDay == 2)
                        if (selectedLeaveType != 8 && selectedLeaveType != 10)
                          SizedBox(height: 20),

                      // from date
                      SizedBox(
                        width: 400,
                        height: 100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              selectedDay == 1 &&
                                      selectedLeaveType != 8 &&
                                      selectedLeaveType != 10
                                  ? "From Date"
                                  : "Date",
                              style: TextStyle(
                                color: AppColors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            TextField(
                              controller: _fromdatepicker,
                              readOnly: true,
                              onTap: _pickFromDate,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Color(0xFFE6E6E6),
                                hintText: "Select date",
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: Color(0xFFE6E6E6), // border color
                                    width: 1.5,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: Color(0xFFE6E6E6), // border color
                                    width: 1.5,
                                  ),
                                ),
                                suffixIcon: IconButton(
                                  icon: const Icon(
                                    Icons.calendar_today,
                                  ), // custom icon
                                  onPressed: _pickFromDate,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      if (fromDateError != null && selectedDay == 1)
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Text(
                            fromDateError!,
                            style: TextStyle(color: Colors.red, fontSize: 12),
                          ),
                        ),

                      if (selectedDay == 1)
                        if (selectedLeaveType != 8) SizedBox(height: 20),
                      if (selectedDay == 1)
                        if (selectedLeaveType != 8)
                          SizedBox(
                            width: 400,
                            height: 100,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  selectedLeaveType != 10
                                      ? "To Date"
                                      : "Compensatory Date",
                                  style: TextStyle(
                                    color: AppColors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 10),
                                if (selectedLeaveType != 10)
                                  TextField(
                                    controller: _todatepicker,
                                    readOnly: true,
                                    onTap: _pickToDate,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Color(0xFFE6E6E6),
                                      hintText: "Select date",
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide(
                                          color: Color(
                                            0xFFE6E6E6,
                                          ), // border color
                                          width: 1.5,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide(
                                          color: Color(
                                            0xFFE6E6E6,
                                          ), // border color
                                          width: 1.5,
                                        ),
                                      ),

                                      suffixIcon: IconButton(
                                        icon: const Icon(
                                          Icons.calendar_today,
                                        ), // custom icon
                                        onPressed: _pickToDate,
                                      ),
                                    ),
                                  ),

                                if (selectedLeaveType == 10)
                                  TextField(
                                    controller: _compdatepicker,
                                    readOnly: true,
                                    onTap: _pickCompDate,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Color(0xFFE6E6E6),
                                      hintText: "Select date",
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide(
                                          color: Color(
                                            0xFFE6E6E6,
                                          ), // border color
                                          width: 1.5,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide(
                                          color: Color(
                                            0xFFE6E6E6,
                                          ), // border color
                                          width: 1.5,
                                        ),
                                      ),

                                      suffixIcon: IconButton(
                                        icon: const Icon(
                                          Icons.calendar_today,
                                        ), // custom icon
                                        onPressed: _pickCompDate,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                      if (toDateError != null && selectedDay == 1)
                        if (selectedLeaveType != 8)
                          Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Text(
                              toDateError!,
                              style: TextStyle(color: Colors.red, fontSize: 12),
                            ),
                          ),

                      SizedBox(height: 20),

                      if (selectedLeaveType == 8)
                        SizedBox(
                          width: 400,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Compensatory Hours",
                                style: TextStyle(
                                  color: AppColors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10),

                              Row(
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      controller: compOffHoursCtrl,
                                      keyboardType: TextInputType.number,
                                      textInputAction: TextInputAction.next,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                        LengthLimitingTextInputFormatter(2),
                                      ],
                                      decoration: const InputDecoration(
                                        labelText: 'Hours',
                                        hintText: '0–23',
                                      ),
                                      onEditingComplete: () {
                                        _autoFormatHours();
                                        FocusScope.of(context).nextFocus();
                                      },
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: TextFormField(
                                      controller: compOffMinutesCtrl,
                                      keyboardType: TextInputType.number,
                                      textInputAction: TextInputAction.done,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                        LengthLimitingTextInputFormatter(2),
                                      ],
                                      decoration: const InputDecoration(
                                        labelText: 'Minutes',
                                        hintText: '0–59',
                                      ),
                                      onEditingComplete: () {
                                        _autoFormatMinutes();
                                        FocusScope.of(context).unfocus();
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              if (compOffHourError != null)
                                Padding(
                                  padding: const EdgeInsets.only(top: 6),
                                  child: Text(
                                    compOffHourError!,
                                    style: const TextStyle(
                                      color: Colors.red,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              SizedBox(height: 20),
                            ],
                          ),
                        ),

                      if (selectedLeaveType == 8)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //Leave Period Selection
                            Text(
                              "Late/early",
                              style: TextStyle(
                                color: AppColors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                LateEarlySelector(
                                  label: "Late",
                                  value: 1,
                                  selectedLateEarly: selectedLateEarly,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedLateEarly = value;
                                    });
                                  },
                                ),
                                LateEarlySelector(
                                  label: "Early",
                                  value: 2,
                                  selectedLateEarly: selectedLateEarly,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedLateEarly = value;
                                    });
                                  },
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                          ],
                        ),

                      if (selectedLeaveType != 8)
                        SizedBox(
                          width: 400,
                          height: 90,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Total Days",
                                style: TextStyle(
                                  color: AppColors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextField(
                                controller: totalDaysController,
                                readOnly: true,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Color(0xFFE6E6E6),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                      color: Color(0xFFE6E6E6), // border color
                                      width: 1.5,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                      color: Color(0xFFE6E6E6), // border color
                                      width: 1.5,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                      if (selectedLeaveType != 8) SizedBox(height: 20),

                      CustomLeaveButton(
                        text: "Apply",
                        onPressed: _validateAndApplyLeave,
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else if (state is LeaveTypeError) {
            return Center(child: Text(state.message));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
