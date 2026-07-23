import 'package:flutter/material.dart';

class AttendanceMiniCard extends StatelessWidget {
  final String cardTitle;
  final double cardValue;
  final Image cardIcon;

  const AttendanceMiniCard({
    super.key,
    required this.cardTitle,
    required this.cardValue,
    required this.cardIcon,
  });

  @override
  Widget build(BuildContext context) {
    final displayValue =
    cardValue % 1 == 0 ? cardValue.toInt().toString() : cardValue.toString();
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFE6E6E6)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.2),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            cardIcon,
            const SizedBox(width: 12),
            // Text
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cardTitle,
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                  SizedBox(height: 4),
                  Text(
                    displayValue,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AttendanceMaincard extends StatelessWidget {
  final String totalLateText;
  final String lateLeftText;
  final String totalEarlyText;
  final String lateLeaveText;
  final String totalLateValue;
  final String lateLeftValue;
  final String totalEarlyValue;
  final String lateLeaveValue;

  const AttendanceMaincard({
    super.key,
    required this.totalLateText,
    required this.lateLeftText,
    required this.totalEarlyText,
    required this.lateLeaveText,
    required this.totalLateValue,
    required this.lateLeftValue,
    required this.totalEarlyValue,
    required this.lateLeaveValue,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFE6E6E6)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.2),
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          totalLateText,
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        Text(
                          totalLateValue,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: (double.tryParse(totalLateValue) ?? 0) > 0
                                ? Colors.deepOrange
                                : Colors.black,
                          ),
                        ),
                      ],
                    ),
                    // const SizedBox(width: 30),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          lateLeftText,
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        Text(
                          lateLeftValue,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          totalEarlyText,
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        Text(
                          totalEarlyValue,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: (double.tryParse(totalEarlyValue) ?? 0) > 0
                                ? Colors.deepOrange
                                : Colors.black,
                          ),
                        ),
                      ],
                    ),
                    // const SizedBox(width: 30),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          lateLeaveText,
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        Text(
                          lateLeaveValue,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// Daily Records div

class DailyAttendanceRecords extends StatelessWidget {
  final String shortDate;
  final String fullDate;
  final String status;
  final String checkIn;
  final String checkOut;
  final String workedHrs;
  final String late;
  final String early;

  const DailyAttendanceRecords({
    super.key,
    required this.shortDate,
    required this.fullDate,
    required this.status,
    required this.checkIn,
    required this.checkOut,
    required this.workedHrs,
    required this.late,
    required this.early,
  });

  @override
  Widget build(BuildContext context) {
    final Color colorStatus = status == "Present"
        ? Color(0XFF15803D)
        : Color(0xFFB91C1C);
    final Color colorStatusBg = status == "Present"
        ? Color(0xFFDCFCE7)
        : Color(0xFFFEE2E2);
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 1,
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header (date + status)
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFFF3F6FF),
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12),
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      shortDate,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      fullDate,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: colorStatusBg,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    status,

                    style: TextStyle(
                      color: colorStatus,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const Divider(height: 1, thickness: 0.8, color: Color(0xFFE5E5E5)),

          // Body
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              children: [
                // Row 1 — Check In / Check Out
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildInfoBlock("Check In", checkIn),
                    _buildInfoBlock("Check Out", checkOut),
                  ],
                ),

                const SizedBox(height: 12),
                const Divider(height: 1, color: Color(0xFFE5E5E5)),
                const SizedBox(height: 12),

                // Row 2 — Worked / Late / Early
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildInfoBlock("Worked", workedHrs),
                    _buildInfoBlock(
                      "Late (min)",
                      late,
                      valueColor: (double.tryParse(late) ?? 0) > 0
                          ? Colors.red
                          : Colors.black,
                    ),
                    _buildInfoBlock(
                      "Early (min)",
                      early,
                      valueColor: (double.tryParse(early) ?? 0) > 0
                          ? Colors.red
                          : Colors.black,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoBlock(
    String title,
    String value, {
    Color valueColor = Colors.black87,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontSize: 13, color: Colors.grey)),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: valueColor,
          ),
        ),
      ],
    );
  }
}
