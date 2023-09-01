import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/GetDoctorPost_Model.dart';
import '../User/GetDoctorPost.dart';
import '../const.dart';


class GetDoctorPost_Api {
  Future<DoctorPostsResponse> fetchDoctorPosts() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String id = preferences.getString("id").toString();
    String URL = "${baseUrl}GetdoctorPostsbyId/$id"; // Replace 'baseUrl' with your actual base URL.
    final response = await http.get(Uri.parse(URL));
    String res = response.body;

    if (res.isNotEmpty) {
      final jsonData = json.decode(response.body);
      final doctorPostsResponse = DoctorPostsResponse.fromJson(jsonData);



      return doctorPostsResponse;
    } else {
      throw Exception('Failed to fetch doctor posts');
    }
  }
}