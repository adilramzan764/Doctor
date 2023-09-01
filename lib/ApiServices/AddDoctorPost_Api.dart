import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Models/DoctorPost_Model.dart';
import '../const.dart';

class AddDoctorPost_Api {
  static Future<DoctorPostsAdd_Model> addpost(  String desc, String date,  String imagePath) async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String id = preferences.getString("id").toString();
      String URL = "${baseUrl}doctorPostsAdd"; // Replace 'baseUrl' with your actual base URL.
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(URL), // Replace with your server endpoint
      );

      // Set the Content-Type header
      request.headers['Content-Type'] = 'multipart/form-data';

      // Rest of your code...

      request.fields['doctorId'] = id;
      request.fields['desc'] = desc;
      request.fields['date'] = date;


      print(request.fields);
      // Profile Image
      File ImageFile = File(imagePath);
      request.files.add(await http.MultipartFile.fromPath(
        'image',
        ImageFile.path,
        contentType: MediaType('image', 'jpeg'), // Adjust content type if needed
      ));



      var response = await request.send();
      print(response.request);

      if (response.statusCode == 200) {
        final jsonData = json.decode(await response.stream.bytesToString()) as Map<String, dynamic>;
        print('Post Added');
        return DoctorPostsAdd_Model.fromJson(jsonData);
      } else {
        print('Error: ${response.statusCode}');
        throw Exception('Failed to add post');
      }
    } catch (error) {
      print('Error: $error');
      throw Exception('An error occurred');
    }
  }
}
