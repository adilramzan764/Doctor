import 'package:ehealthcare/User/Clinic.dart';

class GetClinicsModel {
  final List<Clinic> clinics;
  final String? message;
  final String? error;

  GetClinicsModel({
    required this.clinics,
    this.message,
    this.error,
  });

  factory GetClinicsModel.fromJson(Map<String, dynamic> json) {
    List<Clinic> clinics = (json['clinics'] as List).map((clinic) => Clinic.fromJson(clinic)).toList();
    return GetClinicsModel(
      clinics: clinics,
      message: json['message'],
      error: json['error'],
    );
  }
}
