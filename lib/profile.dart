import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 60),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      height: 50,
                      width: 50,
                      child: SvgPicture.asset('images/heart.svg')
                  ),
                  SizedBox(width: 8,),
                  const Text(
                    "Calneh E-Healthcare",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Color(0xff246BFD)),
                  ),



                ],
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Row(
                children: [
                  Container(
                    width: 40, // Set your desired width here
                    height: 40, // Set your desired height here
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('images/m1.svg'),
                        fit: BoxFit
                            .cover, // Replace 'your_image.png' with the actual asset path
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Write Something...',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: SvgPicture.asset(
                    'images/movie.svg',
                    // Replace this with the path to your SVG file
                    width: 25,
                    height: 25,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                  child: SvgPicture.asset(
                    'images/gallery.svg',
                    // Replace this with the path to your SVG file
                    width: 25,
                    height: 25,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 30, 0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        onPressed: () {
                          // Add your onPressed logic here
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white, // White background color
                          onPrimary: Color.fromRGBO(36, 107, 253, 1), // Text color
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color:
                                  Color.fromRGBO(36, 107, 253, 1), // Border color
                              width: 1.0, // Border width
                            ),
                            borderRadius:
                                BorderRadius.circular(8.0), // Button border radius
                          ),
                          fixedSize: Size(80, 30), // Width and height of the button
                        ),
                        child: Text('Post'),
                      ),
                    ),
                  ),
                )
              ],
            ),
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
                        image: AssetImage('images/doc3.svg'),
                        fit: BoxFit.cover,
                        // Replace 'name' with the actual asset path
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 28, 44, 0),
                      child: Text(
                        'Dr Travis West Aby',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 130, 0),
                      child: Text(
                        '17 jul',
                        style: TextStyle(
                            fontSize: 15,
                            color: Color.fromRGBO(119, 120, 122, 1)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: ExpandableText(
                        "ROC Private Clinic is an independent clinic\n with offices in the heart of Harley Street's medical district in London and...",
                        style: TextStyle(fontSize: 17),
                        expandText: 'See more',
                        collapseText: 'See less',
                        maxLines: 2, // Number of lines to show before collapsing
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 370,
              width: double.infinity,
              child: Image.asset(
                'images/clinic.png',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              thickness: 1,
              color: Colors.grey,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: [
                  IconButton(onPressed: (){}, icon: Icon(Icons.thumb_up,color: Colors.grey,)),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Like',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),

                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        '98 Likes',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Divider(
              thickness: 1,
              color: Colors.grey[400],
            ),
          ],
        ),
      ),
    );
  }
}
