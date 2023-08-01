import 'package:ehealthcare/Doctor/Create%20Profile/ClinicInfo_timing.dart';
import 'package:ehealthcare/Doctor/Create%20Profile/Seesion_Timings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Clinic_Info extends StatefulWidget {
  const Clinic_Info({Key? key}) : super(key: key);

  @override
  State<Clinic_Info> createState() => _Clinic_InfoState();
}

class _Clinic_InfoState extends State<Clinic_Info> {
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
                    "Clinic Info",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 50,
                    width: 30,

                  ),

                ],
              ),
            ),
            
            SizedBox(height: 30,),
            customWidget("Clinic Name", "Dr. Hospital"),
            SizedBox(height: 10,),
            customWidget("Location", "Lahore, Model Town"),
            SizedBox(height: 10,),
            customWidget("Clinic Number", "58632473915"),
            SizedBox(height: 10,),
            customWidget("Clinic Fees", "\$ 1000"),
            SizedBox(height: 10,),
            customWidget("Online Appointment Timings", "Lahore, Model Town"),
            SizedBox(height: 10,),
            customWidget("In Clinic Timings", "Lahore, Model Town"),


            SizedBox(height: 25,),
            Divider(thickness: 5,),
            SizedBox(height: 20,),

            Padding(padding: EdgeInsets.symmetric(horizontal: 20),
            child: Align(alignment: Alignment.centerLeft,
            child: Text(
              "Clinic Ownership Proofs",
              style: TextStyle(
                fontSize: 18,
                color: Color(0xff303030),
                fontWeight: FontWeight.bold
              ),
            ),),),

            SizedBox(height: 15,),

            Padding(padding: EdgeInsets.symmetric(horizontal: 20),
              child: Align(alignment: Alignment.centerLeft,
                child: Text(
                  "Upload image or PDF of owner proofs",
                  style: TextStyle(
                      fontSize: 13,
                      color: Color(0xff77787A),

                  ),
                ),),),

            SizedBox(height: 15,),

            Padding(padding: EdgeInsets.symmetric(horizontal: 20),
              child: Align(alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: (){},
                  icon: SvgPicture.asset('images/addimage.svg'),iconSize: 100,
                ),),),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 40),
              child: Align(
                alignment: Alignment.bottomCenter,
                child:


                Container(
                  height: 45,
                  width: double.infinity,
                  // width: MediaQuery.of(context).size.width * 0.6,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xff246BFD),Color(0xff262BC6)],
                      end: Alignment.topLeft,
                      begin: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ClinicInfo_timing()),
                      );
                    },
                    //
                    child: Text(
                      'Create Profile',
                      style: TextStyle(
                          color: Colors.white,fontSize: 13
                      ),
                    ),
                  ),
                ),

              ),
            ),


          ],
        ),
      ),
    );
  }

  Widget customWidget(String label, String hintText) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 2), // Adjust the vertical padding here
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 13,
              color: Color(0xff77787A),
            ),
          ),
          SizedBox(height: 5), // Adjust the height between the Text and TextField
          Container(
            height: 30,
            child: TextField(
              decoration: InputDecoration(
                suffixIcon: label=="Location" || label=="Online Appointment Timings" || label=="In Clinic Timings" ? GestureDetector(
                    onTap: (){
                      if(label=="Online Appointment Timings" || label=="In Clinic Timings")
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Session_Timings()));
                    },
                    child: Icon(CupertinoIcons.right_chevron,size: 20,color: Color(0xff09121F),)) : SizedBox(),
                hintText: hintText,
                hintStyle: TextStyle(color: Color(0xff282828), fontSize: 15),
                // contentPadding: EdgeInsets.only(top: 15), // Adjust the vertical padding here
              ),
            ),
          ),

        ],
      ),
    );
  }
}
