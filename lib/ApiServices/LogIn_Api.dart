import 'dart:convert';

import '../Models/LogIn_Model.dart';
import '../const.dart';
import 'package:http/http.dart' as http;

class Login_Api {
  static Future<LogIn_Model> login(String email, String password) async {
    const String URL = "${baseUrl}doctorlogin"; // Replace 'baseUrl' with your actual base URL.
    Map<String, dynamic> body = {
      'email': email,
      'password': password,
    };
    print(body);
    final response = await http.post(
      Uri.parse(URL),
      body: json.encode(body),
      headers: {"Content-Type": "application/json"},
    );
    print(response.body);
    final String res = response.body;


    if (response.statusCode == 200) {
      try {
        final jsonData = json.decode(res) as Map<String, dynamic>;
        final userResponseLogin = LogIn_Model.fromJson(jsonData);
        print("userresponse login $userResponseLogin");

        return userResponseLogin;
      } catch (e) {
        throw Exception("Failed to parse response");
      }
    }
    else if (response.statusCode == 401) {
      try {
        final jsonData = json.decode(res) as Map<String, dynamic>;
        final userResponseLogin = LogIn_Model.fromJson(jsonData);
        print("userresponse login $userResponseLogin");

        return userResponseLogin;
      } catch (e) {
        throw Exception("Failed to parse response");
      }
    }


    else if (response.statusCode == 404) {
      try {
        final jsonData = json.decode(res) as Map<String, dynamic>;
        final userResponseLogin = LogIn_Model.fromJson(jsonData);
        print("userresponse login $userResponseLogin");

        return userResponseLogin;
      } catch (e) {
        throw Exception("Failed to parse response");
      }
    }

    else if (response.statusCode == 400) {
      try {
        final jsonData = json.decode(res) as Map<String, dynamic>;
        final userResponseLogin = LogIn_Model.fromJson(jsonData);
        print("userresponse login $userResponseLogin");

        return userResponseLogin;
      } catch (e) {
        throw Exception("Failed to parse response");
      }
    } else {
      throw Exception("An error occurred");
    }
  }
}