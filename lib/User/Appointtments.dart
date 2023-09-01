class Appointment {
  final String id;
  final String doctorId;
  final String doctorName;
  final String doctorSpecialization;
  final String doctorImage;
  final String patientName;
  final String patientPhone;
  final String patientEmail;
  final String patientId;
  final String requestType;
  final String diagnosis;
  final String date;
  final String hospitalName;
  final String time;
  final String fees;
  final String status;
  final String createdAt;
  final String updatedAt;

  Appointment({
    required this.id,
    required this.doctorId,
    required this.doctorName,
    required this.doctorSpecialization,
    required this.doctorImage,
    required this.patientName,
    required this.patientPhone,
    required this.patientEmail,
    required this.patientId,
    required this.requestType,
    required this.diagnosis,
    required this.date,
    required this.hospitalName,
    required this.time,
    required this.fees,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      id: json['_id'],
      doctorId: json['doctorId'],
      doctorName: json['doctorName'],
      doctorSpecialization: json['doctorSpecialization'],
      doctorImage: json['doctorImage'],
      patientName: json['patientName'],
      patientPhone: json['patientPhone'],
      patientEmail: json['patientEmail'],
      patientId: json['patientId'],
      requestType: json['RequestType'],
      diagnosis: json['diagnosis'],
      date: json['date'],
      hospitalName: json['hospitleName'],
      time: json['time'],
      fees: json['fees'],
      status: json['Status'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}
