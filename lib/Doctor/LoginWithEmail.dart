import 'package:ehealthcare/Doctor/Welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'Create Profile/CreateProfile.dart';
import 'Login.dart';

class LoginWithEmail extends StatefulWidget {
  const LoginWithEmail({Key? key}) : super(key: key);

  @override
  _LoginWithEmailState createState() => _LoginWithEmailState();
}

class _LoginWithEmailState extends State<LoginWithEmail> {
  void navigateToLoginScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Login(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height, // Set a specific height or use Expanded to fill the available height

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch, // Stretch the content horizontally

            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 180, 0, 0),
                child: SvgPicture.asset(
                  'images/logo.svg',
                  width: 220,
                  height: 130,
                ),
              ),
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child:
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(36, 107, 253, 0.12),
                        border: Border.all(
                          color: Color.fromRGBO(36, 107, 253, 1),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        // keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Email',
                        ),
                      ),
                    ),),
                    SizedBox(height: 13),
                    GestureDetector(
                      onTap: navigateToLoginScreen,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Continue using Phone Number?',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color.fromRGBO(36, 107, 253, 1),
                            ),
                          ),
                        ),
                      ),
                    ),
                    // SizedBox(height: 230),
              Spacer(),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 12, 0),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: RichText(
                          text: TextSpan(
                            text: 'By logging in, you agree to the ',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                            ),
                            children: [
                              TextSpan(
                                text: 'terms',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(36, 107, 253, 1),
                                ),
                              ),
                              TextSpan(text: ' and '),
                              TextSpan(
                                text: 'conditions',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(36, 107, 253, 1),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: Container(
                  width: 200,
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
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => WelcomeScreen()),
                            (route) => false,
                      );             },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      elevation: 0,
                      padding: EdgeInsets.zero, // Remove the default padding to make the gradient cover the whole button
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 30,)


            ],
          ),
        ),
      ),
    );
  }
}


