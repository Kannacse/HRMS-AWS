import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrms/app_colors.dart';
import 'package:hrms/core/logging/page_logger_mixin.dart';
import 'package:hrms/core/services/api_service.dart';
import 'package:hrms/core/widgets/custom_app_drawer.dart';
import 'package:hrms/core/widgets/custom_appbar.dart';
import 'package:hrms/features/employee_leaves/data/data_sources/employee_leaves_data_source.dart';
import 'package:hrms/features/employee_leaves/data/repositories/employee_leaves_repositories_impl.dart';
import 'package:hrms/features/employee_leaves/presentation/controllers/employee_leaves_bloc.dart';
import 'package:hrms/features/employee_leaves/presentation/pages/employee_leaves_page.dart';

class LeavesOptions extends StatefulWidget {
  final ApiService apiservice;
  const LeavesOptions({super.key, required this.apiservice});

  @override
  State<LeavesOptions> createState() => _LeavesOptionsState();
}

class _LeavesOptionsState extends State<LeavesOptions>
    with PageLogger<LeavesOptions> {

  @override
  String get pageName => 'Leave Options';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Leaves", showBackButton: true),

      drawer: const CustomAppDrawer(),

      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            ListTile(
              title: const Text("Leave Request"),
              onTap: () => Navigator.pushNamed(context, '/applyleave'),
            ),

            Divider(height: 1, color: AppColors.grey.withValues(alpha: 0.5)),

            // ListTile(title: const Text("My Leave"), onTap: () {}),

            // Divider(height: 1, color: AppColors.grey.withValues(alpha: 0.5)),
            ListTile(
              title: const Text("Employee Leave"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) {
                      final dataSource = EmployeeLeavesDataSource(
                        widget.apiservice,
                      );
                      final repository = EmployeeLeavesRepositoriesImpl(
                        dataSource,
                      );

                      return BlocProvider<EmployeeLeavesBloc>(
                        create: (_) => EmployeeLeavesBloc(repository),
                        child: EmployeeLeavesPage(
                          apiservice: widget.apiservice,
                        ),
                      );
                    },
                  ),
                );
              },
            ),

            Divider(height: 1, color: AppColors.grey.withValues(alpha: 0.5)),

            // ListTile(title: const Text("Leave History"), onTap: () {}),

            // Divider(height: 1, color: AppColors.grey.withValues(alpha: 0.5)),
          ],
        ),
      ),
    );
  }
}
