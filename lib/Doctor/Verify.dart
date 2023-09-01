
import 'dart:async';

import 'package:ehealthcare/Doctor/Welcome.dart';
import 'package:ehealthcare/utils/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../utils/Snackbar.dart';
import 'Login.dart';


import 'package:flutter/cupertino.dart';

class VerifyScreen extends StatefulWidget {
  String email;
  String password;
  final int otp;

  VerifyScreen({Key? key, required this.otp,required this.email ,required this.password}) : super(key: key);

  @override
  _VerifyScreenState createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {

  TextEditingController _otpController = TextEditingController();




   Future<void> _startLoading(BuildContext context) async {
    // _timer?.cancel();


     await LoaderManager.startLoading(loadingStatus: 'Verifying...').then((value) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (BuildContext context) => WelcomeScreen(email: widget.email, password: widget.password)),
            // (Route<dynamic> route) => false,
      );

      SnackbarManager.showSnackbar(
        title: 'Email Verification',
        message: 'Your Email has been successfully verified',
        context: context,
      );

    });


    print('EasyLoading show');
  }

  String maskEmail(String email) {
    final parts = email.split('@');
    final username = parts[0];
    final domain = parts[1];

    final maskedUsername = username.substring(0, 1) + '*' * (username.length - 4);

    return '$maskedUsername@$domain';
  }




  String maskedEmail='';

  @override
  void dispose() {

    super.dispose();

  }
  int _secondsRemaining = 120; // 1 minute in seconds
  @override
  void initState() {
    super.initState();
    maskedEmail = maskEmail(widget.email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0,right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.black, size: 22),
                    onPressed: () {
                      // Navigate to the login screen
                     Navigator.pop(context);
                    },
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Email Verification',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 50,
                    width: 50,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'The code has been sent to ',
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(
                  width: 1,
                ),
                Text(
                  // 'ruyt',
                  maskedEmail,
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
            SizedBox(
              height: 70,
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  23,
                  0,
                  23,
                  0,
                ),
                child: PinCodeTextField(
                  controller: _otpController,
                  keyboardType: TextInputType.number,
                  appContext: context,
                  length: 4,
                  onChanged: (value) {
                    // Handle pin code value change
                  },
                  pinTheme: PinTheme(
                    fieldHeight: 46,
                    fieldWidth: 60,
                    shape: PinCodeFieldShape.box,
                    activeColor: Colors.grey,
                    activeFillColor: Color.fromRGBO(36, 107, 253, 0.12),
                    inactiveColor: Colors.grey,
                    inactiveFillColor: Colors.grey[200],
                    selectedColor: Colors.blue,
                    selectedFillColor: Colors.blueAccent,
                    borderWidth: 2,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 27,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                100,
                0,
                0,
                0,
              ),
              child: Row(
                children: [
                  Text(
                    'Resend Code in',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Text(
                  ' $_secondsRemaining',
                    style: TextStyle(
                        fontSize: 16, color: Color.fromRGBO(36, 107, 252, 1)),
                  ),
                  Text(
                    's',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 70,
            ),
            SizedBox(
              height: 50,
              width: 300,
              child: ElevatedButton(
                onPressed: () {
                  if (_otpController.text == widget.otp.toString()) {
                    print("Entered OTP: " + _otpController.text);
                    print("Expected OTP: " + widget.otp.toString());

                    _startLoading(context);
                  }
                  else{
                    SnackbarManager.showSnackbar(
                      title: 'Email Verification',
                      message: 'Invalid Pincode. Try Again!',
                      context: context,
                    );

                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(36, 107, 253, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Verify',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
