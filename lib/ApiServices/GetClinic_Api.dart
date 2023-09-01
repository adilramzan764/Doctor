import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/GetClinics_Model.dart';
import '../const.dart';

class GetClinic_Api {

  // Fetch doctor posts
  static Future<GetClinicsModel> fetchDoctorPosts() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String id = preferences.getString("id").toString();
    final response = await http.get(Uri.parse('${baseUrl}getClinicbyDoctroId/$id')); // Adjust the endpoint accordingly
    String res = response.body;
    print(response);
    print("Clininc data");
    print(res);

    if (res.isNotEmpty) {
      final jsonData = json.decode(response.body) as Map<String, dynamic>;
      print("Clininc data");
      print(res);

      print(jsonData);
      return GetClinicsModel.fromJson(jsonData);
    }
    else {
      throw Exception("Failed to fetch doctor information");
    }
  }
}
