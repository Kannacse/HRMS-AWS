import 'package:flutter/material.dart';
import 'package:hrms/core/services/activity_logger_remote_data_source.dart';
import 'package:hrms/core/services/api_service.dart';
import 'package:hrms/features/auth/data/data_sources/auth_storage.dart';
import 'package:hrms/main.dart';

mixin PageLogger<T extends StatefulWidget> on State<T> implements RouteAware {
  /// Name of the page to log
  String get pageName;

  /// Optional function to provide metadata dynamically
  Map<String, dynamic>? get pageMetadata => null;

  late final ActivityLoggerRemoteDataSource _logger;
  bool _initialized = false;
  bool _pageOpenedLogged = false;
  int? _userId;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_initialized) return;
    _initialized = true;

    _logger = ActivityLoggerRemoteDataSource(ApiService());

    _loadUser();

    final route = ModalRoute.of(context);
    if (route is PageRoute) {
      routeObserver.subscribe(this, route);
    }
  }

  /// Load the user and trigger page opened log if ready
  Future<void> _loadUser() async {
    final user = await AuthStorage.getUser();
    _userId = user?.userId;

    if (_userId != null) {
      _logPageOpenedIfNeeded();
    }
  }

  /// Call this whenever you want to try logging "Opened Page"
  void _logPageOpenedIfNeeded() {
    if (_pageOpenedLogged || _userId == null) return;
    _pageOpenedLogged = true;

    logPageActivity(action: 'Opened Page', metadata: pageMetadata);
  }

  /// Generic log function
  void logPageActivity({
    required String action,
    Map<String, dynamic>? metadata,
  }) {
    if (_userId == null) return;

    _logger.logActivity(
      userId: _userId!,
      page: pageName,
      action: action,
      metadata: metadata,
    );
  }

  @override
  void didPopNext() {
    logPageActivity(action: 'Returned to Page', metadata: pageMetadata);
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPop() {}
  @override
  void didPush() {
    // Try logging opened page when route is pushed
    _logPageOpenedIfNeeded();
  }

  @override
  void didPushNext() {}
}