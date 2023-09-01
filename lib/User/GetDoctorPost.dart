class GetDoctorPost {
  final String id;
  final String doctorId;
  final String desc;
  final String date;
  final String image;
  final List<int> likes;
  final String createdAt;
  final String updatedAt;

  GetDoctorPost({
    required this.id,
    required this.doctorId,
    required this.desc,
    required this.date,
    required this.image,
    required this.likes,
    required this.createdAt,
    required this.updatedAt,
  });

  factory GetDoctorPost.fromJson(Map<String, dynamic> json) {
    return GetDoctorPost(
      id: json['_id'],
      doctorId: json['doctorId'],
      desc: json['desc'],
      date: json['date'],
      image: json['image'],
      likes: List<int>.from(json['likes']),
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}
