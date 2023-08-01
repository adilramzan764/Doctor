import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Session_Timings extends StatefulWidget {
  const Session_Timings({Key? key}) : super(key: key);

  @override
  State<Session_Timings> createState() => _Session_TimingsState();
}

class _Session_TimingsState extends State<Session_Timings> {
  bool isSwitched3 = false;

  // Map<String, TimeOfDay?> sessionTimings = {};
  // TimeOfDay? sessionTimings;
  //
  // void _selectTime(String day) async {
  //   final TimeOfDay? picked = await showTimePicker(
  //     context: context,
  //     initialTime: TimeOfDay.now(),
  //   );
  //
  //   if (picked != null) {
  //     setState(() {
  //       sessionTimings = picked;
  //     });
  //   }
  // }

  final List<String> days = [
    "Mon",
    "Tues",
    "Wed",
    "Thurs",
    "Fri",
    "Sat",
    "Sun",
  ];
  List<List<String>> appointments = List.generate(7, (_) => []);

  Future<void> _selectStartTime(int index) async {
    TimeOfDay? startTime = await showTimePicker(
      context: context,
      helpText: "Enter Start Time",
      initialTime: TimeOfDay.now(),
    );

    if (startTime != null) {
      TimeOfDay? endTime = await showTimePicker(
        context: context,
        initialTime:

            TimeOfDay(hour: startTime.hour + 1, minute: startTime.minute),
        helpText: "Enter End Time",

      );

      if (endTime != null) {
        setState(() {
          appointments[index]
              .add('${startTime.format(context)} - ${endTime.format(context)}');
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // appointments[0].toString();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
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
                  "Session Timings",
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
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20),
            child: Row(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Same timing for weekdays',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
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

          Expanded(
            // height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 30.0,top: 10),
              child: ListView.builder(
                // physics: NeverScrollableScrollPhysics(),
                itemCount: days.length,
                itemBuilder: (context, index) {
                  final day = days[index];
                  final dayAppointments = appointments[index];

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 0.0),
                    child: Container(
                      child: Table(
                        columnWidths: {
                          0: FlexColumnWidth(1),
                          // Both columns will have the same width
                          1: FlexColumnWidth(3),
                          // Both columns will have the same width
                        },
                        border: TableBorder.all(color: Colors.black),
                        children: [
                          TableRow(
                            children: [
                              TableCell(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  child: Center(
                                      child: Text(
                                    day,
                                    style: TextStyle(fontSize: 14),
                                  )),
                                ),
                              ),
                              TableCell(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        for (String appointment
                                            in dayAppointments)
                                          Padding(
                                            padding: const EdgeInsets.only(top: 5.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            appointment,
                                                            style: TextStyle(
                                                                fontSize: 17,fontWeight: FontWeight.w500), // Set decoration to none
                                                          ),
                                                          Text("Video Appointments",style: TextStyle(fontSize: 14,color: Color(0xff77787A)),),
                                                        ],
                                                      ),
                                                      Expanded(
                                                        child: Align(
                                                          alignment: Alignment
                                                              .centerRight,
                                                          child: GestureDetector(
                                                            onTap: (){setState(() {
                                                              dayAppointments.remove(appointment);
                                                            });},
                                                            child: Icon(
                                                              Icons.cancel,
                                                              size: 16,
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(height: 5,),
                                                Container(
                                                  height: 2,

                                                  color: Colors.black,
                                                ),
                                              ],
                                            ),
                                          ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: TextButton(
                                          onPressed: () {
                                            _selectStartTime(index);
                                          },
                                          child: Text(
                                            'Add Session Time',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Color(0xff246BFD),
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

         // Spacer(),
          Padding(
            padding: const EdgeInsets.only(left: 20.0,right:20,bottom:20  ),
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
                    Navigator.pop(
                      context
                    );
                  },
                  //
                  child: Text(
                    'Save',
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
    );
  }
}
