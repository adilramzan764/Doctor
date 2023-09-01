import 'package:ehealthcare/BottomNavigationBar/BottomNavbar.dart';
import 'package:ehealthcare/Doctor/OnboardScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToNextPage();
  }

  Future<void> navigateToNextPage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final bool loggedIn = prefs.getBool('isLoggedIn') ?? false;
    Future.delayed(Duration(seconds:3), () {
      if(loggedIn==false) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) =>
              OnBoardScreen()), // Replace 'NextPage' with your actual next page widget
        );
      }
      else{
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) =>
            BottomNavigationBarScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: SvgPicture.asset(
          'images/logo.svg',
          width: double.infinity, // Specify width
          height: double.infinity, // Specify height
        ),
      ),

    );
  }
}
