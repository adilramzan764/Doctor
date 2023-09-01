class SignUp_Model {
  final String? message;
  final String? id;

  final String? error;

  SignUp_Model({this.message, this.error,this.id});



  factory SignUp_Model.fromJson(Map<String, dynamic> json) {
    return SignUp_Model(
      message: json['message'],
      error: json['error'],
      id: json['id'],



    );
  }
  Map<String, dynamic> toJson() {
    if (error != null) {
      return {
        'error': error,
      };
    } else if (message != null) {
      return {
        'message': message,
      };
    } else {
      throw Exception("UserResponse should have either 'message' or 'error'.");
    }
  }
}
