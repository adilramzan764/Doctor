
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/svg.dart';

import '../../ApiServices/AddClinic_Api.dart';
import '../../Models/General_Model.dart';
import '../../BottomNavigationBar/BottomNavbar.dart';
import '../Models/Appointments.dart';
import 'CreateProfileScreennTwo.dart';
import 'Seesion_Timings.dart';

class ClinicInfo_timing extends StatefulWidget {
  const ClinicInfo_timing({Key? key}) : super(key: key);

  @override
  State<ClinicInfo_timing> createState() => _ClinicInfo_timingState();
}

class _ClinicInfo_timingState extends State<ClinicInfo_timing> {

  TextEditingController _nameController = TextEditingController();
  TextEditingController _clinicnumberController = TextEditingController();
  TextEditingController _clinicfeesController = TextEditingController();
  TextEditingController _cityController = TextEditingController();


  List<List<String>> _selectedAppointments = List.generate(7, (_) => []);

  final List<String> days = [
    "monday",
    "tuesday",
    "wednesday",
    "thursday",
    "friday",
    "saturday",
    "sunday",
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
            const SizedBox(
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
                  const SizedBox(
                    height: 50,
                    width: 30,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            customWidget("Clinic Name", "Dr. Hospital",_nameController),
            const SizedBox(
              height: 10,
            ),
            customWidget("City", "Lahore",_cityController),
            const SizedBox(
                height: 10,),
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
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
                  style: const TextStyle(color: Color(0xff282828), fontSize: 15),

                  isExpanded: true,
                  // To make the dropdown take the full available width
                  value: selectedLocation,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedLocation = newValue;
                    });
                  },
                  icon: const Icon(
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
            const SizedBox(
              height: 10,
            ),
            customWidget("Clinic Number", "58632473915",_clinicnumberController),
            const SizedBox(
              height: 10,
            ),

            customWidget("Clinic Fees", "\$ 1000",_clinicfeesController),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  const Align(
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
                            onPressed: () {
                              toggleTimingVisibility();
                            },
                            icon: Icon(
                              isOnlineTimingVisible
                                  ? CupertinoIcons
                                      .chevron_down // Show the icon in the opposite direction when it's pressed
                                  : CupertinoIcons.right_chevron,
                            ),
                            color: const Color(0xff09121F),
                          ))),
                ],
              ),
            ),
            if (isOnlineTimingVisible) OnlineTiming(),
            const SizedBox(
              height: 5,
            ),
            const Divider(
              thickness: 5,
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  const Align(
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
                            onPressed: () {
                              toggleClinicTimingVisibility();
                            },
                            icon: Icon(
                              isOnlineTimingVisible
                                  ? CupertinoIcons
                                      .chevron_down // Show the icon in the opposite direction when it's pressed
                                  : CupertinoIcons.right_chevron,
                            ),
                            color: const Color(0xff09121F),
                          ))),
                ],
              ),
            ),
            if (isClinicTimingVisible) ClinicTiming(),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              thickness: 5,
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Clinic Ownership Proofs",
                  style: TextStyle(
                      fontSize: 18,
                      color: Color(0xff303030),
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Upload image or PDF of owner proofs",
                  style: TextStyle(
                    fontSize: 13,
                    color: Color(0xff77787A),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset('images/addimage.svg'),
                  iconSize: 100,
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 45,
                  width: double.infinity,
                  // width: MediaQuery.of(context).size.width * 0.6,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xff246BFD), Color(0xff262BC6)],
                      end: Alignment.topLeft,
                      begin: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: TextButton(

                    onPressed: () async {
                      try {
                        await EasyLoading.show(
                          status: 'Adding Clinic..',
                          maskType: EasyLoadingMaskType.black,
                        );
                        Map<String, Map<String, List<String>>> convertedAppointmentsMap = {
                          'online': {},
                          'inclinic': {},
                        };

                        for (int i = 0; i < days.length; i++) {
                          convertedAppointmentsMap['online']![days[i]] = _selectedAppointments[i];
                          convertedAppointmentsMap['inclinic']![days[i]] = []; // Initialize as empty list
                        }

                        Map<String, Map<String, List<String>>> appointmentsMap = {};
                        final Map<String, List<String>>? onlineAppointments = convertedAppointmentsMap['online'];
                        final Map<String, List<String>>? inclinicAppointments = convertedAppointmentsMap['inclinic'];

                        print("convertedAppointmentsMap" + convertedAppointmentsMap.toString());

                        AppointmentsData appointmentsList = AppointmentsData(
                          appointments: convertedAppointmentsMap,
                        );
                        print("convertedAppointmentsMap" + appointmentsList.appointments.toString());

                        //
                        General_Model result = await AddClinic_Api.addclinic(
                          _nameController.text,
                          _cityController.text,
                          selectedLocation!,
                          _clinicnumberController.text,
                          _clinicfeesController.text,
                          appointmentsList.appointments,
                        );

                        print('API response: ${result.message}');
                      } catch (e) {
                        print('Error calling API: $e');
                      }
                      await EasyLoading.dismiss();

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CreateProfileScreenTwo(clinicChecked: true,)),
                      );
                    },
                    //
                    child: const Text(
                      'Add Clinic',
                      style: TextStyle(color: Colors.white, fontSize: 13),
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

  Widget customWidget(String label, String hintText,TextEditingController _controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 2),
      // Adjust the vertical padding here
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 13,
              color: Color(0xff77787A),
            ),
          ),

          const SizedBox(height: 5),
          // Adjust the height between the Text and TextField
          Container(
            height: 30,
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                suffixIcon: label == "Location"
                    ? const Icon(
                        CupertinoIcons.right_chevron,
                        size: 20,
                        color: Color(0xff09121F),
                      )
                    : const SizedBox(),
                hintText: hintText,
                hintStyle: const TextStyle(color: Color(0xff282828), fontSize: 15),
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
        height: MediaQuery.of(context).size.height * 0.8,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ListView.builder(
              itemCount: days.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          List<List<String>> appointments =
                              await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Session_Timings(),
                            ),
                          );

                          if (appointments != null) {
                            setState(() {
                              _selectedAppointments =
                                  appointments; // Store the returned data
                            });
                            print(_selectedAppointments);
                          } else {
                            print("No appointments selected.");
                          }
                        },
                        child: Text(
                          days[index],
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      if (days[index] != "Sat" && days[index] != "Sun")
                        const Column(
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
                        const Text(
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
        height: MediaQuery.of(context).size.height * 0.8,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ListView.builder(
              itemCount: days.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Session_Timings()));
                        },
                        child: Text(
                          days[index],
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      if (days[index] != "Sat" && days[index] != "Sun")
                        const Column(
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
                        const Text(
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
