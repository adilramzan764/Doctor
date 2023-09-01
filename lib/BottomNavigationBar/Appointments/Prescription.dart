
import 'package:ehealthcare/BottomNavigationBar/BottomNavbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'Appointments.dart';

class Completed_Details extends StatefulWidget {
  const Completed_Details({Key? key}) : super(key: key);

  @override
  State<Completed_Details> createState() => _Completed_DetailsState();
}

class _Completed_DetailsState extends State<Completed_Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
          SizedBox(height: 60,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 50,
                width: 30,
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.pop(
                        context
                    );
                  },
                  iconSize: 24,
                ),
              ),
              const Text(
                "Prescription",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 50,
                width: 30,

              ),

            ],
          ),
        ),
        SizedBox(height: 5,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Container(
            height: 130,
            width: 130,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(image: AssetImage("images/m3.svg"),fit: BoxFit.cover)
            ),
          ),
        ),
        
        Padding(
          padding: const EdgeInsets.only(left: 30.0,right: 30,top: 10),
          child: Text("Suggest your patient medicines that best fit them.",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black),textAlign: TextAlign.center,),
        ),
        SizedBox(height: 10,),
        Divider(thickness: 1,),
        Padding(padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Align(
              alignment: Alignment.centerLeft,
              child: Text("Medicine / Prescription", style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),)),),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Container(
            height: 140.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xffF3F3F3),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF545454).withOpacity(0.3),
                  // spreadRadius: 2,
                  blurRadius: 3,
                  // offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Text('NEUROBION FORTE TABLET 30\'S, SHELCAL 500MG TABLET 15\'S FOR HEALTH, SUPRADYN DAILY TABLET 15\'S FOR HEALTH',style: TextStyle(fontSize: 16,color: Color(0xff303030)),),
            )
          ),
        ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 15),
              child: Stack(
                children: [
                  // First, create the main Container with the image
                  Container(
                    height: 70,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 3.5,
                        )
                      ],
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                'images/m_r2.svg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Second, add a translucent background over the main Container
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.add,color: Color(0xffFFFFFF),size: 20,)),
                            SizedBox(width: 3,),
                            Text('Add Prescription',style: TextStyle(fontSize: 14,color: Color(0xffFFFFFF)),)
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15,),
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 45,
                        // width: MediaQuery.of(context).size.width * 0.6,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                            color: Color(0xff246BFD),
                            // Set the border color here
                            width: 2.0,
                          ),
                        ),
                        child: TextButton(
                          onPressed: () {
                            // Add your button action here
                          },
                          //
                          child: Text(
                            'Cancel',
                            style: TextStyle(
                                color: Color(0xff246BFD), fontSize: 13),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 45,
                        // width: MediaQuery.of(context).size.width * 0.6,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xff246BFD), Color(0xff262BC6)],
                            end: Alignment.topLeft,
                            begin: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: TextButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Dialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  backgroundColor: Colors.white,
                                  child: LayoutBuilder(
                                    builder: (BuildContext context, BoxConstraints constraints) {
                                      return Container(
                                        width: constraints.maxWidth * 0.8,
                                        // Adjust the width as needed
                                        height: constraints.maxHeight * 0.5,
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(
                                                  top: 10,
                                                ),
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Container(
                                                    height:
                                                    MediaQuery.of(context).size.height * 0.2,
                                                    width:
                                                    MediaQuery.of(context).size.width * 0.4,
                                                    child: SvgPicture.asset(
                                                      'images/s_e.svg',
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.symmetric(vertical: 15),
                                                child: Text(
                                                  "Congratulations!",
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    color: Color(0xff246BFD),
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                "Your Prescription has been  ",
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Color(0xff77787A),
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              Text(
                                                "successfully submitted, thank you",
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Color(0xff77787A),
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              Text(
                                                "very much!",
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Color(0xff77787A),
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                );
                              },
                            ).then((value) {
                              // This block is executed after the dialog is dismissed
                              // Navigate to the home screen
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>BottomNavigationBarScreen(),
                                ),
                              );
                            });
                          },
                          //
                          child: Text(
                            'Submit',
                            style: TextStyle(color: Colors.white, fontSize: 13),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15,)
    ],
    ),
    ),
    );
  }
}
