import 'package:ehealthcare/Doctor/Welcome.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'Login.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({Key? key}) : super(key: key);

  @override
  _VerifyScreenState createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                      );
                    },
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Phone Number Verification',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                    width: 10,
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
                  'The code has been sent to',
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(
                  width: 1,
                ),
                Text(
                  '+92323847****23',
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
                    '55',
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
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => WelcomeScreen()),
                    (route) => false,
                  );
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
