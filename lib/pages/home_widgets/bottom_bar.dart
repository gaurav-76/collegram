import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project/pages/event_page.dart';
import 'package:project/pages/home_page.dart';
import 'package:project/pages/notice/notice_list.dart';
import 'package:project/pages/notice_page.dart';
import 'package:project/pages/profile/profile_page.dart';
import 'package:project/pages/profile_page.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:project/pages/event/meeting.dart';
import '../../utils/routes.dart';
import 'different_page.dart';

class BottomBar extends StatefulWidget {
  @override
  BottomBarState createState() => BottomBarState();
}

class BottomBarState extends State<BottomBar> {
  int _currentIndex = 0;
  // BottomBarState(int idx)
  // {
  //   _currentIndex = idx;
  // }
  // final List _children = [
  //   PlaceholderWidget(Colors.white),
  //   PlaceholderWidget(Colors.deepOrange),
  //   PlaceholderWidget(Colors.green),
  //   PlaceholderWidget(Colors.yellow)
  // ];
  final List _children = [
    HomePage(),
    NoticeList(),
    CustomTableCalendar(),
    ProfilePage2(),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        // appBar: AppBar(
        //   title: Text('Beer App'),
        // ),
        body: _children[_currentIndex],
        // bottomNavigationBar: BottomNavigationBar(
        //onTap: onTabTapped, // new
        // currentIndex: _currentIndex, // new

        bottomNavigationBar: Container(
          margin: EdgeInsets.only(left: 16, right: 16, bottom: 10),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(15),
          ),
          child: BottomNavigationBar(
            // new

            backgroundColor: Color.fromARGB(0, 255, 255, 255),
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            //selectedItemColor: Color.fromRGBO(255, 153, 0, 1),
            //selectedItemColor: Color.fromRGBO(255, 255, 255, 1),

            //unselectedItemColor: Colors.white,

            //onTap: onTabTapped, // new
            // currentIndex: _currentIndex, // new
            unselectedItemColor: Colors.white,
            currentIndex: _currentIndex, // new
            fixedColor: Color.fromRGBO(255, 153, 0, 1),
            onTap: onTabTapped,
            items: [
              new BottomNavigationBarItem(
                icon: InkWell(
                  // onTap: (() => Navigator.pushNamed(context, MyRoutes.homeRoute)),
                  child: ImageIcon(
                    AssetImage('assets/images/home_2.png'),
                    size: 50,
                  ),
                ),

                //title: Text('Image'),
                label: 'Home',
              ),
              new BottomNavigationBarItem(
                icon: InkWell(
                  //  onTap: (() =>
                  //    Navigator.pushNamed(context, MyRoutes.noticeRoute)),
                  child: ImageIcon(
                    AssetImage('assets/images/noticeb.png'),
                    size: 50,
                  ),
                ),
                //title: Text('Image'),
                label: 'Notices',
              ),
              new BottomNavigationBarItem(
                // icon: Icon(
                //   Icons.event,
                //   size: 32.0,
                // ),
                // label: 'Events',
                icon: InkWell(
                  //  onTap: (() =>
                  //    Navigator.pushNamed(context, MyRoutes.eventRoute)),
                  child: ImageIcon(
                    AssetImage('assets/images/Event.png'),
                    size: 50,
                  ),
                ),
                //title: Text('Image'),
                label: 'Events',
              ),
              new BottomNavigationBarItem(
                icon: InkWell(
                  //  onTap: (() =>
                  //    Navigator.pushNamed(context, MyRoutes.profileRoute)),
                  child: ImageIcon(
                    AssetImage('assets/images/profile.png'),
                    size: 50,
                  ),
                ),
                //title: Text('Image'),
                label: 'Profile',
              )
            ],
          ),
          // ),
        ),
        //),
      );

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
