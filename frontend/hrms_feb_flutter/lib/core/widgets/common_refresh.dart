import 'package:flutter/material.dart';

class CommonRefresh extends StatelessWidget {
  final Widget child;
  final Future<void> Function() onRefresh;

  const CommonRefresh({
    super.key,
    required this.child,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: child,
      ),
    );
  }
}
