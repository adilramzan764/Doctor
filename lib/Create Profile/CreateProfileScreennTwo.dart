import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../BottomNavigationBar/BottomNavbar.dart';
import 'CreateProfile.dart';
import 'CreateProfileScreenThree.dart';

class CreateProfileScreenTwo extends StatefulWidget {
  bool clinicChecked;
   CreateProfileScreenTwo({Key? key,required this.clinicChecked}) : super(key: key);

  @override
  _CreateProfileScreenTwoState createState() => _CreateProfileScreenTwoState();
}

class _CreateProfileScreenTwoState extends State<CreateProfileScreenTwo> {
  bool isChecked1 = true;
  bool isChecked2 = false;

  // void _toggleCheckbox1() {
  //   setState(() {
  //     isChecked1 = !isChecked1;
  //   });
  // }

  // void _toggleCheckbox2() {
  //   setState(() {
  //     isChecked2 = !isChecked2;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 60),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    height: 50,
                    width: 50,
                    child: SvgPicture.asset('images/heart.svg')),
                SizedBox(
                  width: 8,
                ),
                const Text(
                  "Calneh E-Healthcare",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff246BFD)),
                ),
                Expanded(
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: const Icon(
                        Icons.error_outline,
                        size: 24,
                      )),
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Row(
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 2.0,
                      color: isChecked1 ? Colors.black : Colors.grey,
                    ),
                    color: isChecked1 ? Colors.black : Colors.transparent,
                  ),
                  child: isChecked1
                      ? Icon(
                          Icons.check,
                          size: 16.0,
                          color: Colors.white,
                        )
                      : null,
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Your Profile',
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Mr.Sikander Bakht',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => CreateProfile()));
                      },
                      child: Text(
                        'Edit',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Row(
              children: [
                InkWell(
                  // onTap: _toggleCheckbox2,
                  child: Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 2.0,
                        color: widget.clinicChecked ? Colors.black : Colors.grey,
                      ),
                      color: widget.clinicChecked ? Colors.black : Colors.transparent,
                    ),
                    child: widget.clinicChecked
                        ? Icon(
                            Icons.check,
                            size: 16.0,
                            color: Colors.white,
                          )
                        : null,
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Cinic Profile',
                      style: TextStyle(fontSize: 17, color: Colors.black),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      'Create your profile to make your clinic\n visibleto patients on app',
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    CreateProfileScreenThree()));
                      },
                      child: Text(
                        "Add a Clinic",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Spacer(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 50,
              width: 300,
              decoration: widget.clinicChecked && isChecked1
                  ? BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromRGBO(38, 43, 198, 1),
                          Color.fromRGBO(36, 107, 253, 1),
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    )
                  : BoxDecoration(
                      color: Color.fromRGBO(217, 217, 217, 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
              child: ElevatedButton(
                onPressed: () {
                  if(isChecked1==true && widget.clinicChecked==true)
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BottomNavigationBarScreen()),
                    (route) => false,
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  elevation: 0, // Set the button background to transparent
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Submit Profile',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
