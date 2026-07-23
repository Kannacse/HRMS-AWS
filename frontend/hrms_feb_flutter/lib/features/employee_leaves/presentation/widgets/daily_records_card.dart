import 'package:flutter/material.dart';
import 'package:hrms/app_colors.dart';

class DailyRecordsCard extends StatelessWidget {
  const DailyRecordsCard({
    super.key,
    required this.name,
    required this.employeeId,
    required this.status,
    required this.leaveType,
    required this.noOfDays,
    required this.fromDate,
    required this.toDate,
    required this.appliedOn,
    required this.reportingManagerName,
    required this.onAction,
  });

  final String name;
  final String employeeId;
  final String status;
  final String leaveType;
  final String noOfDays;
  final String fromDate;
  final String toDate;
  final String appliedOn;
  final String reportingManagerName;
  // NOTE: Ideally, this function should return a Future so we can await it
  final Function(dynamic action) onAction;

  // Helper method to get status colors
  Map<String, Map<String, Color>> _getStatusColors() {
    return {
      'Approved': {'bg': Colors.green.shade100, 'text': Colors.green.shade800},
      'Pending for approval': {
        'bg': Colors.orange.shade100,
        'text': Colors.orange.shade800,
      },
      'Rejected': {'bg': Colors.red.shade100, 'text': Colors.red.shade800},
    };
  }

  String _displayStatus(String status) {
    if (status == 'Pending for approval') {
      return 'Pending';
    }
    return status;
  }

