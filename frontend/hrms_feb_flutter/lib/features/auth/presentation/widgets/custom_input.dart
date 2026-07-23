import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData prefixIcon;
  final bool isPassword;
  final ValueChanged<String>? onChanged;

  const CustomInput({
    super.key,
    required this.controller,
    required this.hintText,
    required this.prefixIcon,
    this.isPassword = false,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    bool obscureText = isPassword; // local flag for password

    return StatefulBuilder(
      builder: (context, setState) {
        return TextField(
          controller: controller,
          obscureText: isPassword ? obscureText : false,
          onChanged: onChanged,
          decoration: InputDecoration(
            prefixIcon: Icon(prefixIcon, color: Colors.blue),
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.blue.withValues(alpha: 0.4)),
            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Color(0xFF0096FF), width: 1.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Color(0xFF003F7F), width: 2),
            ),
            // 👁 Eye Icon
            suffixIcon: isPassword
                ? IconButton(
                    icon: Icon(
                      obscureText ? Icons.visibility_off : Icons.visibility,
                      color: Colors.blue,
                    ),
                    onPressed: () => setState(() {
                      obscureText = !obscureText;
                    }),
                  )
                : null,
          ),
        );
      },
    );
  }
}
