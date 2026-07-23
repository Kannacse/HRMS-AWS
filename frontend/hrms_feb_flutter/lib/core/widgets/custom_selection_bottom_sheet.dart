import 'package:flutter/material.dart';
import 'package:hrms/app_colors.dart';

class CustomSelectionBottomSheet<T> extends StatelessWidget {
  const CustomSelectionBottomSheet({
    super.key,
    required this.items,
    required this.selectedItem,
    required this.itemLabelBuilder,
    required this.onApply,
  });

  final List<T> items;
  final T? selectedItem;
  final String Function(T item) itemLabelBuilder;
  final ValueChanged<T> onApply;

  @override
  Widget build(BuildContext context) {
    T? tempSelected = selectedItem;
    final screenHeight = MediaQuery.of(context).size.height;

    return StatefulBuilder(
      builder: (context, setState) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Container(
            height: screenHeight * 0.5, // 50% of screen height
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                /// ❌ Close Button
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: const LinearGradient(
                        colors: [
                          AppColors.primaryBlue,
                          AppColors.secondaryBlue,
                        ],
                      ),
                    ),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      icon: const Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 18,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                /// 📋 Scrollable Items List with Scrollbar
                Expanded(
                  child: Scrollbar(
                    thumbVisibility: true,
                    child: ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        final item = items[index];
                        final isSelected = item == tempSelected;

                        return InkWell(
                          borderRadius: BorderRadius.circular(12),
                          onTap: () {
                            setState(() => tempSelected = item);
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 6),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? Colors.grey.shade200
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              itemLabelBuilder(item),
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: isSelected
                                    ? FontWeight.w600
                                    : FontWeight.w400,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                /// ✅ Apply Button with Gradient & Press Effect
                GradientPressButton(
                  text: 'Apply',
                  onTap: tempSelected == null
                      ? null
                      : () {
                          onApply(tempSelected as T);
                          Navigator.pop(context);
                        },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

/// Gradient Button with Press Animation
class GradientPressButton extends StatefulWidget {
  final VoidCallback? onTap;
  final String text;

  const GradientPressButton({
    super.key,
    required this.onTap,
    required this.text,
  });

  @override
  State<GradientPressButton> createState() => _GradientPressButtonState();
}

class _GradientPressButtonState extends State<GradientPressButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) {
        setState(() => _isPressed = false);
        if (widget.onTap != null) widget.onTap!();
      },
      onTapCancel: () => setState(() => _isPressed = false),
      child: AnimatedScale(
        scale: _isPressed ? 0.95 : 1.0,
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeOut,
        child: Material(
          borderRadius: BorderRadius.circular(24),
          color: Colors.transparent,
          child: Ink(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppColors.primaryBlue, AppColors.secondaryBlue],
              ),
              borderRadius: BorderRadius.circular(24),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(24),
              onTap: widget.onTap,
              child: SizedBox(
                height: 48,
                child: Center(
                  child: Text(
                    widget.text,
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
