import 'package:flutter/material.dart';
import 'package:hrms/app_colors.dart';

class LeaveModeSelector extends StatefulWidget {
  final String label;
  final int value;
  final int? selectedDay;
  final Function(int) onChanged;

  const LeaveModeSelector({
    super.key,
    required this.label,
    required this.value,
    this.selectedDay,
    required this.onChanged,
  });

  @override
  State<LeaveModeSelector> createState() => _LeaveModeSelectorState();
}

class _LeaveModeSelectorState extends State<LeaveModeSelector> {
  @override
  Widget build(BuildContext context) {
    bool isSelected = widget.selectedDay == widget.value;

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