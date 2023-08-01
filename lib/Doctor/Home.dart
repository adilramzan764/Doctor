
import 'package:ehealthcare/Doctor/All_Reviews.dart';
import 'package:ehealthcare/Doctor/Create%20Profile/CreateProfileScreenThree.dart';
import 'package:ehealthcare/Doctor/Create%20Profile/CreateProfileScreennTwo.dart';
import 'package:ehealthcare/Doctor/Settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'Create Profile/CreateProfile.dart';
import 'Earnings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [

            Padding(
              padding: const EdgeInsets.only(top: 60.0,left: 25,right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.blue),
                        image: DecorationImage(image: AssetImage("images/doc2.svg"),fit: BoxFit.cover)
                    ),
                  ),
                  IconButton(
                    icon: SvgPicture.asset(
                      'images/settings.svg', // Replace this with the path to your SVG icon
                      height: 28, // Adjust the height of the SVG icon
                      width: 28, // Adjust the width of the SVG icon
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Settings()));
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Mr.Sikandar Bakht',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 3,),
                  Text(
                    'Neuro-oncologist',
                    style: TextStyle(
                        fontSize: 15, color: Color.fromRGBO(119, 120, 122, 1)),
                  ),
                  SizedBox(height: 3,),

                  Text(
                    'Certificate in Nutrition and Health in\nHospitalized',
                    style: TextStyle(
                        fontSize: 15, color: Color.fromRGBO(119, 120, 122, 1)),
                  ),
                  SizedBox(height: 3,),


                  Text(
                    '6 Years Experience',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 20,),

                  Text(
                    '00878765765',
                    style: TextStyle(color: Color.fromRGBO(119, 120, 122, 1)),
                  ),
                  SizedBox(height: 3,),

                  Text(
                    'Certificate in Nutrition and Health in Hospitalized',
                    style: TextStyle(color: Color.fromRGBO(119, 120, 122, 1)),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Divider(
              thickness: 7,
              color: Color.fromRGBO(237, 239, 243, 1),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    20,
                    0,
                    0,
                    0,
                  ),
                  child: Text(
                    'My Clinics',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                  child: TextButton(
                    onPressed: () { Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CreateProfileScreenThree())); },
                    child: Text(
                      'Add New Clinic',
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold,color: Color.fromRGBO(36, 107, 253, 1)),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 15, 0, 0),
                  child:
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        // border: Border.all(color: Colors.blue),
                        image: DecorationImage(image: AssetImage("images/clinic.svg"),fit: BoxFit.cover)
                    ),
                  ),

                ),
                SizedBox(width: 15,),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dr Hospital',
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        'Model Town Lahore',
                        style: TextStyle(
                            fontSize: 15,
                            color: Color.fromRGBO(119, 120, 122, 1)),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Icon(
                      Icons
                          .arrow_forward_ios_outlined, // Using Material Design icon (favorite)
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Divider(
              thickness: 7,
              color: Color.fromRGBO(237, 239, 243, 1),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 290,
              width: 310,
              color: Color.fromRGBO(234, 67, 53, 0.13),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 0, 0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.close, // Using Material Design icon (favorite)
                            size: 25,
                            color: Colors.red,
                          ), onPressed: () {  },
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: Text(
                            'Your profile is rejected',
                            style: TextStyle(fontSize: 18, color: Colors.red),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 10, 20, 0),
                      child: Text(
                        "We regret to inform you that your profile could not be verified due to Qualification proof is blur.",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(
                        8,
                        0,
                        18,
                        0,
                      ),
                      child: Divider(
                        thickness: 2,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 5, 0, 0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Action Required:',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
                      child: Text(
                        'Please re-upload the document for re-verification',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 50,
                      width: 280,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CreateProfile()));
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          'Update & Send',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              thickness: 5,
              color: Color.fromRGBO(
                237,
                239,
                243,
                1,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => All_Reviews()));
                  },
                  child: Container(
                    height: 120,
                    width: 150,
                    color: Color.fromRGBO(227, 236, 255, 1),

                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0,25,0,0),
                          child: SvgPicture.asset(
                            'images/communication.svg',
                            // You can customize the size and other properties here
                            width: 50,
                            height: 50,
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(0,5,0,0),
                          child: Text('My Reviews'),
                        ),
                      ],
                    ),
                  ),
                ),

SizedBox(width: 10,),

                GestureDetector(
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EarningScreen()));
                  },
                  child: Container(
                    height: 120,
                    width: 150,
                    color: Color.fromRGBO(227, 236, 255, 1),

                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0,27,0,0),
                          child: SvgPicture.asset(
                            'images/finance.svg',
                            // You can customize the size and other properties here
                            width: 50,
                            height: 50,
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(0,7,0,0),
                          child: Text('My Earnings'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
