
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'Prescription.dart';

class VideoConsult2 extends StatefulWidget {
  const VideoConsult2({Key? key}) : super(key: key);

  @override
  State<VideoConsult2> createState() => _VideoConsult2State();
}

class _VideoConsult2State extends State<VideoConsult2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
              padding: const EdgeInsets.only(top: 60,left: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  height: 50,
                  width: 30,
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),

                    iconSize: 24, onPressed: () { Navigator.pop(
                      context);},
                  ),
                ),
              )),
          SizedBox(height: MediaQuery.of(context).size.height *0.01,),
          Center(child: Container( height: 150,width: 200,child: SvgPicture.asset('images/s_e.svg',))),
          SizedBox(height: 30,),
          Center(child: Text("The consultation session has ended.",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,color: Color(0xff000000)),)),
          SizedBox(height: 15,),
          Center(
            child: Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('images/m4.svg'),
                  fit: BoxFit.cover,
                ),
                // color: Color(0xffD9E2F4),
              ),
              // child: CircleAvatar(
              //   // backgroundColor: Colors.transparent,
              //   child: SvgPicture.asset('assets/doc.svg',fit: BoxFit.cover,),
              // ),
            ),
          ),
          SizedBox(height: 15,),
          Center(child: Text("James Andrew",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 24),)),
          SizedBox(height: 20,),
          Text("Patient",style: TextStyle(fontWeight: FontWeight.w500,color: Color(0xff000000),fontSize: 14),),

          Expanded(
            child: Padding(
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
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Completed_Details()),
                          );
                    },
                        //
                        child: Text(
                          'Suggest Prescription',
                          style: TextStyle(
                              color: Colors.white,fontSize: 13
                          ),
                        ),
                      ),
                    ),

                ),
              ),
            ),

        ],
      ),
    );
  }
}
