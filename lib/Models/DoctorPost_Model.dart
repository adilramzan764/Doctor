import '../User/DostorPost.dart';

class DoctorPostsAdd_Model {
  final String message;
  final DoctorPost newPost;

  DoctorPostsAdd_Model({
    required this.message,
    required this.newPost,
  });

  factory DoctorPostsAdd_Model.fromJson(Map<String, dynamic> json) {
    return DoctorPostsAdd_Model(
      message: json['message'],
      newPost: DoctorPost.fromJson(json['newPost']),
    );
  }
}
