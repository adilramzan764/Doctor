import 'dart:convert';

import 'package:ehealthcare/Models/General_Model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/Appointments.dart';
import '../const.dart';

class AddClinic_Api{
  static Future<General_Model> addclinic(String name, String city,String location,String clinicnumber, String fees, Map<String, Map<String, List<String>>> appointments) async {
    print("appointments$appointments");
    String URL = "${baseUrl}doctorClinicAdd"; // Replace 'baseUrl' with your actual base URL.
    print(URL);
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String id=  preferences.getString("id").toString();
    final Map<String, dynamic> requestBody = {
      'userId': id,
      'name': name,
      'city': city,
      'location': location,
      'clinicnumber': clinicnumber,
      'fees': fees,
      'appointments': appointments,
    };

    print( "requestBody : $requestBody");


    final response = await http.post(
      Uri.parse(URL),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(requestBody),
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

    // else if (response.statusCode == 200) {
    //   try {
    //     final jsonData = json.decode(res) as Map<String, dynamic>;
    //     final userResponseLogin = General_Model.fromJson(jsonData);
    //
    //     return userResponseLogin;
    //   } catch (e) {
    //     throw Exception("Failed to parse response");
    //   }
    // }
    //
    // else if (response.statusCode == 400) {
    //   try {
    //     final jsonData = json.decode(res) as Map<String, dynamic>;
    //     final userResponseLogin = General_Model.fromJson(jsonData);
    //
    //     return userResponseLogin;
    //   } catch (e) {
    //     throw Exception("Failed to parse response");
    //   }
    // }
    else {
      throw Exception("An error occurred");
    }
  }

}