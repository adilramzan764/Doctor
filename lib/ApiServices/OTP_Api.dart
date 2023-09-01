import 'dart:convert';

import 'package:ehealthcare/Models/General_Model.dart';
import 'package:http/http.dart' as http;

import '../const.dart';

class OTP_Api{
  static Future<General_Model> login(String email,int otp) async {
     String URL = "${baseUrl}doctorSendOtpEmail/$email/$otp"; // Replace 'baseUrl' with your actual base URL.
     print(URL);

    final response = await http.post(
      Uri.parse(URL),

    );
    print(response.body);
    final String res = response.body;

     if (res.isNotEmpty) {
       try {
         final jsonData = json.decode(res) as Map<String, dynamic>;
         return General_Model.fromJson(jsonData);
       } catch (e) {
         throw Exception("Failed to parse response");
       }
     }

    else if (response.statusCode == 200) {
      try {
        final jsonData = json.decode(res) as Map<String, dynamic>;
        final userResponseLogin = General_Model.fromJson(jsonData);

        return userResponseLogin;
      } catch (e) {
        throw Exception("Failed to parse response");
      }
    }

    else if (response.statusCode == 400) {
      try {
        final jsonData = json.decode(res) as Map<String, dynamic>;
        final userResponseLogin = General_Model.fromJson(jsonData);

        return userResponseLogin;
      } catch (e) {
        throw Exception("Failed to parse response");
      }
    } else {
      throw Exception("An error occurred");
    }
  }

}