import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Create Profile/Seesion_Timings.dart';
import 'Notification.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final List<String> texts = [
    'Invite Friends',
    'Edit Profile',
    'Edit Timing',
    'Notifications',
    'Rate us on Playstore',
    'Support',
    'FAQs',
    'Logout'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
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
                      Navigator.pop(context);
                    },
                    iconSize: 24,
                  ),
                ),
                const Text(
                  "Settings",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 50,
                  width: 30,
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: texts.length,
                itemBuilder: (context, index) {
                  var customColor = texts[index] == 'Logout' ? Colors.red : Colors.black;

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: SizedBox(
                      height: 40,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.white),
                        ),
                        onPressed: () {
                          if (texts[index] == 'Notifications') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => MyNotification()),
                            );
                          }
                          if (texts[index] == 'Edit Timing') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Session_Timings()),
                            );
                          }
                          // if (texts[index] == 'Edit Profile') {
                          //   Navigator.push(
                          //     context,
                          //     MaterialPageRoute(builder: (context) => CreateProfile()),
                          //   );
                          // }
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(height: 8.0,),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(texts[index], style: TextStyle(fontWeight: FontWeight.bold, color: customColor)),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Icon(CupertinoIcons.right_chevron, color: customColor, size: 20),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
