import 'package:flutter/material.dart';
import '../../../../app_colors.dart';

class QuickLinkContainer extends StatelessWidget {
  final Image? icon;
  final String? menuText;
  final VoidCallback? ontap;

  const QuickLinkContainer({super.key, this.icon, this.menuText, this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            colors: [AppColors.primaryBlue, AppColors.secondaryBlue],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Padding(padding: const EdgeInsets.all(12.0),
         child:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon!,
            SizedBox(height: 10),
            Text(
              menuText!,
              style: TextStyle(
                color: AppColors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        )
      ),
    );
  }
}

class GradientText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Gradient gradient;

  const GradientText(
    this.text, {
    super.key,
    required this.style,
    required this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    if (text.isEmpty) {
      return const SizedBox.shrink();
    }

    return ShaderMask(
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(
        text,
        style: style.copyWith(color: Colors.white), // base color is ignored
      ),
    );
  }
}
