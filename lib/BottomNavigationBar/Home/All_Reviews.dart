import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class All_Reviews extends StatefulWidget {
  const All_Reviews({Key? key}) : super(key: key);

  @override
  State<All_Reviews> createState() => _All_ReviewsState();
}

class _All_ReviewsState extends State<All_Reviews> {

  final List<String> revpics = [
    'images/m1.svg',
    'images/m2.svg',
    'images/m3.svg',
    'images/m4.svg',
    'images/m5.svg',

  ];
  final List<String> revnames = [
    'Christopher Campbell',
    'Leilani Angel',
    'Jack Nackos',
    'Ian Dooley',
    'Aileen Fullbright',

  ];
  final List<String> reviews = [
    'Dr. Travis is very professional in his work and responsive. I have consulted and my problem is solved.',
    'Doctors who are very skilled and fast in service. My illness is cured, thank you very much!',
    'Doctors who are very skilled and fast in service. I highly recommend Dr. Travis for all who want to consult.',
    'The Doctor is very handsome and the service is excellent! I like it and want to consult again.',
    'Dr. Travis is very professional in his work and responsive. I have consulted and my problem is solved.',

  ];
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
                    padding: const EdgeInsets.only(left: 20),
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
                    "My Reviews",
                    style:
                    TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 50,
                    width: 30,
                  )
                ],
              )),

          Flexible(child: ListView.builder(
            itemCount: revnames.length,
            // physics: const NeverScrollableScrollPhysics(),// Replace with the actual number of items in the list
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage(revpics[index]), // Replace with the actual image path
                          ),
                          const SizedBox(width: 10),
                          Text(
                            revnames[index],
                            style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                          ),

                          Expanded(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: ElevatedButton.icon(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      side: const BorderSide(color: Colors.blue)

                                  ),
                                  primary: Colors.white,

                                ),
                                icon: const Icon(Icons.star, color: Colors.blue,size: 15,),
                                label: const Text('5', style: TextStyle(color: Colors.blue)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Align(alignment: Alignment.centerLeft,
                          child: Text(reviews[index],style: const TextStyle(fontSize: 14,color: Color(0xff77787A)),),),),
                    ],
                  ),
                ),
              );
            },
          ))


        ],
      ),
    );
  }
}
