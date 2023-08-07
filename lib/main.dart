
import 'package:ehealthcare/Doctor/Create%20Profile/ClinicInfo_timing.dart';
import 'package:ehealthcare/Doctor/Create%20Profile/Seesion_Timings.dart';
import 'package:ehealthcare/Doctor/SplashScreen.dart';
import 'package:ehealthcare/profile.dart';
import 'package:ehealthcare/sds.dart';

import 'package:flutter/material.dart';

import 'Image_Picker.dart';
import 'Notifications.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: viewjk()
    );
  }


}
