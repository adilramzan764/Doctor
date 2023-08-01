import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EarningScreen extends StatefulWidget {
  const EarningScreen({Key? key}) : super(key: key);

  @override
  _EarningScreenState createState() => _EarningScreenState();
}

class _EarningScreenState extends State<EarningScreen> {
  bool isVisible = true; // State variable for visibility

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView( // Wrap Column with SingleChildScrollView
        child: Column(
          children: [
            SizedBox(height: 70,),
            // Header
            buildHeader(),

            SizedBox(height: 10,),

            // Total Earnings
            buildTotalEarnings(),
            // Earning Details
            ListView.builder(
              shrinkWrap: true, // Add this to prevent list from taking all the height
              itemCount: 4,
              itemBuilder: (context, index) {
                return buildEarningDetails(
                  iconPath: 'images/m3.svg',
                  name: 'Solana',
                  earningAmount: '\$136.56',
                  appointmentType: 'Video Appointment',
                  appointmentDate: '18-8-2-22',
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10 ,),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(
              Icons.arrow_back,
              size: 30,
            ), // Back arrow icon
            onPressed: () {
              Navigator.pop(context); // This will navigate back to the previous screen
            },
          ),
          Text(
            'My Earnings',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 45,height: 45,),
        ],
      ),
    );
  }

  Widget buildTotalEarnings() {
    return Column(
      children: [
        Align(
          alignment: Alignment.center,
          child: Text(
            'Total Earnings',
            style: TextStyle(fontSize: 20),
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "\$2260,65.90",
              style: TextStyle(fontSize: 30),
            ),
            IconButton(
              icon: Icon(
                isVisible ? Icons.visibility : Icons.visibility_off,
                size: 20,
              ),
              onPressed: () {
                setState(() {
                  isVisible = !isVisible; // Toggle visibility
                });
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget buildEarningDetails({
    required String iconPath,
    required String name,
    required String earningAmount,
    required String appointmentType,
    required String appointmentDate,
  }) {
    return Column(
      children: [

        Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 30, 0, 0),
              child: Container(
                width: 60, // Set your desired width here
                height: 60, // Set your desired height here
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(iconPath),
                  ),
                ),
              ),

            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 35, 44, 0),
                  child: Text(
                    name,
                    style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 18, 35, 0),
                  child: Text(
                    earningAmount,
                    style: TextStyle(
                        fontSize: 15,
                        color: Color.fromRGBO(119, 120, 122, 1)),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 40, 44, 0),
                  child: Text(
                    appointmentType,
                    style: TextStyle(fontSize: 15 ,fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 15, 0, 0),
                  child: Text(
                    appointmentDate,
                    style: TextStyle(
                        fontSize: 15,
                        color: Color.fromRGBO(119, 120, 122, 1)),
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.fromLTRB(15,0,15,0),
          child: Divider(thickness: 3,color: Color.fromRGBO(229, 229, 229, 1),),
        ),
      ],
    );
  }
}
