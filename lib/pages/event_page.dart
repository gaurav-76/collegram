import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:project/pages/home_widgets/event_box.dart';

import '../utils/routes.dart';

class EventPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return //SafeArea(
        //child: Scaffold(
        Scaffold(
      body: Container(
        child: Column(
          children: [
            // SizedBox(
            //   height: 20.0,
            // ),
            Padding(
              padding: const EdgeInsets.fromLTRB(50.0, 58.0, 50.0, 5.0),
              child: Center(
                child: Text(
                  "Today's Schedule",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  textScaleFactor: 1.8,
                ),
              ),
            ),

            // Container(
            //   //padding: EdgeInsets.fromLTRB(50 , 80 , 90 , 70),
            //   width: MediaQuery.of(context).size.width,
            //   // width: 100.0,
            //   height: 70.0,
            //   decoration: BoxDecoration(
            //       color: Colors.black,
            //       borderRadius: BorderRadius.circular(5.0)),
            // )
            // Padding(
            //   padding: const EdgeInsets.all(23.0),
            //   child: Container(
            //     padding: const EdgeInsets.all(60),
            //     //width: 200,
            //     height: 70.0,
            //     decoration: BoxDecoration(
            //         color: Colors.black,
            //         borderRadius: BorderRadius.circular(5.0)),
            //    children: []

            //   ),
            // ),
            EventBox(
              r: 84,
              g: 180,
              b: 53,
            ),
            EventBox(r: 84, g: 180, b: 53),

            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 40.0, 8.0, 8.0),
              child: Text(
                "Upcoming Events",
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Container(
                      child: Column(
                    children: <Widget>[
                      EventBox(r: 26, g: 77, b: 46),
                      EventBox(r: 26, g: 77, b: 46),
                      EventBox(r: 26, g: 77, b: 46),
                      EventBox(r: 26, g: 77, b: 46),
                      EventBox(r: 26, g: 77, b: 46),
                      EventBox(r: 26, g: 77, b: 46),
                    ],
                  ))),
            )
          ],
        ),
      ),

      // bottomNavigationBar: Container(
      //   margin: EdgeInsets.only(left: 16, right: 16, bottom: 10),
      //   decoration: BoxDecoration(
      //     color: Colors.black,
      //     borderRadius: BorderRadius.circular(15),
      //   ),
      //   child: BottomNavigationBar(
      //     backgroundColor: Color.fromARGB(0, 255, 255, 255),
      //     showUnselectedLabels: true,
      //     type: BottomNavigationBarType.fixed,
      //     elevation: 0,
      //     selectedItemColor: Color.fromRGBO(255, 153, 0, 1),
      //     unselectedItemColor: Colors.white,

      //     //onTap: onTabTapped, // new
      //     // currentIndex: _currentIndex, // new

      //     items: [
      //       new BottomNavigationBarItem(
      //         icon: InkWell(
      //           onTap: (() => Navigator.pushNamed(context, MyRoutes.homeRoute)),
      //           child: ImageIcon(
      //             AssetImage('assets/images/home_2.png'),
      //             size: 50,
      //           ),
      //         ),

      //         //title: Text('Image'),
      //         label: 'Home',
      //       ),
      //       new BottomNavigationBarItem(
      //         icon: InkWell(
      //           onTap: (() =>
      //               Navigator.pushNamed(context, MyRoutes.noticeRoute)),
      //           child: ImageIcon(
      //             AssetImage('assets/images/noticeb.png'),
      //             size: 50,
      //           ),
      //         ),
      //         //title: Text('Image'),
      //         label: 'Notices',
      //       ),
      //       new BottomNavigationBarItem(
      //         // icon: Icon(
      //         //   Icons.event,
      //         //   size: 32.0,
      //         // ),
      //         // label: 'Events',
      //         icon: InkWell(
      //           onTap: (() =>
      //               Navigator.pushNamed(context, MyRoutes.eventRoute)),
      //           child: ImageIcon(
      //             AssetImage('assets/images/Event.png'),
      //             size: 50,
      //           ),
      //         ),
      //         //title: Text('Image'),
      //         label: 'Events',
      //       ),
      //       new BottomNavigationBarItem(
      //         icon: InkWell(
      //           onTap: (() =>
      //               Navigator.pushNamed(context, MyRoutes.profileRoute)),
      //           child: ImageIcon(
      //             AssetImage('assets/images/profile.png'),
      //             size: 50,
      //           ),
      //         ),
      //         //title: Text('Image'),
      //         label: 'Profile',
      //       )
      //     ],
      //   ),
     // ),
      //),
    );
  }
}
