import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/GetDoctorIno_Model.dart';
import '../const.dart';
// Import your DoctorInfoModel class

class GetDoctorInfo_Api {
  static Future<DoctorInfoModel> getDoctorInfo() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String id=  preferences.getString("id").toString();
    print(id);

    final String apiUrl = "${baseUrl}getDoctorInfo/$id"; // Replace with your API URL
    final response = await http.get(Uri.parse(apiUrl));
    String res = response.body;

    if (res.isNotEmpty) {
      final jsonData = json.decode(response.body) as Map<String, dynamic>;
      preferences.setString("profileImage",  DoctorInfoModel.fromJson(jsonData).userExists.profileImage);
      preferences.setString("title", DoctorInfoModel.fromJson(jsonData).userExists.title);
      preferences.setString("name",DoctorInfoModel.fromJson(jsonData).userExists.name);
      print(jsonData);
      return DoctorInfoModel.fromJson(jsonData);
    }
    else {
      throw Exception("Failed to fetch doctor information");
    }
  }
}
