import 'package:ehealthcare/Doctor/Login.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_svg/flutter_svg.dart';


class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({Key? key}) : super(key: key);

  @override
  _OnBoardScreenState createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(36, 107, 253, 1),
      body: Column(
        children: [
          SizedBox(
            height: 550,
            child: PageView(
              controller: _controller,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              children: [
                buildOnBoardScreen(
                    'images/walkthrough.svg', 'Grow your online Presence'),
                buildOnBoardScreen('images/walkthrough..svg',
                    'Manage your practice on the\nGo!'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 46),
            child: SmoothPageIndicator(
              controller: _controller,
              count: 2,
              effect: const ExpandingDotsEffect(
                activeDotColor: Colors.white,
                dotColor: Colors.grey,
                dotHeight: 10,
                dotWidth: 10,
                spacing: 16,
              ),
            ),
          ),
          SizedBox(height: 50),
          if (_currentPage == 0)
            buildOnBoardButton('Next', () {
              _controller.nextPage(
                duration: Duration(milliseconds: 500),
                curve: Curves.ease,
              );
            }),
          if (_currentPage == 1)
            buildOnBoardButton('Login', () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Login()));
            }),
        ],
      ),
    );
  }

  Widget buildOnBoardScreen(String imagePath, String description) {
    return Container(
      child: Stack(
        children: [
          Center(
            child: SvgPicture.asset(
              imagePath,
              width: 290,
              height: 210,
            ),
          ),
          SizedBox(height: 16),
          Align(
            alignment: Alignment(0, 0.6),
            child: Transform.translate(
              offset: Offset(0, _currentPage == 1 ? 100 : 108),
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
Widget buildOnBoardButton(String text, VoidCallback onPressed) {
  return Container(
    width: 300,
    height: 50,
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(color: Colors.black),
      ),
    ),
  );
}



