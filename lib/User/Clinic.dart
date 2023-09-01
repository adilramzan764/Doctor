class Clinic {
  final String id;
  final String name;
  final String city;
  final String location;
  final String clinicNumber;
  final String fees;
  final String createdAt;
  final String updatedAt;

  Clinic({
    required this.id,
    required this.name,
    required this.city,
    required this.location,
    required this.clinicNumber,
    required this.fees,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Clinic.fromJson(Map<String, dynamic> json) {
    return Clinic(
      id: json['_id'],
      name: json['name'],
      city: json['city'],
      location: json['location'],
      clinicNumber: json['clinicnumber'],
      fees: json['fees'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}
