class UserExists {
  final String id;
  final String title;
  final String email;
  final String password;
  final String name;
  final String city;
  final String specialization;
  final String gender;
  final String experience;
  final List<String> clinics;
  final List<String> reviews;
  final List<String> posts;
  final String profileImage;
  final List<Document> documents;
  final String createdAt;
  final String updatedAt;

  UserExists({
    required this.id,
    required this.title,
    required this.email,
    required this.password,
    required this.name,
    required this.city,
    required this.specialization,
    required this.gender,
    required this.experience,
    required this.clinics,
    required this.reviews,
    required this.posts,
    required this.profileImage,
    required this.documents,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserExists.fromJson(Map<String, dynamic> json) {
    var documentsList = json['documents'] as List;
    List<Document> documents =
    documentsList.map((doc) => Document.fromJson(doc)).toList();

    return UserExists(
      id: json['_id'],
      title: json['title'],
      email: json['email'],
      password: json['password'],
      name: json['name'],
      city: json['city'],
      specialization: json['specialization'],
      gender: json['gender'],
      experience: json['experience'],
      clinics: List<String>.from(json['clinics']),
      reviews: List<String>.from(json['reviews']),
      posts: List<String>.from(json['posts']),
      profileImage: json['profileImage'],
      documents: documents,
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}

class Document {
  final String url;
  final String id;

  Document({
    required this.url,
    required this.id,
  });

  factory Document.fromJson(Map<String, dynamic> json) {
    return Document(
      url: json['url'],
      id: json['_id'],
    );
  }
}