  // --- Helper to show success dialog ---
  void _showSuccessDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      barrierDismissible: false, // User must click OK
      builder: (BuildContext ctx) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.check_circle, color: Colors.green, size: 50),
              const SizedBox(height: 15),
              Text(
                "Success!",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                message,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
          actions: [
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.secondaryBlue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  Navigator.of(ctx).pop(); // Close success dialog
                  // Optional: You might want to refresh the page here
                },
                child: const Text("OK"),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController rejectController = TextEditingController();
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ... [Your existing header Row code remains exactly the same] ...
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        softWrap: true,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(employeeId),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color:
                        _getStatusColors()[status]?['bg'] ??
                        Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    _displayStatus(status),
                    style: TextStyle(
                      color:
                          _getStatusColors()[status]?['text'] ??
                          Colors.grey.shade800,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 10),
            Divider(height: 1, color: AppColors.grey.withValues(alpha: 0.5)),
            SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Leave Type'),
                      SizedBox(height: 5),
                      Text(
                        leaveType,
                        softWrap: true,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text('From Date'),
                      SizedBox(height: 5),
                      Text(
                        fromDate,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text('Applied On'),
                      SizedBox(height: 5),
                      Text(
                        appliedOn,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Days/Hours'),
                      SizedBox(height: 5),
                      Text(
                        noOfDays,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text('To Date'),
                      SizedBox(height: 5),
                      Text(
                        toDate,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Reporting Manager',
                        softWrap: true,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 5),
                      Text(
                        reportingManagerName,
                        softWrap: true,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ],
            ),

            // --- ACTION BUTTONS SECTION ---
            Column(
              children: [
                Row(
                  children: [
                    if (status == 'Pending for approval')
                      // --- APPROVE BUTTON ---
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.secondaryBlue,
                            foregroundColor: AppColors.white,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 10,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (dialogContext) => AlertDialog(
                                title: const Center(
                                  child: Text(
                                    'Approve Leave',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                content: const Text(
                                  'Are you sure you want to approve this leave request?',
                                  textAlign: TextAlign.center,
                                ),
                                actions: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: Colors.black,
                                    ),
                                    onPressed: () =>
                                        Navigator.of(dialogContext).pop(),
                                    child: const Text('No'),
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.secondaryBlue,
                                      foregroundColor: Colors.white,
                                    ),
                                    onPressed: () async {
                                      // 1. Close confirmation dialog
                                      Navigator.of(dialogContext).pop();

                                      // 2. Perform Action (Wait for it)
                                      await onAction('APPROVE');

                                      // 3. Show Success (Check mounted)
                                      if (context.mounted) {
                                        _showSuccessDialog(
                                          context,
                                          "Leave approved successfully!",
                                        );
                                      }
                                    },
                                    child: const Text('Yes'),
                                  ),
                                ],
                              ),
                            );
                          },
                          child: const Text(
                            'Approve',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),

                    const SizedBox(width: 8),

                    // --- CANCEL BUTTON ---
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: AppColors.black,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 10,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (dialogContext) => AlertDialog(
                              title: const Center(
                                child: Text(
                                  'Cancel Leave',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              content: const Text(
                                'Are you sure you want to cancel this leave request?',
                                textAlign: TextAlign.center,
                              ),
                              actions: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.black,
                                  ),
                                  onPressed: () =>
                                      Navigator.of(dialogContext).pop(),
                                  child: const Text('No'),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red,
                                    foregroundColor: Colors.white,
                                  ),
                                  onPressed: () async {
                                    Navigator.of(dialogContext).pop();

                                    await onAction('CANCEL');

                                    if (context.mounted) {
                                      _showSuccessDialog(
                                        context,
                                        "Leave cancelled successfully!",
                                      );
                                    }
                                  },
                                  child: const Text('Yes'),
                                ),
                              ],
                            ),
                          );
                        },
                        child: const Text(
                          'Cancel',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),

                    if (status == 'Pending for approval') ...[
                      const SizedBox(width: 8),
                      // --- REJECT BUTTON ---
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 10,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {
                            final _formKey = GlobalKey<FormState>();
                            showDialog(
                              context: context,
                              builder: (dialogContext) {
                                return StatefulBuilder(
                                  builder: (context, setState) {
                                    return AlertDialog(
                                      title: const Center(
                                        child: Text(
                                          'Reject Leave',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      content: SizedBox(
                                        height: 120,
                                        child: Form(
                                          key: _formKey,
                                          child: TextFormField(
                                            maxLength: 50,
                                            controller: rejectController,
                                            maxLines: 4,
                                            validator: (value) {
                                              if (value == null ||
                                                  value.trim().isEmpty) {
                                                return 'Reason is required';
                                              }
                                              return null;
                                            },
                                            decoration: const InputDecoration(
                                              hintText:
                                                  'Enter reason for rejection',
                                              border: OutlineInputBorder(),
                                            ),
                                          ),
                                        ),
                                      ),
                                      actions: [
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            foregroundColor: Colors.black,
                                          ),
                                          onPressed: () =>
                                              Navigator.of(dialogContext).pop(),
                                          child: const Text('Cancel'),
                                        ),
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.red,
                                            foregroundColor: Colors.white,
                                          ),
                                          onPressed: () async {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              Navigator.of(dialogContext).pop();

                                              await onAction({
                                                'action': 'REJECT',
                                                'approverComments':
                                                    rejectController.text,
                                              });

                                              if (context.mounted) {
                                                _showSuccessDialog(
                                                  context,
                                                  "Leave rejected successfully!",
                                                );
                                              }
                                            }
                                          },
                                          child: const Text('Send'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            );
                          },
                          child: const Text(
                            'Reject',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
                SizedBox(height: 10),
              ],
            ),
            // SizedBox(
            //   width: double.infinity,
            //   child: ElevatedButton.icon(
            //     style: ElevatedButton.styleFrom(
            //       backgroundColor: AppColors.white,
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(8),
            //       ),
            //     ),
            //     icon: Icon(Icons.visibility, color: AppColors.black),
            //     onPressed: () {},
            //     label: Text(
            //       "View Details",
            //       style: TextStyle(
            //         fontSize: 12,
            //         fontWeight: FontWeight.bold,
            //         color: Colors.black,
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
