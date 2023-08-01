import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyNotification extends StatefulWidget {
  const MyNotification({Key? key}) : super(key: key);

  @override
  State<MyNotification> createState() => _NotificationState();
}

class _NotificationState extends State<MyNotification> {

  bool isSwitched1=false;
  bool isSwitched2=false;
  bool isSwitched3=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Align(
                      alignment: Alignment.centerLeft,
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
                  ),
                  const Text(
                    "Notifications",
                    style:
                    TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 50,
                    width: 30,
                  )
                ],
              )),

          Padding(
            padding: const EdgeInsets.only(left: 20.0,right: 20,top: 15,bottom: 5),
            child: Row(
              children: [
                Align(alignment: Alignment.centerLeft,
                child: Text('All Notifications',style: TextStyle(fontSize: 16,color: Colors.black),),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Switch(
                        value: isSwitched1,
                        activeColor: Color(0xff262BC6),
                        inactiveTrackColor: Colors.grey,
                        onChanged: (value) {
                          setState(() {
                            isSwitched1 = !isSwitched1;
                          });
                        }),
                  ),
                )
              ],
            ),
          ),
          Divider(thickness: 3,),
          Padding(
            padding: const EdgeInsets.only(left: 20.0,right: 20,top: 5,),
            child: Row(
              children: [
                Align(alignment: Alignment.centerLeft,
                  child: Text('Appointments',style: TextStyle(fontSize: 16,color: Colors.black),),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Switch(
                        value: isSwitched2,
                        activeColor: Color(0xff262BC6),
                        inactiveTrackColor: Colors.grey,
                        onChanged: (value) {
                          setState(() {
                            isSwitched2 = !isSwitched2;
                          });
                        }),
                  ),
                )
              ],
            ),
          ),
          Divider(thickness: 0.5,),

          Padding(
            padding: const EdgeInsets.only(left: 20.0,right: 20,bottom: 5),
            child: Row(
              children: [
                Align(alignment: Alignment.centerLeft,
                  child: Text('New Appointments',style: TextStyle(fontSize: 16,color: Colors.black),),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Switch(
                        value: isSwitched3,
                        activeColor: Color(0xff262BC6),
                        inactiveTrackColor: Colors.grey,
                        onChanged: (value) {
                          setState(() {
                            isSwitched3 = !isSwitched3;
                          });
                        }),
                  ),
                )
              ],
            ),
          ),

        ],
      ),
    );
  }
}
