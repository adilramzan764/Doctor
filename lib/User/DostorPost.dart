class DoctorPost {
  final String doctorId;
  final String name;
  final String desc;
  final String date;
  final String image;
  final int likes;

  DoctorPost({
    required this.doctorId,
    required this.name,
    required this.desc,
    required this.date,
    required this.image,
    required this.likes,
  });

  factory DoctorPost.fromJson(Map<String, dynamic> json) {
    return DoctorPost(
      doctorId: json['doctorId'],
      name: json['name'],
      desc: json['desc'],
      date: json['date'],
      image: json['image'],
      likes: json['likes'],
    );
  }
}

class DoctorPostsAddResponse {
  final String message;
  final DoctorPost newPost;

  DoctorPostsAddResponse({
    required this.message,
    required this.newPost,
  });

  factory DoctorPostsAddResponse.fromJson(Map<String, dynamic> json) {
    return DoctorPostsAddResponse(
      message: json['message'],
      newPost: DoctorPost.fromJson(json['newPost']),
    );
  }
}
