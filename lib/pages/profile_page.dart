import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/pages/home_widgets/bottom_bar.dart';
import 'package:project/pages/login/verify_email.dart';
import 'package:project/pages/setting_page.dart';
import 'package:velocity_x/velocity_x.dart';

import '../utils/routes.dart';
import 'login/login_page.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //title: Text("Test Screen"),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Setting()),
                );
              },
              icon: Icon(
                Icons.settings,
                size: 32.0,
              ).p2(),
            ),
          ],
        ),
        body: SingleChildScrollView(
            child: Container(
          child: Column(
            children: [
              Column(
                children: [
                  Container(
                    height: 320.0,
                    color: Color(0xFFD9D9D9),
                    child: Column(
                      children: [
                        Align(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Icon(Icons.camera_alt_rounded),
                          ),
                          alignment: Alignment.topRight,
                        ),
                        Stack(
                          alignment: Alignment.topCenter,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(top: 81),
                              child: Container(
                                height: 120,
                                width: double.infinity,
                                child: Card(
                                  child: Align(
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          16.0, 16.0, 16.0, 0.0),
                                      child: Icon(Icons.create_rounded),
                                    ),
                                    alignment: Alignment.topRight,
                                  ),
                                  elevation: 0.0,
                                  color: Color(0xFFFFFFFF),
                                  margin: EdgeInsets.only(
                                    top: 16,
                                    bottom: 0.0,
                                  ),
                                ),
                                //Text("Data")
                              ),
                            ),
                            Container(
                              decoration: ShapeDecoration(
                                shape: CircleBorder(),
                                color: Colors.transparent,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(0.0),
                                child: CircleAvatar(
                                  backgroundColor: Colors.black,
                                  radius: 95.0,
                                  child: CircleAvatar(
                                    backgroundColor: Color(0xFFD9D9D9),
                                    radius: 90.0,
                                    // child: Align(
                                    //   child: Icon(CupertinoIcons.camera),
                                    //   alignment: Alignment.bottomRight,
                                    // ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          color: Colors.white,
                          width: MediaQuery.of(context).size.width,
                          height: 75.0,
                          child: Column(
                            children: [
                              Text(
                                "Chinmay Takkar",
                                style: TextStyle(
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Designer | Developer",
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                  height: 600.0,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Column(
                    children: [Text("Hello")],
                  )),
              // Profile(),
            ],
          ),
        )
//       bottomNavigationBar: Container(
//         margin: EdgeInsets.only(left: 16, right: 16, bottom: 10),
//         decoration: BoxDecoration(
//           color: Colors.black,
//           borderRadius: BorderRadius.circular(15),
//         ),
//         child: BottomNavigationBar(
//           backgroundColor: Color.fromARGB(0, 255, 255, 255),
//           showUnselectedLabels: true,
//           type: BottomNavigationBarType.fixed,
//           elevation: 0,
//           selectedItemColor: Color.fromRGBO(255, 153, 0, 1),
//           unselectedItemColor: Colors.white,

//           //onTap: onTabTapped, // new
//           // currentIndex: _currentIndex, // new

//           items: [
//             new BottomNavigationBarItem(
//               icon: InkWell(
//                 onTap: (() => Navigator.pushNamed(context, MyRoutes.homeRoute)),
//                 child: ImageIcon(
//                   AssetImage('assets/images/home_2.png'),
//                   //color: Colors.white,
//                   size: 50,
//                 ),
//               ),

//               //title: Text('Image'),
//               label: 'Home',
//             ),
//             new BottomNavigationBarItem(
//               icon: InkWell(
//                 onTap: (() =>
//                     Navigator.pushNamed(context, MyRoutes.noticeRoute)),
//                 child: ImageIcon(
//                   AssetImage('assets/images/noticeb.png'),
//                   // color: Colors.white,
//                   size: 50,
//                 ),
//               ),
//               //title: Text('Image'),
//               label: 'Notices',
//             ),
//             new BottomNavigationBarItem(
//               // icon: Icon(
//               //   Icons.event,
//               //   size: 32.0,
//               // ),
//               // label: 'Events',
//               icon: InkWell(
//                 onTap: (() =>
//                     Navigator.pushNamed(context, MyRoutes.eventRoute)),
//                 child: ImageIcon(
//                   AssetImage('assets/images/Event.png'),
//                   //color: Colors.white,
//                   size: 50,
//                 ),
//               ),
//               //title: Text('Image'),
//               label: 'Events',
//             ),
//             new BottomNavigationBarItem(
// //                child: Color.fromRGBO(255, 153, 0, 1),
//               //backgroundColor: Colors.white,
//               icon: InkWell(
//                 onTap: (() =>
//                     Navigator.pushNamed(context, MyRoutes.profileRoute)),
//                 child: ImageIcon(
//                   AssetImage('assets/images/profile.png'),
//                   size: 50,
//                 ),
//               ),
//               //title: Text('Image'),
//               label: 'Profile',
//             )
//           ],
//         ),
//       ),
            ));
  }
}
