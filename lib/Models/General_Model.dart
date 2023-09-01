import 'package:http/http.dart' as http;


class General_Model {
  final String? message;

   final String? error;
  final String baseUrl = "http://192.168.1.40:5000/";
  General_Model({this.message, this.error});



  factory General_Model.fromJson(Map<String, dynamic> json) {
    return General_Model(
      message: json['message'],
      error: json['error'],


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
