import 'dart:io';

import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../ApiServices/AddDoctorPost_Api.dart';
import '../ApiServices/GetDoctorPost_Api.dart';
import '../Models/DoctorPost_Model.dart';
import '../Models/GetDoctorPost_Model.dart';
import '../utils/ImageandFilePicker.dart';
import '../utils/loader.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? _pickedImage;

   TextEditingController _controller=TextEditingController();
  ImageandFilePicker picker = ImageandFilePicker();

  Future<void> _pickImage() async {
    File? pickedImage = await picker.getImageFromGallery();
    setState(() {
      _pickedImage = pickedImage;
    });
  }
  final GetDoctorPost_Api _apiService = GetDoctorPost_Api();

  static Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  static Future<String> getProfileImage() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString("profileImage") ?? "";
  }

  static Future<String> getTitle() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString("title").toString() ?? "";
  }

  static Future<String> getName() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString("name").toString() ?? "";
  }

   String? profileImage;
   String? title;
   String? name;



  @override
  void initState() {
    super.initState();
    loadSharedPreferences();
  }



  Future<void> loadSharedPreferences() async {
    profileImage = await getProfileImage();
    print(profileImage);
    title = await getTitle();
    name = await getName();
    setState(() {}); // Trigger a rebuild with the retrieved values
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.stretch, // Stretch the content horizontally

        children: [
          const SizedBox(height: 60),
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
                const SizedBox(width: 8,),
                const Text(
                  "Calneh E-Healthcare",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Color(0xff246BFD)),
                ),



              ],
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Row(
              children: [
                Container(
                  width: 40, // Set your desired width here
                  height: 40, // Set your desired height here
                  decoration:  BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(profileImage??" "),
                      fit: BoxFit
                          .cover, // Replace 'your_image.png' with the actual asset path
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
                    child: TextField(
                      controller: _controller,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Write Something...',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10,),

          if (_pickedImage != null)
            Image.file(
              _pickedImage!,
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),
          const SizedBox(height: 5),
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
                child: InkWell(
                  onTap: () async {
                    _pickImage();
                  },
                  child: SvgPicture.asset(
                    'images/gallery.svg',
                    // Replace this with the path to your SVG file
                    width: 25,
                    height: 25,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 30, 0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: () async {
                        DateTime now = DateTime.now();
                        String formattedDate = DateFormat('d-M-yyyy').format(now);
                        try {
                          await EasyLoading.show(
                            status: "Posting...",
                            maskType: EasyLoadingMaskType.black,
                          );
                          DoctorPostsAdd_Model response = await AddDoctorPost_Api.addpost(
                            _controller.text,
                            formattedDate,
                            _pickedImage!.path,
                          );
                          print('Post Added: ${response.message}');
                        } catch (error) {
                          print('Error: $error');
                        }
                        await EasyLoading.dismiss();

                          _controller.clear();
                          formattedDate = "";
                          _pickedImage?.delete();
                          setState(() {
                            _pickedImage = null;




                        });


                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white, // White background color
                        onPrimary: const Color.fromRGBO(36, 107, 253, 1), // Text color
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            color:
                                Color.fromRGBO(36, 107, 253, 1), // Border color
                            width: 1.0, // Border width
                          ),
                          borderRadius:
                              BorderRadius.circular(8.0), // Button border radius
                        ),
                        fixedSize: const Size(80, 30), // Width and height of the button
                      ),
                      child: const Text('Post'),
                    ),
                  ),
                ),
              )
            ],
          ),
          FutureBuilder<DoctorPostsResponse>(
            future: _apiService.fetchDoctorPosts(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                final posts = snapshot.data!.posts;

                return Expanded(
                  child: ListView.builder(
                    itemCount: posts.length,
                    itemBuilder: (context, index) {
                      final post = posts[index];
                      bool isImageLoaded = false;

                      return Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(15, 30, 0, 0),
                                child: Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: NetworkImage(profileImage ??""),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(10, 28, 44, 0),
                                    child: Text(
                                      ' ${title ?? "N/A"} ${name ?? "N/A"}', // Use post data
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(10, 10, 130, 0),
                                    child: Text(
                                      post.date, // Use post data
                                      style: const TextStyle(
                                        fontSize: 15,
                                        color: Color.fromRGBO(119, 120, 122, 1),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: ExpandableText(
                                      post.desc, // Use post data
                                      style: const TextStyle(fontSize: 17),
                                      expandText: 'See more',
                                      collapseText: 'See less',
                                      maxLines: 2,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 370,
                            width: double.infinity,
                            child: Image.network(
                              post.image, // Use post data
                              fit: BoxFit.cover,

                            ),
                          ),                          const SizedBox(
                            height: 10,
                          ),
                          const Divider(
                            thickness: 1,
                            color: Colors.grey,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.thumb_up, color: Colors.grey),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  'Like',
                                  style: TextStyle(fontSize: 18, color: Colors.grey),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      '${post.likes.length} Likes', // Use post data
                                      style: const TextStyle(fontSize: 18),
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
                      );
                    },
                  ),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
