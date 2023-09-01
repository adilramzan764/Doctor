
import '../User/User.dart';

class DoctorInfoModel {
  final String message;
  final UserExists userExists;

  DoctorInfoModel({
    required this.message,
    required this.userExists,
  });

  factory DoctorInfoModel.fromJson(Map<String, dynamic> json) {
    return DoctorInfoModel(
      message: json['message'] ?? "",
      userExists: UserExists.fromJson(json['userExists'] ?? {}),
    );
  }

}
