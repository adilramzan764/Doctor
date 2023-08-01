import 'package:ehealthcare/Doctor/Appointments/Consult_Ended.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Requests extends StatefulWidget {
  const Requests({Key? key}) : super(key: key);

  @override
  State<Requests> createState() => _RequestsState();
}

class _RequestsState extends State<Requests> {

  final List<String> patientnames = [
    'Ian Dooley',
    'Aileen Fullbright',
  ];
  final List<String> designations = [
    'Video Consult',
    'In-Clinic Consult',
  ];
  final List<String> pics = [
    'images/m1.svg',
    'images/m2.svg',
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
                return GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VideoConsult2(), // Replace MyNewScreen with your desired screen widget
                      ),
                    );
                  },
                  child: Padding(
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
                      height: 200,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                // Expanded(
                                //   flex: 1,
                                //   child: SizedBox(
                                //     height: 100.0,
                                //     child: ClipRRect(
                                //       borderRadius: BorderRadius.circular(10.0),
                                //       child: Image.asset(
                                //         'assets/doc.jpeg',
                                //         fit: BoxFit.cover,
                                //       ),
                                //     ),
                                //   ),
                                // ),
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
                                  child: designations[index] == 'Video Consult'
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
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(designations[index],style: TextStyle(fontSize: 13,color: Colors.black87),)),
                                      SizedBox(width: 15,),

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
                            SizedBox(height: 5,),
                            Divider(color: Colors.grey.withOpacity(0.3),thickness: 1,),
                            SizedBox(height: 5,),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    height: 35,
                                    // width: MediaQuery.of(context).size.width * 0.6,
                                    decoration: BoxDecoration(
                                      color: Color(0xffFF0000
                                      ),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: TextButton(
                                      onPressed: () {
                                        // Add your button action here
                                      },
                                      //
                                      child: Text(
                                        'Reject',
                                        style: TextStyle(
                                            color: Colors.white,fontSize: 13
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8,),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    height: 35,
                                    // width: MediaQuery.of(context).size.width * 0.6,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [Color(0xff246BFD),Color(0xff262BC6)],
                                        end: Alignment.topLeft,
                                        begin: Alignment.bottomRight,
                                      ),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: TextButton(
                                      onPressed: () {
                                        // Add your button action here
                                      },
                                      //
                                      child: Text(
                                        'Accept',
                                        style: TextStyle(
                                            color: Colors.white,fontSize: 13
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )

                          ],
                        ),
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
