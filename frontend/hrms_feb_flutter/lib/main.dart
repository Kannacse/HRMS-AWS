import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrms/core/config/app_config.dart';
import 'package:hrms/core/services/api_service.dart';
import 'package:hrms/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:hrms/features/auth/data/data_sources/auth_storage.dart';
import 'package:hrms/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:hrms/features/auth/domain/entities/user.dart';
import 'package:hrms/features/auth/domain/usecases/login_user.dart';
import 'package:hrms/features/auth/presentation/controllers/auth_bloc.dart';
import 'package:hrms/features/auth/presentation/controllers/login_cubit.dart';
import 'package:hrms/features/auth/presentation/pages/login_page.dart';
import 'package:hrms/features/dashboard/presentation/controllers/dashboard_bloc.dart';
import 'package:hrms/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:hrms/features/dashboard/data/repositories/dashboard_repositories_impl.dart';
import 'package:hrms/features/dashboard/data/data_sources/dashboard_remote_data_source.dart';
import 'package:hrms/features/employee_leaves/presentation/pages/employee_leaves_page.dart';
import 'package:hrms/features/leaves/presentation/pages/apply_leave_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrms/features/attendance/presentation/pages/attendance_page.dart';
import 'package:hrms/features/leaves_options/leaves_options_page.dart';
import 'package:flutter/services.dart';

final apiservice = ApiService();

final authRemoteDataSource = AuthRemoteDataSource(apiservice);
final authRepository = AuthRepositoryImpl(authRemoteDataSource);
final loginUser = LoginUser(authRepository);
final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

void main() async {
  if (kDebugMode) {
    debugPrint('BASE_URL: ${AppConfig.baseUrl}');
  }

  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  final user = await AuthStorage.getUser();

  if (user != null) {
    apiservice.setToken(user.token);
  }

  runApp(
    BlocProvider(
      create: (context) => AuthBloc(apiservice),
      child: MyApp(
        loginUser: loginUser,
        initialUser: user,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final LoginUser loginUser;
  final User? initialUser;

  const MyApp({
    super.key,
    required this.loginUser,
    this.initialUser,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      navigatorObservers: [routeObserver],
      initialRoute: '/login',
      routes: {
        '/login': (context) => BlocProvider(
              create: (context) => LoginCubit(
                loginUser,
                apiservice,
              ),
              child: const LoginPage(),
            ),
        '/dashboard': (context) => DashboardPage(
              apiservice: apiservice,
            ),
        '/leavesoptions': (context) => LeavesOptions(
              apiservice: apiservice,
            ),
        '/applyleave': (context) => ApplyLeavePage(
              apiservice: apiservice,
            ),
        '/employeeleaves': (context) => EmployeeLeavesPage(
              apiservice: apiservice,
            ),
        '/attendance': (context) => AttendancePage(
              apiservice: apiservice,
            ),
      },
    );
  }
}

class Mydashboard extends StatelessWidget {
  const Mydashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "HRMS Dashboard",
      home: BlocProvider(
        create: (context) {
          final remoteDataSource = DashboardRemoteDataSource(apiservice);
          final repository = DashboardRepositoriesImpl(remoteDataSource);
          return DashboardBloc(repository);
        },
        child: DashboardPage(
          apiservice: apiservice,
        ),
      ),
      routes: {
        '/leavesoptions': (context) => LeavesOptions(
              apiservice: apiservice,
            ),
        '/applyleave': (context) => ApplyLeavePage(
              apiservice: apiservice,
            ),
        '/employeeleaves': (context) => EmployeeLeavesPage(
              apiservice: apiservice,
            ),
        '/attendance': (context) => AttendancePage(
              apiservice: apiservice,
            ),
      },
    );
  }
}
