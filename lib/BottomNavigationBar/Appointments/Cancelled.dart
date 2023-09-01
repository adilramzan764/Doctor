import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cancelled extends StatefulWidget {
  const Cancelled({Key? key}) : super(key: key);

  @override
  State<Cancelled> createState() => _CancelledState();
}

class _CancelledState extends State<Cancelled> {

  final List<String> patientnames = [
    'Beckett Calger',
    'Bernard Blis',
  ];
  final List<String> consults = [
    'Video Appointment',
    'In-Clinic Appointment',
  ];
  final List<String> pics = [
    'images/m1.svg',
    'images/m4.svg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Flexible(
            child: ListView.builder(
              itemCount: patientnames.length,
              // Replace yourData with the actual data list length
              itemBuilder: (BuildContext context, int index) {
                // Create a Card for each item in the list
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,

                          blurRadius: 3.5,
                        )
                      ],
                    ),
                    height: 140,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Row(
                            children: [

                              Container(
                                height: 100,
                                width: 90,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  image: DecorationImage(
                                    image: AssetImage(pics[index]),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: consults[index] == 'Video Appointment'
                                    ? Align(
                                  alignment: Alignment.topRight,
                                  child: Icon(
                                    CupertinoIcons.videocam_fill,
                                    color: Colors.green,
                                  ),
                                )
                                    : SizedBox(),
                              ),

                              const SizedBox(width: 10),
                              Expanded(
                                flex: 3,
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: GestureDetector(
                                        onTap: (){
                                          // Navigator.push(
                                          //     context,
                                          //     MaterialPageRoute(builder: (context) => My_Profile(),
                                          //     ));
                                        },
                                        child: Text(
                                          patientnames[index],
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                    ),

                                    SizedBox(height: 20,),
                                    Row(

                                      children: [
                                        Text(consults[index],style: TextStyle(fontSize: 12,color: Colors.black87),),
                                        SizedBox(width: 5,),
                                        Container(
                                          height: 29,
                                          width: 70,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color:  Color(0xffFF0000) ,
                                              width: 1,
                                            ),
                                            borderRadius: BorderRadius.circular(8.0),
                                          ),
                                          child: TextButton(
                                            onPressed: () {

                                            },
                                            child: Text(
                                              'Cancelled',
                                              style: TextStyle(
                                                color:  Color(0xffFF0000),
                                                fontSize: 9,
                                              ),
                                            ),
                                          ),
                                        ),


                                      ],
                                    ),
                                    SizedBox(height: 20,),

                                    Row(
                                      children: [

                                        Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text("Sep 17, 2022",style: TextStyle(fontSize: 12,color: Color(0xff3D3D3D),fontWeight: FontWeight.w500),)),
                                        SizedBox(width: 20,),
                                        Text("11:00 AM",style: TextStyle(fontSize: 12,color: Color(0xff3D3D3D),fontWeight: FontWeight.w500),),
                                      ],
                                    ),


                                  ],
                                ),
                              ),
                            ],
                          ),


                        ],
                      ),
                    ),
                  ),
                );

              },
            ),
          )
        ],
      ),
    );
  }
}
