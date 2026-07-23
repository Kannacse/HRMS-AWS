import 'package:flutter/material.dart';
import 'package:hrms/app_colors.dart';

class CustomAppDrawer extends StatelessWidget {
  const CustomAppDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.primaryBlue, AppColors.secondaryBlue],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            child: Text(
              "HRMS Menu",
              style: TextStyle(fontSize: 18, color: AppColors.white),
            ),
          ),
          ListTile(
            leading: Icon(Icons.dashboard),
            title: Text("Dashboard"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/dashboard',
                (route) => false,
              );
            },
          ),
          // ListTile(
          //   leading: Icon(Icons.local_activity),
          //   title: Text("Activity Board"),
          //   onTap: () {
          //     ScaffoldMessenger.of(context).showSnackBar(
          //       SnackBar(content: Text("Activity board is Clicked")),
          //     );
          //     Navigator.pop(context);
          //   },
          // ),
          ListTile(
            leading: Icon(Icons.access_time),
            title: Text("Attendance"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/attendance');
            },
          ),

          ListTile(
            leading: Icon(Icons.calendar_today_outlined),
            title: Text("Apply Leave"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/leavesoptions');
            },
          ),
          // ListTile(
          //   leading: Icon(Icons.design_services),
          //   title: Text("Self Service"),
          //   onTap: () {
          //     ScaffoldMessenger.of(context).showSnackBar(
          //       SnackBar(content: Text("Self service is Clicked")),
          //     );
          //     Navigator.pop(context);
          //   },
          // ),
          // ListTile(
          //   leading: Icon(Icons.timeline),
          //   title: Text("Timesheet"),
          //   onTap: () {
          //     ScaffoldMessenger.of(
          //       context,
          //     ).showSnackBar(SnackBar(content: Text("Timesheet is Clicked")));
          //     Navigator.pop(context);
          //   },
          // ),
          // ListTile(
          //   leading: Icon(Icons.money),
          //   title: Text("Payroll"),
          //   onTap: () {
          //     ScaffoldMessenger.of(
          //       context,
          //     ).showSnackBar(SnackBar(content: Text("Payroll is Clicked")));
          //     Navigator.pop(context);
          //   },
          // ),
        ],
      ),
    );
  }
}
