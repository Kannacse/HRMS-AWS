import 'package:flutter/material.dart';
import 'package:hrms/app_colors.dart';

class LeavePeriodSelector extends StatefulWidget{

  final String label;
  final int value;
  final int? selectedPeriod;
  final Function(int) onChanged;

  const LeavePeriodSelector({
    super.key,
    required this.label,
    required this.value,
    this.selectedPeriod,
    required this.onChanged,
  });

  @override
  State<LeavePeriodSelector> createState() => _LeavePeriodSelectorState();
}

class _LeavePeriodSelectorState extends State<LeavePeriodSelector> {
  @override
  Widget build(BuildContext context) {
    bool isSelected = widget.selectedPeriod == widget.value;

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