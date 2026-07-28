import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controllers/login_cubit.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_input.dart';

import '../../../../app_colors.dart';
import '../../../../core/components/login_header.dart';

class LoginForm extends StatefulWidget {
  final String? credentialError;

  const LoginForm({
    super.key,
    this.credentialError,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String? emailError;
  String? passwordError;
  String? credentialError;

  @override
  void initState() {
    super.initState();
    credentialError = widget.credentialError;
  }

  @override
  void didUpdateWidget(covariant LoginForm oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.credentialError != oldWidget.credentialError) {
      setState(() {
        credentialError = widget.credentialError;
      });
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _validateAndLogin() {
    setState(() {
      emailError = emailController.text.trim().isEmpty
          ? 'Please enter username or email'
          : null;

      passwordError = passwordController.text.trim().isEmpty
          ? 'Please enter password'
          : null;
    });

    if (emailError == null && passwordError == null) {
      context.read<LoginCubit>().login(
            emailController.text.trim(),
            passwordController.text.trim(),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return LoginHeader(
      onRefresh: () async {
        setState(() {
          emailController.clear();
          passwordController.clear();
          emailError = null;
          passwordError = null;
          credentialError = null;
        });
      },
      body: Column(
        children: [
          const Text(
            "WELCOME TO HRMS!",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),

          const SizedBox(height: 20),

          SizedBox(
            width: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //---------------------------------------------------
                // Username / Email
                //---------------------------------------------------

                const Text(
                  "Username/Email",
                  style: TextStyle(
                    color: AppColors.primaryBlue,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                CustomInput(
                  semanticsLabel: "email",
                  controller: emailController,
                  hintText: "Username/Email",
                  prefixIcon: Icons.person,
                  onChanged: (_) {
                    setState(() {
                      emailError = null;
                      credentialError = null;
                    });
                  },
                ),

                if (emailError != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      emailError!,
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 12,
                      ),
                    ),
                  ),

                const SizedBox(height: 20),

                //---------------------------------------------------
                // Password
                //---------------------------------------------------

                const Text(
                  "Password",
                  style: TextStyle(
                    color: AppColors.primaryBlue,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                CustomInput(
                  semanticsLabel: "password",
                  controller: passwordController,
                  hintText: "Password",
                  prefixIcon: Icons.lock,
                  isPassword: true,
                  onChanged: (_) {
                    setState(() {
                      passwordError = null;
                      credentialError = null;
                    });
                  },
                ),

                if (passwordError != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      passwordError!,
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 12,
                      ),
                    ),
                  ),

                const SizedBox(height: 16),

                //---------------------------------------------------
                // Invalid credentials
                //---------------------------------------------------

                if (credentialError != null &&
                    emailError == null &&
                    passwordError == null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      credentialError!,
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),

                //---------------------------------------------------
                // Login Button
                //---------------------------------------------------

                CustomButton(
                  semanticsLabel: "login",
                  text: "Login",
                  onPressed: _validateAndLogin,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
