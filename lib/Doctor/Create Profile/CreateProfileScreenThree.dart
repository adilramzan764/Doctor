import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ClinicInfo_timing.dart';

class CreateProfileScreenThree extends StatefulWidget {
  const CreateProfileScreenThree({Key? key}) : super(key: key);

  @override
  _CreateProfileScreenThreeState createState() =>
      _CreateProfileScreenThreeState();
}

class _CreateProfileScreenThreeState extends State<CreateProfileScreenThree> {
  String? selectedClinic;
  String? selectedLocation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 60,),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 20
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back, size: 24)),
                Text(
                  'Add Clinic',
                  style:
                  TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20, width: 20,)
              ],
            ),
          ),
          SizedBox(
            height: 70,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 2),
            // Adjust the vertical padding here
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Clinic",
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

                      hintText: "Dr. Hospital",
                      hintStyle: TextStyle(color: Color(0xff282828), fontSize: 15),
                      // contentPadding: EdgeInsets.only(top: 15), // Adjust the vertical padding here
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10, // Adjust the height here
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "City",
                style: TextStyle(
                  fontSize: 13,
                  color: Color(0xff77787A),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Container(
              height: 32,
              child: DropdownButton<String>(
                isExpanded: true,
                value: selectedClinic,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedClinic = newValue;
                  });
                },
                icon: Icon(
                  CupertinoIcons.forward,
                  size: 18,
                ),
                items: <String>['Lahore', 'Sahiwal', 'Islamabad', 'Other']
                    .map<DropdownMenuItem<String>>(
                      (String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  },
                ).toList(),
                underline: Container(
                  height: 1, // Set the height of the underline
                  color: Colors.black38, // Change the color here
                ),
              ),

            ),
          ),

          SizedBox(
            height: 10, // Adjust the height here
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Locality',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Container(
              height: 32,
              child: DropdownButton<String>(

                isExpanded:
                true, // To make the dropdown take the full available width
                value: selectedLocation,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedLocation = newValue;
                  });
                },
                icon: Icon(
                  CupertinoIcons.forward,
                  size: 18,
                ),
                items: <String>[
                  'Location A',
                  'Location B',
                  'Location C',
                  'Other'
                ].map<DropdownMenuItem<String>>(
                      (String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  },
                ).toList(),
                underline: Container(
                  height: 1, // Set the height of the underline
                  color: Colors.black38, // Change the color here
                ),
              ),
            ),
          ),
          Spacer(),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: 50,
              width: 300,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ClinicInfo_timing()));
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero, // Remove the default padding to make the gradient cover the whole button
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Container(
                  width: 300,
                  height: 50,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromRGBO(38, 43, 198, 1),
                        Color.fromRGBO(36, 107, 253, 1),
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'Continue',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 30,)
        ],
      ),
    );
  }
}
