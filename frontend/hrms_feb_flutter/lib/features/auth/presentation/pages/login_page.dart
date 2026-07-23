import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../controllers/login_cubit.dart';
import '../widgets/login_form.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            // ✅ Navigation
            if (state is LoginSuccess) {
              Navigator.pushReplacementNamed(
                context,
                '/dashboard',
                arguments: {
                  'userId': state.user.userId,
                  'emprole': state.user.emprole,
                },
              );
            }

            // 🔔 Snackbar errors (NOT inline)
            if (state is LoginError && !state.showInline) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content: Text(state.message),
                    backgroundColor: Colors.black,
                  ),
                );
            }
          },

          builder: (context, state) {
            // ⏳ Loading
            if (state is LoginLoading) {
              return LoadingAnimationWidget.fourRotatingDots(
                color: Colors.blue,
                size: 50,
              );
            }

            // ❗ Inline credential error ONLY
            String? inlineError;
            if (state is LoginError && state.showInline) {
              inlineError = state.message;
            }

            return LoginForm(credentialError: inlineError);
          },
        ),
      ),
    );
  }
}
