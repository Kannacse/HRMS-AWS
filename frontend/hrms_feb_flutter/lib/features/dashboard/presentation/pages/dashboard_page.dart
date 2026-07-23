import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'package:hrms/core/logging/page_logger_mixin.dart';
import 'package:hrms/core/widgets/custom_app_drawer.dart';

import '../../../../app_colors.dart';
import '../../../../core/services/api_service.dart';
import '../../../../core/widgets/common_refresh.dart';

import '../../../auth/data/data_sources/auth_storage.dart';
import '../../../dashboard/data/data_sources/dashboard_remote_data_source.dart';
import '../../../dashboard/data/repositories/dashboard_repositories_impl.dart';
import '../../../dashboard/presentation/controllers/dashboard_bloc.dart';

import '../widgets/custom_card_mini.dart';
import '../widgets/custom_card_scroll.dart';
import '../widgets/quick_link_container.dart';

class DashboardPage extends StatelessWidget {
  final ApiService apiservice;

  const DashboardPage({super.key, required this.apiservice});

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

        // Wrap Scaffold with BlocProvider
        return BlocProvider(
          create: (context) {
            final remoteDataSource = DashboardRemoteDataSource(apiservice);
            final repository = DashboardRepositoriesImpl(remoteDataSource);
            final bloc = DashboardBloc(repository);

            // Dispatch event with userId
            bloc.add(FetchDashboardData(user.userId));
            return bloc;
          },
          child: Scaffold(
            backgroundColor: AppColors.white,
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(200),
              child: BlocBuilder<DashboardBloc, DashboardState>(
                builder: (context, state) {
                  String displayName = user.userfullname;

                  // If API loaded successfully, use the FRESH name
                  if (state is DashboardLoaded) {
                    if (state.data.userFullName != null) {
                      displayName = state.data.userFullName!;
                      AuthStorage.saveUser(
                        user.copyWith(userfullname: displayName),
                      );
                    }
                  }
                  return _buildAppBar(context, displayName, user.userId);
                },
              ),
            ),

            drawer: const CustomAppDrawer(),
            body: Builder(
              builder: (context) {
                return CommonRefresh(
                  onRefresh: () async {
                    // 3. Trigger the Bloc Event instead of pushing a new route
                    // This refreshes both Header and Body seamlessly
                    context.read<DashboardBloc>().add(
                      FetchDashboardData(user.userId),
                    );
                  },
                  child: DashboardBody(userId: user.userId),
                );
              },
            ),
          ),
        );
      },
    );
  }

  PreferredSizeWidget _buildAppBar(
    BuildContext context,
    String userName,
    int userId,
  ) {
    return PreferredSize(
      preferredSize: Size.fromHeight(200),
      child: AppBar(
        iconTheme: IconThemeData(color: AppColors.white),
        actions: [
          // IconButton(
          //   onPressed: () {},
          //   icon: Icon(Icons.notifications_outlined, color: AppColors.white),
          // ),
          PopupMenuButton<String>(
            icon: Icon(Icons.power_settings_new, color: AppColors.white),
            offset: const Offset(0, 40),
            onSelected: (value) async {
              if (value == 'logout') {

                await AuthStorage.clearUser();

                if (!context.mounted) return;

                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/login',
                  (route) => false,
                );
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'logout',
                height: 25,
                child: Row(
                  children: [
                    Icon(Icons.logout, color: Colors.red),
                    SizedBox(width: 10),
                    Text('Logout'),
                  ],
                ),
              ),
            ],
          ),
        ],

        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.primaryBlue, AppColors.secondaryBlue],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundColor: AppColors.white,
                child: Image.asset('assets/icons/profile_Icon.png'),
              ),
              SizedBox(height: 8),

              Text(
                "Welcome",
                style: TextStyle(color: AppColors.white, fontSize: 14),
              ),
              Text(
                userName,

                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

class DashboardBody extends StatefulWidget {
  final int userId;
  const DashboardBody({super.key, required this.userId});

  @override
  State<DashboardBody> createState() => _DashboardBodyState();
}

class _DashboardBodyState extends State<DashboardBody> with PageLogger<DashboardBody> {

  @override
  String get pageName => 'Dashboard';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        if (state is DashboardLoading) {
          return Center(
            child: LoadingAnimationWidget.fourRotatingDots(
              color: Colors.blue,
              size: 50,
            ),
          );
        } else if (state is DashboardLoaded) {
          final data = state.data;
          final leavesLimit = data.leaves?.empLeaveLimit ?? 0;
          final usedLeaves = data.leaves?.usedLeaves ?? 0;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "Dashboard",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // First card section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: CustomCardMini(
                        topWidget: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${usedLeaves % 1 == 0 ? usedLeaves.toInt() : usedLeaves}/",
                              style: TextStyle(
                                color: AppColors.primaryBlue,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              leavesLimit.toStringAsFixed(0),
                              style: TextStyle(
                                color: AppColors.secondaryBlue,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        bottomText: "Leaves",
                      ),
                    ),

                    Expanded(
                      child: CustomCardMini(
                        topWidget:
                            (data.holidays != null && data.holidays!.isNotEmpty)
                            ? GradientText(
                                data.holidays!
                                    .map((h) => h.holidaydate ?? '')
                                    .join('\n'),
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                                gradient: LinearGradient(
                                  colors: [
                                    AppColors.primaryBlue,
                                    AppColors.secondaryBlue,
                                  ],
                                ),
                              )
                            : const Text(
                                "No holidays",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                        bottomText: "Upcoming Holidays",
                      ),
                    ),

                    Expanded(
                      child: CustomCardMini(
                        topWidget: Column(
                          children: [Image.asset('assets/icons/cbt_team.png')],
                        ),
                        bottomText: "Team Details",
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "Colleagues on leave",
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 8),

              if (data.teamLeaves != null && data.teamLeaves!.isNotEmpty) ...[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SizedBox(
                    height: 100,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          for (var l in data.teamLeaves!)
                            CustomCardScroll(
                              icon: Icons.calendar_today,
                              userName: l.employeeName ?? '',
                              fromDate: l.fromDate ?? '',
                              toDate: l.toDate ?? '',
                              leaveday: l.leaveday ?? 0,
                              leavePeriod: l.leavePeriod ?? 0,
                              prefixId: l.prefixId,
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ] else ...[
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: SizedBox(
                    height: 50,
                    child: Center(
                      child: Text(
                        "No one is on Leave",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
              ],

              const SizedBox(height: 20),

              // Quick Links
              Card(
                elevation: 6,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                color: AppColors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        "What do you want to do today?",
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),

                      // GridView.count(
                      //   crossAxisCount: 3,
                      //   shrinkWrap: true,
                      //   physics: const NeverScrollableScrollPhysics(),
                      //   crossAxisSpacing: 16,
                      //   mainAxisSpacing: 16,
                      //   children: [
                      //     QuickLinkContainer(
                      //       icon: Image.asset(
                      //         'assets/icons/Attendance_clock.png',
                      //       ),
                      //       menuText: "Attendance",
                      //       ontap: () {
                      //         Navigator.pushNamed(context, '/attendance');
                      //       },
                      //     ),
                      //     QuickLinkContainer(
                      //       icon: Image.asset(
                      //         'assets/icons/Apply_Leaves_Calender.png',
                      //       ),
                      //       menuText: "Apply Leave",
                      //       ontap: () {
                      //         Navigator.pushNamed(context, '/leavesoptions');
                      //       },
                      //     ),
                      //     QuickLinkContainer(
                      //       icon: Image.asset('assets/icons/emp_frame.png'),
                      //       menuText: "Payslips",
                      //       ontap: () {},
                      //     ),
                      //   ],
                      // ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              QuickLinkContainer(
                                icon: Image.asset(
                                  'assets/icons/Attendance_clock.png',
                                ),
                                menuText: "Attendance",
                                ontap: () {
                                  Navigator.pushNamed(context, '/attendance');
                                },
                              ),
                              QuickLinkContainer(
                                icon: Image.asset(
                                  'assets/icons/Apply_Leaves_Calender.png',
                                ),
                                menuText: "Apply Leave",
                                ontap: () {
                                  Navigator.pushNamed(
                                    context,
                                    '/leavesoptions',
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          );
        } else if (state is DashboardError) {
          return CommonRefresh(
            onRefresh: () async {
              context.read<DashboardBloc>().add(FetchDashboardData(widget.userId));
            },
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.wifi_off, size: 50, color: Colors.grey),
                    const SizedBox(height: 12),
                    Text(
                      state.message,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Pull down to retry",
                      style: TextStyle(fontSize: 12, color: Colors.blue),
                    ),
                  ],
                ),
              ),
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
