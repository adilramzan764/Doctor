import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import '../Models/General_Model.dart';
import '../Models/SignUp_Model.dart';
import '../const.dart';

class SignUpApi {
  static Future<SignUp_Model> doctorSignup(String name, String email, String password, String title, String specialization, String experience, String city, String gender, String imagePath, String doc1Path, String doc2Path, String doc3Path) async {
    try {
      String URL = "${baseUrl}doctorSignup"; // Replace 'baseUrl' with your actual base URL.
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(URL), // Replace with your server endpoint
      );

      // Set the Content-Type header
      request.headers['Content-Type'] = 'multipart/form-data';

      // Rest of your code...

      request.fields['title'] = title;
      request.fields['name'] = name;
      request.fields['city'] = city;
      request.fields['specialization'] = specialization;
      request.fields['gender'] = gender;
      request.fields['experience'] = experience;
      request.fields['email'] = email;
      request.fields['password'] = password;

      print(request.fields);
      // Profile Image
      File profileImageFile = File(imagePath);
      request.files.add(await http.MultipartFile.fromPath(
        'profileImage',
        profileImageFile.path,
        contentType: MediaType('image', 'jpeg'), // Adjust content type if needed
      ));

      // Document Files (if any)
      File documentFile1 = File(doc1Path);
      request.files.add(await http.MultipartFile.fromPath(
        'documents',
        documentFile1.path,
      ));

      File documentFile2 = File(doc2Path);
      request.files.add(await http.MultipartFile.fromPath(
        'documents',
        documentFile2.path,
      ));

      File documentFile3 = File(doc3Path);
      request.files.add(await http.MultipartFile.fromPath(
        'documents',
        documentFile3.path,
      ));
      print(request.files);
      var response = await request.send();
      print(response.request);
      // String res = response.body;


      if (response.statusCode == 200) {
        final jsonData = json.decode(await response.stream.bytesToString()) as Map<String, dynamic>;
        print('Doctor Created');
        return SignUp_Model.fromJson(jsonData);
      } else {
        print('Error: ${response.statusCode}');
        throw Exception('Failed to sign up doctor');
      }
    } catch (error) {
      print('Error: $error');
      throw Exception('An error occurred');
    }
  }
}
