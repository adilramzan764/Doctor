import 'package:ehealthcare/Doctor/Create%20Profile/CreateProfileScreennTwo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CreateProfile extends StatefulWidget {
  const CreateProfile({Key? key}) : super(key: key);

  @override
  _CreateProfileState createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  String? selectedQualification;
  String? selectedRegistration;
  String? selectedIdentity;
  String _gender = 'Male';
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
                      child: SvgPicture.asset('images/heart.svg')
                  ),
                  const SizedBox(width: 8,),
                  const Text(
                    "Calneh E-Healthcare",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Color(0xff246BFD)),
                  ),


                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              width: 100, // Set your desired width here
              height: 100, // Set your desired height here
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('images/doc3.svg'),
                  fit: BoxFit
                      .cover, // Replace 'your_image.png' with the actual asset path
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              'Add photo',
              style: TextStyle(
                fontSize: 15,
                color: Color.fromRGBO(36, 107, 253, 1),
                fontWeight: FontWeight.bold,
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
           customWidget("Title", "Dr."),
            const SizedBox(
              height: 10,
            ),
            customWidget("Name", "Sikandar Bakht"),

            const SizedBox(
              height: 10,
            ),
            customWidget("City", "Lahore"),

            const SizedBox(
              height: 10,
            ),
            customWidget("Specialization", "Neuro-oncologist"),

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
                    value: 'Male',
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
                    value: 'Female',
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
            customWidget("Experience (Years)", "6"),

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
                isExpanded:
                    true, // To make the dropdown take the full available width
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
              child: Align(alignment: Alignment.centerLeft,
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
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(
                        217, 217, 217, 1), // Background color (RGBA)
                    border: Border.all(
                        color: Colors.black, width: 0.5), // Thin black border
                    borderRadius: BorderRadius.circular(
                        10), // Adjust the radius value to change the roundness
                  ),
                  child: const Icon(Icons.add, size: 60, color: Colors.grey),
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
                isExpanded:
                    true, // To make the dropdown take the full available width
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
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(
                        217, 217, 217, 1), // Background color (RGBA)
                    border: Border.all(
                        color: Colors.black, width: 0.5), // Thin black border
                    borderRadius: BorderRadius.circular(
                        10), // Adjust the radius value to change the roundness
                  ),
                  child: const Icon(Icons.add, size: 60, color: Colors.grey),
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
                isExpanded:
                    true, // To make the dropdown take the full available width
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
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(
                        217, 217, 217, 1), // Background color (RGBA)
                    border: Border.all(
                        color: Colors.black, width: 0.5), // Thin black border
                    borderRadius: BorderRadius.circular(
                        10), // Adjust the radius value to change the roundness
                  ),
                  child: const Icon(Icons.add, size: 60, color: Colors.grey),
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
              child:ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CreateProfileScreenTwo()));                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  elevation: 0,
                  padding: EdgeInsets.zero, // Remove the default padding to make the gradient cover the whole button
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

  Widget customWidget(String label, String hintText) {
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

          SizedBox(height: 5), // Adjust the height between the Text and TextField
          Container(
            height: 30,
            child: TextField(
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
}
