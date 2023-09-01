import 'dart:math';

import 'package:ehealthcare/Doctor/Verify.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../ApiServices/LogIn_Api.dart';
import '../ApiServices/OTP_Api.dart';
import '../Create Profile/SignUp.dart';
import '../Models/LogIn_Model.dart';
import '../Models/General_Model.dart';
import '../utils/loader.dart';
import '../BottomNavigationBar/BottomNavbar.dart';
import 'Login.dart';

class LoginWithEmail extends StatefulWidget {
  const LoginWithEmail({Key? key}) : super(key: key);

  @override
  _LoginWithEmailState createState() => _LoginWithEmailState();
}

class _LoginWithEmailState extends State<LoginWithEmail> {

  Future<void> _startLoading(BuildContext context) async {
    // _timer?.cancel();


    await LoaderManager.startLoading(loadingStatus: 'Signing In...').then((value) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => BottomNavigationBarScreen()), // Replace with your new screen widget
            (Route<dynamic> route) => false, // This predicate removes all previous routes
      );



    });


    print('EasyLoading show');
  }

  String _responseError = ''; // To store the error message
  String _responseMessage = ''; // To store the success message

  void navigateToLoginScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Login(),
      ),
    );
  }


  final General_Model otpService = General_Model(); // Create an instance of your OTPService class
  TextEditingController _emailController = TextEditingController(text: "adilramzan764@gmail.com");
  TextEditingController _passwordController = TextEditingController(text: "123");



  void _login(BuildContext context,String id) async {
    // Simulate a successful login
    await _saveLoggedIn(id);

  }


  Future<void> _saveLoggedIn(String id) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);
    await prefs.setString("id", id);

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
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child:
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(36, 107, 253, 0.12),
                        border: Border.all(
                          color: const Color.fromRGBO(36, 107, 253, 1),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        // keyboardType: TextInputType.number,
                        controller: _emailController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Email',
                        ),
                      ),
                    ),),

              // if (_apiErrorMessage=="Required Fields are not given" || _apiErrorMessage=='Doctor not found' )
              if (_responseError.isNotEmpty && _responseError!='Invalid password')
                Padding(
                  padding: const EdgeInsets.only(left: 22.0,top: 2),
                  child: Text(
                    _responseError,
                    style: TextStyle(color: Colors.red),
                  ),
                ),


              const SizedBox(height: 10,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child:
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(36, 107, 253, 0.12),
                    border: Border.all(
                      color: const Color.fromRGBO(36, 107, 253, 1),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    // keyboardType: TextInputType.number,
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Password',
                    ),
                  ),
                ),),
              if (_responseError.isNotEmpty )
                Padding(
                  padding: const EdgeInsets.only(left: 22.0,top: 2),
                  child: Text(
                    _responseError,
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                    const SizedBox(height: 13),
                    GestureDetector(
                      onTap: navigateToLoginScreen,
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
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
              const Spacer(),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 12, 0),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: RichText(
                          text: const TextSpan(
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
                    const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: Container(
                  width: 200,
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
                  child: ElevatedButton(
                    onPressed: () async {
                      final String email = _emailController.text;
                      final String password = _passwordController.text;

                      try {
                        var ahsan = await Login_Api.login(email, password);

                        if (ahsan.error != null) {
                          setState(() {
                            _responseError = ahsan.error.toString().trim();
                          });
                          print("error is: $_responseError");
                        } else if (ahsan.id != null && ahsan.message == 'Login successful') {
                          _responseError = '';
                          _startLoading(context);
                          print("message is:"+ ahsan.message!);
                        }

                        if (ahsan.id != null) {
                          _login(context, ahsan.id.toString());
                          print(ahsan.id);
                        }

                      }
                      catch (error) {
                        print("Error occurred: $error");
                      }
                    },


                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      elevation: 0,
                      padding: EdgeInsets.zero, // Remove the default padding to make the gradient cover the whole button
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'SignIn',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 12, 0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                           'Do not have an account? ',
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
                              builder: (context) => const SignUp(),
                            ),
                          );
                        },
                        child: const Text(
                          'SignUp',
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
              const SizedBox(height: 30,)





            ],
          ),
        ),
      ),
    );
  }
}


