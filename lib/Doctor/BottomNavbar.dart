
import 'package:ehealthcare/Doctor/Home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Notifications.dart';
import '../profile.dart';
import 'Appointments/Appointments.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BottomNavigationBarScreen(),
    );
  }
}

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({Key? key}) : super(key: key);

  @override
  _BottomNavigationBarScreenState createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    Appointments(),
    NotificationsScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        height: 65,
        width: 375,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(36, 107, 253, 1),
              Color.fromRGBO(38, 43, 198, 1)
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BottomNavItem(
              svgIcon: 'images/icon1.svg',
              text: 'Profile',
              isSelected: _selectedIndex == 0,
              onTap: () => _onItemTapped(0),
            ),
            BottomNavItem(
              svgIcon: 'images/icon2.svg',
              text: 'Appointments',
              isSelected: _selectedIndex == 1,
              onTap: () => _onItemTapped(1),
            ),
            BottomNavItem(
              svgIcon: 'images/icon3.svg',
              text: 'Notifications',
              isSelected: _selectedIndex == 2,
              onTap: () => _onItemTapped(2),
            ),
            BottomNavItem(
              svgIcon: 'images/icon4.svg',
              text: 'Feed',
              isSelected: _selectedIndex == 3,
              onTap: () => _onItemTapped(3),
            ),
          ],
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

class BottomNavItem extends StatelessWidget {
  final String svgIcon;
  final String text;
  final bool isSelected;
  final Function() onTap;

  const BottomNavItem({
    Key? key,
    required this.svgIcon,
    required this.text,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            svgIcon,
            color: isSelected ? Colors.white : Colors.grey[400],
            height: 24,
            width: 24,
          ),
          SizedBox(height: 6),
          Text(
            text,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.grey,
              fontSize: 12,fontWeight: FontWeight.bold
            ),
          ),
        ],
      ),
    );
  }
}

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Screen 1'),
    );
  }
}

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Screen 2'),
    );
  }
}

class Screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Screen 3'),
    );
  }
}

class Screen4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Screen 4'),
    );
  }
}
