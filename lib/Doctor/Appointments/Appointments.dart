
import 'dart:async';

import 'package:ehealthcare/Doctor/Appointments/Completed.dart';
import 'package:ehealthcare/Doctor/Appointments/Requests.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'Cancelled.dart';


class Appointments extends StatefulWidget {
  const Appointments({Key? key}) : super(key: key);

  @override
  State<Appointments> createState() => _AppointmentsState();
}

class _AppointmentsState extends State<Appointments>
    with SingleTickerProviderStateMixin {
  late TabController _tabController = TabController(length: 3, vsync: this);

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _currentIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _navigateToTab(int index) {
    setState(() {
      _currentIndex = index;
      _tabController.animateTo(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
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

                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: const Text(
                      "Appointments",
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),

              ],
            ),
          ),
          const SizedBox(height: 20),
          DefaultTabController(
            length: 3,
            child: Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: SizedBox(
                      height: 65,
                      child: Stack(
                        children: [
                          Align(alignment: Alignment.center,
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Color(0xffEEEEEE),
                              ),// Grey container color
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: TabBar(
                              indicatorSize: TabBarIndicatorSize.label,
                              isScrollable: true,
                              // padding: EdgeInsets.zero,
                              // indicatorPadding: EdgeInsets.zero,
                              labelPadding: EdgeInsets.zero,
                              indicatorWeight: 4,
                              indicator: BoxDecoration(),
                              controller: _tabController,
                              onTap: (index) {
                                _navigateToTab(index);
                              },

                              tabs: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 2.0,vertical: 5),
                                  child: Tab(
                                    child: Container(
                                      height: 40,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          color: _currentIndex == 0 ? Colors.blue : Colors.transparent,
                                          shape: BoxShape.rectangle,
                                          borderRadius: BorderRadius.all(Radius.circular(8))

                                      ),
                                      child: TextButton(
                                        onPressed: () {
                                          _navigateToTab(0);
                                        },
                                        child: Text(
                                          'Requests',
                                          style: TextStyle(
                                            color: _currentIndex == 0 ? Colors.white : Colors.black,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 2.0,vertical: 5),
                                  child: Tab(
                                    child: Container(
                                      height: 40,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          color: _currentIndex == 1 ? Color(0xff31B802) : Colors.transparent,
                                          borderRadius: BorderRadius.all(Radius.circular(8))

                                      ),
                                      child: TextButton(
                                        onPressed: () {
                                          _navigateToTab(1);
                                        },
                                        child: Text(
                                          'Completed',
                                          style: TextStyle(
                                            color: _currentIndex == 1 ? Colors.white : Colors.black,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 2.0,vertical: 5),
                                  child: Tab(
                                    child: Container(
                                      height: 40,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        color: _currentIndex == 2 ? Color(0xffFF0000) : Colors.transparent,
                                        borderRadius: BorderRadius.all(Radius.circular(8)
                                        ),
                                      ),
                                      child: TextButton(
                                        onPressed: () {
                                          _navigateToTab(2);
                                        },
                                        child: Text(
                                          'Cancelled',
                                          style: TextStyle(
                                            color: _currentIndex == 2 ? Colors.white : Colors.black,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      // physics: NeverScrollableScrollPhysics(),
                      controller: _tabController,
                      children: [
                        Requests(),
                        Completed(),
                        Cancelled(),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
