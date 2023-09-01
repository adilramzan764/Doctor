import '../User/GetDoctorPost.dart';

class DoctorPostsResponse {
  final List<GetDoctorPost> posts;
  final String? message;
  final String? error;

  DoctorPostsResponse({
    required this.posts,
    this.message,
    this.error,
  });

  factory DoctorPostsResponse.fromJson(Map<String, dynamic> json) {
    List<GetDoctorPost> posts = (json['posts'] as List).map((post) => GetDoctorPost.fromJson(post)).toList();
    return DoctorPostsResponse(
      posts: posts,
      message: json['message'],
      error: json['error'],
    );
  }
}
