import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../ApiServices/SignUp_Api.dart';
import '../../Models/SignUp_Model.dart';
import '../utils/Snackbar.dart';
import '../utils/loader.dart';
import 'CreateProfileScreennTwo.dart';

class CreateProfile extends StatefulWidget {
  String email;
  String password;

  CreateProfile({Key? key, required this.email, required this.password})
      : super(key: key);

  @override
  _CreateProfileState createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  String? selectedQualification;
  String? selectedRegistration;
  String? selectedIdentity;
  String _gender = 'male';

  String? _qualificationProof;

  File? _qualificationProofpath;

  String? _registrationProof;
  File? _registrationProofpath;

  String? _identityProof;
  String? _identityProofpath;

  File? _image;
  List<File> _selectedDocuments = [];

  Future<void> _getImageFromGallery() async {
    FilePickerResult? imageResult =
        await FilePicker.platform.pickFiles(type: FileType.image);

    if (imageResult != null) {
      setState(() {
        _image = File(imageResult.files.first.path!);
      });
    }
  }

  Future<void> _pickFile(String variableToUpdate) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      // type: FileType.custom,
      // allowedExtensions: ['pdf'],
    );

    if (result != null && result.files.isNotEmpty) {
      setState(() {
        _selectedDocuments.add(File(result.files.first.path!));
        if (variableToUpdate == '_qualificationProof') {
          _qualificationProof = result.files.first.name;
          _qualificationProofpath = File(result.files.first.path!);
          // _qualificationProofpath=File(result.paths);
        } else if (variableToUpdate == '_registrationProof') {
          _registrationProof = result.files.first.name;
          _registrationProofpath = File(result.files.first.path!);
        } else if (variableToUpdate == '_identityProof') {
          _identityProof = result.files.first.name;
          _identityProofpath = result.files.first.path;
        }
        // Add more conditions for other variables if needed
      });
    }
  }

  final TextEditingController titleController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController specializationController =
      TextEditingController();
  final TextEditingController experienceController = TextEditingController();



  Future<void> _setid(String id) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("id", id);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 60),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      height: 50,
                      width: 50,
                      child: SvgPicture.asset('images/heart.svg')),
                  const SizedBox(
                    width: 8,
                  ),
                  const Text(
                    "Calneh E-Healthcare",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff246BFD)),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            _image == null
                ? Container(
                    width: 120, // Set your desired width here
                    height: 120, // Set your desired height here
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('images/doc3.svg'),
                        fit: BoxFit
                            .cover, // Replace 'your_image.png' with the actual asset path
                      ),
                    ),
                  )
                : Container(
                    width: 120, // Set your desired width here
                    height: 120, // Set your desired height here
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: FileImage(_image!),
                        fit: BoxFit
                            .cover, // Replace 'your_image.png' with the actual asset path
                      ),
                    ),
                  ),
            const SizedBox(
              height: 5,
            ),
            TextButton(
              onPressed: () {
                _getImageFromGallery();
              },
              child: const Text(
                'Add photo',
                style: TextStyle(
                  fontSize: 15,
                  color: Color.fromRGBO(36, 107, 253, 1),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Divider(
              thickness: 4,
              color: Colors.grey[400],
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Basic Details',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            customWidget("Title", "Dr.", titleController),
            const SizedBox(
              height: 10,
            ),
            customWidget("Name", "Sikandar Bakht", nameController),
            const SizedBox(
              height: 10,
            ),
            customWidget("City", "Lahore", cityController),
            const SizedBox(
              height: 10,
            ),
            customWidget(
                "Specialization", "Neuro-oncologist", specializationController),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Gender',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Row(
                children: [
                  Radio(
                    value: 'male',
                    groupValue: _gender,
                    onChanged: (value) {
                      setState(() {
                        _gender = value.toString();
                      });
                    },
                  ),
                  const Text('Male'),
                  const SizedBox(width: 20),
                  Radio(
                    value: 'female',
                    groupValue: _gender,
                    onChanged: (value) {
                      setState(() {
                        _gender = value.toString();
                      });
                    },
                  ),
                  const Text('Female'),
                ],
              ),
            ),
            customWidget("Experience (Years)", "6", experienceController),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 25, 0, 25),
              child: Divider(
                thickness: 4,
                color: Colors.grey[400],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Education Qualification and Proof',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Qualification Details',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: DropdownButton<String>(
                isExpanded: true,
                // To make the dropdown take the full available width
                value: selectedQualification,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedQualification = newValue;
                  });
                },
                icon: const Icon(
                  CupertinoIcons.forward,
                  size: 18,
                ),
                items: <String>['MBBS', 'Other'].map<DropdownMenuItem<String>>(
                  (String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  },
                ).toList(),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'upload image or pdf of qualification proof',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Text(
                  'Non allied practitioners should submit council registration proof with metioned degree name. Allied practitioners should submit mark sheets or passing certificated from UGC approved university.'),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 0, 20, 0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: InkWell(
                    onTap: () {
                      _pickFile('_qualificationProof');
                    },
                    child: customButton()),
              ),
            ),
            if (_qualificationProof != null)
              Padding(
                padding: const EdgeInsets.only(top: 13.0, left: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Selected File:',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            if (_qualificationProof != null)
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    _qualificationProof!,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
            const SizedBox(
              height: 20,
            ),
            Divider(
              thickness: 4,
              color: Colors.grey[400],
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Registration Details and Proof',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Registration Details',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: DropdownButton<String>(
                isExpanded: true,
                // To make the dropdown take the full available width
                value: selectedRegistration,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedRegistration = newValue;
                  });
                },
                icon: const Icon(
                  CupertinoIcons.forward,
                  size: 18,
                ),
                items: <String>['MBBS', 'Other'].map<DropdownMenuItem<String>>(
                  (String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  },
                ).toList(),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'upload image or pdf of registration proof',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: InkWell(
                    onTap: () {
                      _pickFile('_registrationProof');
                    },
                    child: customButton()),
              ),
            ),
            if (_registrationProof != null)
              Padding(
                padding: const EdgeInsets.only(top: 13.0, left: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Selected File:',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            if (_registrationProof != null)
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    _registrationProof!,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
            const SizedBox(
              height: 20,
            ),
            Divider(
              thickness: 4,
              color: Colors.grey[400],
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Identity Proofs',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Documents to be uploaded',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: DropdownButton<String>(
                isExpanded: true,
                // To make the dropdown take the full available width
                value: selectedIdentity,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedIdentity = newValue;
                  });
                },
                icon: const Icon(
                  CupertinoIcons.forward,
                  size: 18,
                ),
                items: <String>['MBBS', 'Other'].map<DropdownMenuItem<String>>(
                  (String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  },
                ).toList(),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'upload image or pdf of identity proof',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: InkWell(
                    onTap: () {
                      _pickFile('_identityProof');
                    },
                    child: customButton()),
              ),
            ),
            if (_identityProof != null)
              Padding(
                padding: const EdgeInsets.only(top: 13.0, left: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Selected File:',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            if (_identityProof != null)
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    _identityProof!,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
            const SizedBox(
              height: 20,
            ),
            Divider(
              thickness: 4,
              color: Colors.grey[400],
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 50,
              width: 300,
              child: ElevatedButton(
                onPressed: () async {
                  print(_qualificationProofpath);
                  print(_image);
                  print(_qualificationProofpath);


                  try {

                      await EasyLoading.show(
                        status: 'Signing Up..',
                        maskType: EasyLoadingMaskType.black,
                      );

                    SignUp_Model signUpResponse = await SignUpApi.doctorSignup(
                      nameController.text,
                      widget.email,
                      widget.password,
                      titleController.text,
                      specializationController.text,
                      experienceController.text,
                      cityController.text,
                      _gender,
                      _image!.path.toString(),
                      _qualificationProofpath!.path.toString(),
                      _qualificationProofpath!.path.toString(),
                      _qualificationProofpath!.path.toString(),
                    );

                    // Dismiss the loading indicator when the response is received
                    // Navigator.pop(context);

                    if (signUpResponse.message != null && signUpResponse.id!=null) {

                      await EasyLoading.dismiss();

                      print(signUpResponse.message);
                      _setid(signUpResponse.id.toString());
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  CreateProfileScreenTwo( clinicChecked: false,)),
                      );

                    }else  {
                      await EasyLoading.dismiss();


                      print(signUpResponse.message);
                      SnackbarManager.showSnackbar(
                        title: 'Errror!',
                        message: 'Fill the required fields',
                        context: context,
                      );

                    }
                  } catch (error) {
                    await EasyLoading.dismiss();

                    print('Sign Up Error: $error');
                    SnackbarManager.showSnackbar(
                      title: 'Errror!',
                      message: 'Fill the required fields',
                      context: context,
                    );
                    // Handle error, show an error message to the user, etc.
                    // Navigator.pop(context); // Dismiss the loading indicator in case of an error
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  elevation: 0,
                  padding: EdgeInsets.zero,
                  // Remove the default padding to make the gradient cover the whole button
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Container(
                  width: 300,
                  height: 50,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromRGBO(38, 43, 198, 1),
                        Color.fromRGBO(36, 107, 253, 1),
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text(
                      'Next',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }

  Widget customWidget(
      String label, String hintText, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 2),
      // Adjust the vertical padding here
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 13,
              color: Color(0xff77787A),
            ),
          ),

          SizedBox(height: 5),
          // Adjust the height between the Text and TextField
          Container(
            height: 30,
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                suffixIcon: label == "Location"
                    ? Icon(
                        CupertinoIcons.right_chevron,
                        size: 20,
                        color: Color(0xff09121F),
                      )
                    : SizedBox(),
                hintText: hintText,
                hintStyle: TextStyle(color: Color(0xff282828), fontSize: 15),
                // contentPadding: EdgeInsets.only(top: 15), // Adjust the vertical padding here
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget customButton() {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        color:
            const Color.fromRGBO(217, 217, 217, 1), // Background color (RGBA)
        border:
            Border.all(color: Colors.black, width: 0.5), // Thin black border
        borderRadius: BorderRadius.circular(
            10), // Adjust the radius value to change the roundness
      ),
      child: const Icon(Icons.add, size: 60, color: Colors.grey),
    );
  }
}
