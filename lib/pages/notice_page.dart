import 'package:flutter/material.dart';
import 'package:project/pages/home_widgets/notice_list.dart';
import 'package:velocity_x/velocity_x.dart';

import '../utils/routes.dart';

class NoticePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            // SizedBox(
            //   height: 40.0,
            // ),
            Padding(
              padding: const EdgeInsets.fromLTRB(50.0, 70.0, 50.0, 0.0),
              child: Center(
                child: Text(
                  "NOTICES",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  textScaleFactor: 1.8,

                  //textAlign: TextAlign.center,
                ),
              ),
            ),
            Container(
              // backgroundColor: Colors.black;
              //color: Colors.black,
              height: MediaQuery.of(context).size.height * 0.665,
              width: double.infinity,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromRGBO(41, 49, 48, 1),
              ),
              child: Row(children: <Widget>[Expanded(child: NoticeList())]),
            ).pOnly(left: 30.0, right: 30.0, top: 14.0),
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
      //           onTap: (() => Navigator.pushNamed(
      //                 context,
      //                 MyRoutes.homeRoute,
      //                 //CircularProgressIndicator().centered().expand(),
      //               )),
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
    );
  }
}
