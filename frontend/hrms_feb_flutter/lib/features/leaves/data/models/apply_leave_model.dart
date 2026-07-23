import '../../domain/entities/apply_leave_data.dart';

class ApplyLeaveModel extends ApplyLeaveData {
  ApplyLeaveModel({
    required String successMsg,
    required bool success,
  }) : super(successMsg,success);


  factory ApplyLeaveModel.fromJson(Map<String,dynamic> json) {
    return ApplyLeaveModel(
      success: json['success'] ?? false,
      successMsg: json['msgArray']?['result'] ?? '',
    );

  }
}