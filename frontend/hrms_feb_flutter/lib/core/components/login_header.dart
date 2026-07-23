import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  final Widget body;
  final Future<void> Function()? onRefresh;

  const LoginHeader({super.key, required this.body, this.onRefresh});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: onRefresh != null
          ? RefreshIndicator(
              onRefresh: onRefresh!,
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    Stack(
                      clipBehavior: Clip.none, // allows avatar to overflow
                      children: [
                        // Blue background
                        Container(
                          height: 300,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFF003F7F), Color(0xFF0096FF)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(40),
                              bottomRight: Radius.circular(40),
                            ),
                          ),
                        ),

                        // Circle Avatar (overlapping)
                        Positioned(
                          bottom: -100, // how much it overflows below container
                          left: 0,
                          right: 0,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26, // shadow color
                                  blurRadius: 12, // softness
                                  spreadRadius: 2, // makes shadow bigger
                                  offset: Offset(0, 6), // moves shadow downward
                                ),
                              ],
                            ),
                            child: CircleAvatar(
                              radius: 100,
                              backgroundColor: Colors.white,
                              child: Image.asset('assets/logo/cbt_logo.png'),
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 120),

                    body, // Append dynamic body
                  ],
                ),
              ),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    clipBehavior: Clip.none, // allows avatar to overflow
                    children: [
                      // Blue background
                      Container(
                        height: 300,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFF003F7F), Color(0xFF0096FF)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40),
                          ),
                        ),
                      ),
                      // Circle Avatar (overlapping)
                      Positioned(
                        bottom: -100, // how much it overflows below container
                        left: 0,
                        right: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26, // shadow color
                                blurRadius: 12, // softness
                                spreadRadius: 2, // makes shadow bigger
                                offset: Offset(0, 6), // moves shadow downward
                              ),
                            ],
                          ),
                          child: CircleAvatar(
                            radius: 100,
                            backgroundColor: Colors.white,
                            child: Image.asset('assets/logo/cbt_logo.png'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 120),
                  body, // Append dynamic body
                ],
              ),
            ),
    );
  }
}
