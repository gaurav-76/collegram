import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/pages/home_widgets/bottom_bar.dart';
import 'package:project/pages/login/change_password.dart';
//import 'package:project/pages/profile_page.dart';
import 'login/login_page.dart';
//import 'login/verify_email.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

class Setting extends StatefulWidget {
  Setting({Key key}) : super(key: key);

  @override
  SettingPage createState() => SettingPage();
}

class SettingPage extends State<Setting> {
  final uid = FirebaseAuth.instance.currentUser.uid;
  final email = FirebaseAuth.instance.currentUser.email;
  final creationTime = FirebaseAuth.instance.currentUser.metadata.creationTime;

  User user = FirebaseAuth.instance.currentUser;

  verifyEmail() async {
    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();
      print('Verification Email has benn sent');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          //backgroundColor: Colors.orangeAccent,
          content: Text(
            'Verification Email has benn sent',
            style: TextStyle(fontSize: 18.0, color: Colors.white),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      appBar: AppBar(
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            'Settings',
            style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
          )),

      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          children: [
            // Text(
            //   'User ID : $uid',
            //   style: TextStyle(fontSize: 18.0),
            // ),
            Row(
              children: [
                Text(
                  ' Email : $email',
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.023),
                ),
                user.emailVerified
                    ? Text(
                        ' verified',
                        style: TextStyle(
                            fontSize:
                                MediaQuery.of(context).size.height * 0.020,
                            color: Colors.blueGrey),
                      )
                    : TextButton(
                        onPressed: () => {verifyEmail()},
                        child: Text('Verify Email'))
              ],
            ),
            Align(
              alignment: Alignment.topLeft,
              child: TextButton(
                onPressed: () => {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChangePassword(),
                      ),
                      (route) => false)
                },
                child: Text('Change Password ',
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.023,
                        fontWeight: FontWeight.bold)),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: TextButton(
                onPressed: () async => {
                  await FirebaseAuth.instance.signOut(),
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Login1(),
                      ),
                      (route) => false)
                },
                child: Text('Logout ',
                    style: TextStyle(
                        fontSize: ResponsiveFlutter.of(context).fontSize(
                            3), //MediaQuery.of(context).size.height * 0.023,
                        fontWeight: FontWeight.bold)),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                ' Created: $creationTime',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.023),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// class Setting extends StatefulWidget {
//   Setting({Key? key}) : super(key: key);

//   @override
//   SettingPage createState() => SettingPage();
// }

// class SettingPage extends State<Setting> {
//   final uid = FirebaseAuth.instance.currentUser!.uid;
//   final email = FirebaseAuth.instance.currentUser!.email;
//   final creationTime = FirebaseAuth.instance.currentUser!.metadata.creationTime;

//   User? user = FirebaseAuth.instance.currentUser;

//   verifyEmail() async {
//     if (user != null && !user!.emailVerified) {
//       await user!.sendEmailVerification();
//       print('Verification Email has benn sent');
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           //backgroundColor: Colors.orangeAccent,
//           content: Text(
//             'Verification Email has benn sent',
//             style: TextStyle(fontSize: 17.0, color: Colors.white),
//           ),
//         ),
//       );
//     }
 
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           leading: new IconButton(
//             icon: new Icon(Icons.arrow_back, color: Colors.black),
//             onPressed: () => Navigator.pushAndRemoveUntil(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => BottomBar(),
//                 ),
//                 (route) => false),
//           ),
//           title: Text(
//             'Settings',
//             style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
//           )),
//       backgroundColor: Color(0xFFd9d9d9),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: ListView(
//           children: ListTile.divideTiles(
//             context: context,
//             tiles: [
//               ListTile(
//                 title: Text(
//                   'User ID : ',
//                   style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400),
//                 ),
//               ),
//               ListTile(
//                 title: Text('Verify Email : ',
//                     style:
//                         TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400)),
//               ),
//               ListTile(
//                 title: Text('Logout ',
//                     style:
//                         TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
//                 onTap: () async => {
//                   await FirebaseAuth.instance.signOut(),
//                   Navigator.pushAndRemoveUntil(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => Login(),
//                       ),
//                       (route) => false)
//                 },
//               ),
//             ],
//           ).toList(),
//         ),
//       ),
//     );
//   }}}
