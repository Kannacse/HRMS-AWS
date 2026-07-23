// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hrms/features/auth/domain/entities/user.dart';
import 'package:hrms/features/auth/domain/repositories/auth_repository.dart';
import 'package:hrms/features/auth/domain/usecases/login_user.dart';

import 'package:hrms/main.dart';

// inside test/widget_test.dart, above the test or inside main()
class _FakeAuthRepository implements AuthRepository {
  @override
  Future<User> login(String email, String password) async {
    return User(
      userId: 1,
      userfullname: 'Test User',
      emailaddress: email,
      token: 'token',
      refreshtoken: 'refresh',
      emprole: 2
    );
  }
}

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
  final repo = _FakeAuthRepository();
  final loginUsecase = LoginUser(repo); // matches usecase constructor
  await tester.pumpWidget(MyApp(loginUser: loginUsecase));

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
