import 'package:flutter/material.dart';

import '../Create Profile/CreateProfile.dart';

class WelcomeScreen extends StatefulWidget {
  String email;
  String password;
   WelcomeScreen({Key? key,required this.email ,required this.password}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 80,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Welcome To Calneh E-Healthcare',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                  "Let's get you started with Calneh E-Healthcare profile.This will give you ready access to manage your online appearance. "),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20
              ),
              child: Stack(
                children: [
                  Container(
                    height: 50,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 32),
                          child: Icon(
                            Icons.circle,
                            size: 4,
                          ),
                        ),
                        Expanded( // Wrap the Row with Expanded
                          child: Padding(
                            padding: EdgeInsets.only(left: 10, right: 5),
                            child: Text(
                              'Calneh E-Healthcare profile makes you visible to the hundreds of patients searching on Calneh E-Healthcare.com',

                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 20
              ),
              child: Stack(
                children: [
                  Container(
                    height: 35,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 14),
                          child: Icon(
                            Icons.circle,
                            size: 4,
                          ),
                        ),
                        Expanded( // Wrap the Row with Expanded
                          child: Padding(
                            padding: EdgeInsets.only(left: 10, right: 5),
                            child: Text(
                              'Online consultations are convenient and a great way to maximise your earnings',

                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 20
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.circle,
                    size: 4,
                  ),
                  Expanded( // Wrap the Row with Expanded
                    child: Padding(
                      padding: EdgeInsets.only(left: 10, right: 5),
                      child: Text(
                        'You can view and reply to patients feedback here',

                      ),
                    ),
                  ),
                ],
              ),
            ),
            // SizedBox(height: 240,),
            Spacer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: 50,
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    print(widget.email);
                    print(widget.password);


                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CreateProfile(email: widget.email,password: widget.password,)));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(36, 107, 253, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Create Profile',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30,)
          ],
        ),
      ),
    );
  }
}
