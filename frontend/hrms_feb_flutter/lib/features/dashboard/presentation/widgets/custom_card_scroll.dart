import 'package:flutter/material.dart';
import '../../../../app_colors.dart';

class CustomCardScroll extends StatelessWidget {
  final IconData? icon;
  final String? userName;
  final String? fromDate;
  final String? toDate;
  final int? leaveday;
  final int? leavePeriod;
  final int? prefixId;

  const CustomCardScroll({
    super.key,
    this.icon,
    this.userName,
    this.fromDate,
    this.toDate,
    this.leaveday,
    this.leavePeriod,
    this.prefixId,
  });

  @override
  Widget build(BuildContext context) {
    String avatar = 'assets/icons/avatar_2.png';

    if (prefixId == 1) {
      avatar = 'assets/icons/avatar_3.png';
    } else if (prefixId == 2 || prefixId == 3) {
      avatar = 'assets/icons/avatar_1.png';
    }

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: AppColors.primaryBlue,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [AppColors.primaryBlue, AppColors.secondaryBlue],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        padding: EdgeInsets.all(12),
        width: 180,
        child: Center(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: AppColors.white,
                  child: Image.asset(
                    avatar,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),

                SizedBox(width: 8),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                
                  children: [
                    Text(
                      userName!,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(icon, size: 14, color: Colors.white),
                        SizedBox(width: 4),
                        Text(
                          fromDate!,
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ],
                    ),
                
                    if (fromDate != toDate)
                      Row(
                        children: [
                          Icon(icon, size: 14, color: Colors.white),
                          SizedBox(width: 4),
                          Text(
                            toDate!,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                
                    if (fromDate == toDate && leaveday == 2)
                      Text(
                        leavePeriod == 1 ? 'Morning' : 'Afternoon',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
