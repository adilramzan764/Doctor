import 'dart:math';

import 'package:ehealthcare/Doctor/Verify.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../ApiServices/OTP_Api.dart';
import '../../Models/General_Model.dart';
import '../Doctor/Login.dart';


class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  void navigateToLoginScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Login(),
      ),
    );
  }


  final General_Model otpService = General_Model(); // Create an instance of your OTPService class
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();


  int _generateRandomOTP(int length) {
    final random = Random();
    final max = pow(10, length).toInt();
    return random.nextInt(max);
  }

  void _onSignupButtonPressed(int otp) async {
    String email = _emailController.text;

    if (email.isNotEmpty && otp > 0) {
      try {
        General_Model otpService = await OTP_Api.login(email, otp);
        // Handle the OTPService object based on your requirements
        // For example, you can show a toast message based on the response
        if (otpService.message != null) {
          print( "This is the message"+otpService.message!);
        } else if (otpService.error != null) {
          print("This is the error"+ otpService.error!);
        }
      } catch (e) {
        print( 'Failed to authenticate');
      }
    } else {
      print( 'Please enter valid email and OTP');
    }
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
                    controller: _emailController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Email',
                    ),
                  ),
                ),),
              SizedBox(height: 10,),
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
                    controller: _passwordController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Password',
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
                      int otp = _generateRandomOTP(4);
                      print(otp);
                      _onSignupButtonPressed(otp);

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VerifyScreen(otp: otp,email: _emailController.text,password: _passwordController.text,),
                        ),
                      );


                      // Navigator.pushAndRemoveUntil(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => WelcomeScreen()),
                      //       (route) => false,
                      // );
                    },
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
                        'SignUp',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 12, 0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Login(),
                            ),
                          );
                        },
                        child: Text(
                          'SignIn',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(36, 107, 253, 1),
                          ),
                        ),
                      ),
                    ],
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


