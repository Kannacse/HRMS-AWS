import 'package:flutter/material.dart';
import 'package:hrms/app_colors.dart';

class LateEarlySelector extends StatefulWidget{

  final String label;
  final int value;
  final int? selectedLateEarly;
  final Function(int) onChanged;

  const LateEarlySelector({
    super.key,
    required this.label,
    required this.value,
    this.selectedLateEarly,
    required this.onChanged,
  });

  @override
  State<LateEarlySelector> createState() => _LateEarlySelectorState();
}

class _LateEarlySelectorState extends State<LateEarlySelector> {
  @override
  Widget build(BuildContext context) {
    bool isSelected = widget.selectedLateEarly == widget.value;

    return GestureDetector(
      onTap: () {
        widget.onChanged(widget.value);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 13),
        decoration: BoxDecoration(
          color: isSelected ? null : Colors.grey.shade300,
          gradient: isSelected
              ? LinearGradient(
                  colors: [AppColors.primaryBlue, AppColors.secondaryBlue],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                )
              : null,
          borderRadius: BorderRadius.circular(30),
          
        ),
        child: Text(
          widget.label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black87,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}