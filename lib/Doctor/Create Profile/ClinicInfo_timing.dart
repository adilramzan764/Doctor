import 'package:ehealthcare/Doctor/Create%20Profile/CreateProfileScreennTwo.dart';
import 'package:ehealthcare/Doctor/Create%20Profile/Seesion_Timings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../BottomNavbar.dart';

class ClinicInfo_timing extends StatefulWidget {
  const ClinicInfo_timing({Key? key}) : super(key: key);

  @override
  State<ClinicInfo_timing> createState() => _ClinicInfo_timingState();
}

class _ClinicInfo_timingState extends State<ClinicInfo_timing> {
  final List<String> days = [
    "Mon",
    "Tue",
    "Wed",
    "Thurs",
    "Fri",
    "Sat",
    "Sun",
  ];
  String? selectedLocation;

  bool isOnlineTimingVisible = false;

  void toggleTimingVisibility() {
    setState(() {
      isOnlineTimingVisible = !isOnlineTimingVisible;
    });
  }

  bool isClinicTimingVisible = false;

  void toggleClinicTimingVisibility() {
    setState(() {
      isClinicTimingVisible = !isClinicTimingVisible;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 60,
            ),
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
                        Navigator.pop(context);
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
            SizedBox(
              height: 30,
            ),
            customWidget("Clinic Name", "Dr. Hospital"),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Location",
                  style: TextStyle(
                    fontSize: 13,
                    color: Color(0xff77787A),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Container(
                height: 40,
                child: DropdownButton<String>(
                  style: TextStyle(color: Color(0xff282828), fontSize: 15),

                  isExpanded:
                  true, // To make the dropdown take the full available width
                  value: selectedLocation,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedLocation = newValue;
                    });
                  },
                  icon: Icon(
                    CupertinoIcons.forward,
                    size: 18,
                  ),
                  items: <String>[
                    'Location A',
                    'Location B',
                    'Location C',
                    'Other'
                  ].map<DropdownMenuItem<String>>(
                        (String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    },
                  ).toList(),
                  underline: Container(
                    height: 1, // Set the height of the underline
                    color: Colors.black38, // Change the color here
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            customWidget("Clinic Number", "58632473915"),
            SizedBox(
              height: 10,
            ),
            customWidget("Clinic Fees", "\$ 1000"),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Online Appointment Timings",
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xff77787A),
                      ),
                    ),
                  ),
                  Expanded(
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                            iconSize: 20,
                            onPressed: (){
                              toggleTimingVisibility();
                            },
                            icon:Icon(
                              isOnlineTimingVisible
                                  ? CupertinoIcons.chevron_down // Show the icon in the opposite direction when it's pressed
                                  : CupertinoIcons.right_chevron,
                            ),

                            color: Color(0xff09121F),
                          ))),
                ],
              ),
            ),
            if(isOnlineTimingVisible)
            OnlineTiming(),
SizedBox(height: 5,),
            Divider(thickness: 5,),
            SizedBox(height: 5,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Clinic Timings",
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xff77787A),
                      ),
                    ),
                  ),
                  Expanded(
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                            iconSize: 20,
                            onPressed: (){
                              toggleClinicTimingVisibility();
                            },
                            icon:Icon(
                              isOnlineTimingVisible
                                  ? CupertinoIcons.chevron_down // Show the icon in the opposite direction when it's pressed
                                  : CupertinoIcons.right_chevron,
                            ),

                            color: Color(0xff09121F),
                          ))),
                ],
              ),
            ),
            if(isClinicTimingVisible)
            ClinicTiming(),

            SizedBox(height: 10,),
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
                        MaterialPageRoute(builder: (context) => CreateProfileScreenTwo()),
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
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 2),
      // Adjust the vertical padding here
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
                suffixIcon: label == "Location"
                    ? Icon(
                        CupertinoIcons.right_chevron,
                        size: 20,
                        color: Color(0xff09121F),
                      )
                    : SizedBox(),
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

  Widget OnlineTiming() {
    return SizedBox(
      height: MediaQuery.of(context).size.height*0.8,
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ListView.builder(
          itemCount: days.length,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Session_Timings()));
                    },
                    child: Text(
                      days[index],
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 4),
                  if (days[index] != "Sat" && days[index] != "Sun")
                    Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "1st Session",
                            style: TextStyle(
                              fontSize: 13,
                              color: Color(0xff77787A),
                            ),
                          ),
                        ),
                        SizedBox(height: 3),
                        Align(
                          alignment: Alignment.centerLeft,

                          child: Text(
                            "09:00 AM - 06:00 PM",
                            style: TextStyle(
                              fontSize: 13,
                              color: Color(0xff77787A),
                            ),
                          ),
                        ),
                        SizedBox(height: 3),
                        Align(
                          alignment: Alignment.centerLeft,

                          child: Text(
                            "Video Appointments",
                            style: TextStyle(
                              fontSize: 13,
                              color: Color(0xff77787A),
                            ),
                          ),
                        ),
                      ],
                    )
                  else
                    Text(
                      "Closed",
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xff77787A),
                      ),
                    ),


                ],
              ),
            );
          }),
    ));
  }

  Widget ClinicTiming() {
    return SizedBox(
        height: MediaQuery.of(context).size.height*0.8,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ListView.builder(
              itemCount: days.length,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Session_Timings()));
                        },
                        child: Text(
                          days[index],
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 4),
                      if (days[index] != "Sat" && days[index] != "Sun")
                        Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "1st Session",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Color(0xff77787A),
                                ),
                              ),
                            ),
                            SizedBox(height: 3),
                            Align(
                              alignment: Alignment.centerLeft,

                              child: Text(
                                "09:00 AM - 06:00 PM",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Color(0xff77787A),
                                ),
                              ),
                            ),
                            SizedBox(height: 3),
                            Align(
                              alignment: Alignment.centerLeft,

                              child: Text(
                                "Video Appointments",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Color(0xff77787A),
                                ),
                              ),
                            ),
                          ],
                        )
                      else
                        Text(
                          "Closed",
                          style: TextStyle(
                            fontSize: 13,
                            color: Color(0xff77787A),
                          ),
                        ),


                    ],
                  ),
                );
              }),
        ));
  }

}
