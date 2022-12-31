import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:project/pages/home_widgets/home_page_list.dart';
import 'package:project/pages/profile_page.dart';
import 'package:velocity_x/velocity_x.dart';

import '../utils/routes.dart';
import 'event_page.dart';
import 'home_widgets/bottom_bar.dart';
import 'home_widgets/different_page.dart';
import 'notice_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List _children = [
    HomePage(),
    NoticePage(),
    EventPage(),
    ProfilePage(),
  ];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 5));
  }

  Widget build(BuildContext context) {
    //SafeArea(
    //   child: DefaultTabController(
    // length: 2,
    // child: Scaffold(
    //size: 50.0,
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75.0,
        title: Text(
          "LOGO",
        ),
        centerTitle: true,
        leading: Icon(
          CupertinoIcons.bell_circle_fill,
          size: 45.0,
        ).p16(),
        actions: [
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content:
                      "Messaging not suppported yet".text.size(17.0).make()));
            },
            icon: Icon(
              Icons.chat,
              size: 40.0,
            ),
          ).p16(),
        ],
      ),

      body: Container(
        // padding: Vx.m24,
        // scrollDirection: Vx.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //   CatalogHeader(),
            // Container(
            //   //   padding: Vx.m32,
            //   //height: 80.0,
            //   width: MediaQuery.of(context).size.width,
            //   //color: MyTheme.creamColor,
            //   color: Colors.white,
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       "Hey, Let See What's Going in "
            //           .text
            //           .xl2
            //           .bold
            //           // .color(context.theme.accentColor)
            //           .color(Colors.black)
            //           .make(),
            //       "Your College"
            //           .text
            //           .xl2
            //           .bold
            //           .color(Colors.orange)
            //           .make(),
            //     ],
            //   ).px32().pOnly(bottom: 10.0),
            // ).pOnly(bottom: 20.0),

            Expanded(child: HomePageList()) //.pOnly(top: 20.0)
          ],
        ),
      ),
      // _children[_currentIndex],

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
      //     //selectedItemColor: Color.fromRGBO(255, 153, 0, 1),
      //     //selectedItemColor: Color.fromRGBO(255, 255, 255, 1),

      //     unselectedItemColor: Colors.white,

      //     items: <BottomNavigationBarItem>[
      //       new BottomNavigationBarItem(
      //         icon: InkWell(
      //           //  onTap: (() =>
      //           //    Navigator.pushNamed(context, MyRoutes.homeRoute)),
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
      //           // onTap: (() =>
      //           //   Navigator.pushNamed(context, MyRoutes.noticeRoute)),
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
      //           // onTap: (() =>
      //           //   Navigator.pushNamed(context, MyRoutes.eventRoute)),
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
      //           //onTap: (() =>
      //             //  Navigator.pushNamed(context, MyRoutes.profileRoute)),
      //           child: ImageIcon(
      //             AssetImage('assets/images/profile.png'),
      //             size: 50,
      //           ),
      //         ),
      //         //title: Text('Image'),
      //         label: 'Profile',
      //       )
      //     ],
      //     // new
      //     currentIndex: _currentIndex, // new
      //     fixedColor: Color.fromRGBO(255, 153, 0, 1),
      //     onTap: onTabTapped,
      //   ),
      // ),
      //   BottomBar();
      //  bottomNavigationBar: BottomBar(),
      //   ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
