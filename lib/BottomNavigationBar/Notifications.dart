import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                      child: SvgPicture.asset('images/heart.svg')
                  ),
                  SizedBox(width: 8,),
                  const Text(
                    "Calneh E-Healthcare",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Color(0xff246BFD)),
                  ),

                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: const Text(
                        "Notifications",
                        style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),

                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                  child: Text(
                    'Notifications',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(11, 0, 0, 0),
                  child: Text(
                    'All',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                  child: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 15,
                    color: Colors.grey,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
                  child: Text('Mark all as read'),
                ),
                SizedBox(
                  width: 7,
                ),
                Icon(
                  Icons.check_circle_outline,
                  size: 20,
                ),
              ],
            ),
            SizedBox(
              height: 18,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(3, 0, 0, 0),
              child: Stack(
                children: [
                  SvgPicture.asset('images/dot.svg'),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                        child: Container(
                          width: 40, // Set your desired width here
                          height: 40, // Set your desired height here
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage('images/m1.svg'),
                                fit: BoxFit
                                    .cover // Replace 'your_image.png' with the actual asset path
                                ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(color: Colors.black, fontSize: 12),
                            children: [
                              TextSpan(
                                  text: '   Lux Murphy',
                                  style: TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text:
                                      ' requested access to '), // Add \n for a line break
                              TextSpan(
                                  text: 'UNIX  directory tree\n',
                                  style: TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: '   hierarchy',
                                  style: TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(60, 0, 0, 0),
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Handle the 'Accept' button press
                        },
                        style: ElevatedButton.styleFrom(
                          primary:
                              Color.fromRGBO(36, 107, 253, 1), // Background color
                          minimumSize: Size(54, 24), // Set the width and height
                        ),
                        child: Text(
                          'Accept',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(width: 10), // Add some spacing between the buttons
                      ElevatedButton(
                        onPressed: () {
                          // Handle the 'Reject' button press
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white, // Background color
                          onPrimary: Colors.black, // Text color
                          minimumSize: Size(54, 24), // Set the width and height
                        ),
                        child: Text('Reject'),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 140, 0),
                  child: Text(
                    'Today at 9:42 pm',
                    style: TextStyle(
                      color: Color.fromRGBO(165, 172, 184, 1),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              thickness: 3,
              color: Color.fromRGBO(228, 232, 238, 1),
            ),
            SizedBox(
              height: 18,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(3, 0, 0, 0),
              child: Stack(
                children: [
                  SvgPicture.asset('images/dot.svg'),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                        child: Container(
                          width: 40, // Set your desired width here
                          height: 40, // Set your desired height here
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage('images/m1.svg'),
                                fit: BoxFit
                                    .cover // Replace 'your_image.png' with the actual asset path
                                ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(color: Colors.black, fontSize: 12),
                            children: [
                              TextSpan(
                                  text: '   Ray Arnold',
                                  style: TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text:
                                      ' left 6 comments on '), // Add \n for a line break
                              TextSpan(
                                  text: 'Isla NublarSOC2\n',
                                  style: TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: '   Complaince report',
                                  style: TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(32, 0, 140, 0),
                  child: Text(
                    'Yesterday at 9:42 pm',
                    style: TextStyle(
                      color: Color.fromRGBO(165, 172, 184, 1),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              thickness: 3,
              color: Color.fromRGBO(228, 232, 238, 1),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(3, 0, 0, 0),
              child: Stack(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                        child: Container(
                          width: 40, // Set your desired width here
                          height: 40, // Set your desired height here
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage('images/m2.svg'),
                                fit: BoxFit
                                    .cover // Replace 'your_image.png' with the actual asset path
                                ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(color: Colors.black, fontSize: 12),
                            children: [
                              TextSpan(
                                  text: '   Dennis Nerrdy',
                                  style: TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text:
                                      ' commented on '), // Add \n for a line break
                              TextSpan(
                                  text: 'Isla NublarSOC2\n',
                                  style: TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: '   Complaince report',
                                  style: TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 70,
              width: 300,
              child: Row(
                children: [
                  VerticalDivider(
                    thickness: 4,
                    color: Colors.grey,
                  ),
                  Flexible(
                    // or Expanded
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Text(
                        'Oh, I finished de-bugging the phones, but the systems compiling for eighteen minutes, or twenty. So, some minor systems may go on and off for a while.',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 158, 0),
              child: Text(
                '           Yesterday at 9:42 pm',
                style: TextStyle(
                  color: Color.fromRGBO(165, 172, 184, 1),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              thickness: 3,
              color: Color.fromRGBO(228, 232, 238, 1),
            ),
            SizedBox(
              height: 5,
            ),


            Padding(
              padding: const EdgeInsets.fromLTRB(3, 0, 0, 0),
              child: Stack(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                        child: Container(
                          width: 40, // Set your desired width here
                          height: 40, // Set your desired height here
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage('images/m3.svg'),
                                fit: BoxFit
                                    .cover // Replace 'your_image.png' with the actual asset path
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(color: Colors.black, fontSize: 12),
                            children: [
                              TextSpan(
                                  text: '   John Hammanand',
                                  style: TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text:
                                  ' created '), // Add \n for a line break
                              TextSpan(
                                  text: 'Isla Nublar SOC2\n',
                                  style: TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: '   Complaince report',
                                  style: TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 120, 0),
              child: Text(
                '   Yesterday at 9:42 pm',
                style: TextStyle(
                  color: Color.fromRGBO(165, 172, 184, 1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
