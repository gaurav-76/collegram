// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class Avatar extends StatelessWidget {
  final String name;
  final String collegeName;
  const Avatar({
    Key key,
     this.name,
     this.collegeName,
  }) : super(key: key);

  //const Avatar({super.key , });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Color.fromRGBO(217, 217, 217, 1),

        /// child: FittedBox(
        child: Image.asset('assets/images/cultural.png'),
        //fit: BoxFit.fill,
        //),
      ),
      title: Text(
        '$name',
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.bold,
          color: Colors.black,
          textStyle: TextStyle(color: Colors.black),
          fontSize: 16.0,
        ),
      ),
      subtitle: Text(
        '$collegeName',
        style: TextStyle(
            //fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 11.0),
      ),
      //trailing: Icon(Icons.more_vert),
    );

    // Row(
    //   //itemBuilder: (BuildContext context , int index),
    //   children: <Widget>[
    //     CircleAvatar(
    //       backgroundColor: Color.fromRGBO(217, 217, 217, 1),
    //       // backgroundImage: NetworkImage(
    //       //   'https://pixel.nymag.com/imgs/daily/vulture/2017/06/14/14-tom-cruise.w700.h700.jpg'),
    //       //radius: 40.0,
    //       //child:
    //       child: FittedBox(
    //         child: Image.asset('assets/images/cultural.png'),
    //         fit: BoxFit.fill,
    //       ),
    //     ).pOnly(left: 12.0),
    //     SizedBox(
    //       width: 10.0,
    //     ),
    //     Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: <Widget>[
    //         Text(
    //           '$name',
    //           style: GoogleFonts.poppins(
    //             fontWeight: FontWeight.bold,
    //             color: Colors.black,
    //             textStyle: TextStyle(color: Colors.black),
    //             fontSize: 13.0,
    //           ),
    //         ),
    //         // SizedBox(height: 3.0),
    //         Text(
    //           '$collegeName',
    //           style: TextStyle(
    //               //fontWeight: FontWeight.bold,
    //               color: Colors.black,
    //               fontSize: 10.0),
    //         ),
    //       ],
    //     ), //.pOnly(right: 77.0),
    //     // PopupMenuButton(
    //     //   itemBuilder: (context) {
    //     //     return [
    //     //       PopupMenuItem(
    //     //         value: 'posts',
    //     //         child: Text('View All Posts'),
    //     //       )
    //     //     ];
    //     //   },
    //     //   onSelected: (String value) {
    //     //     //print('You Click on po up menu item');
    //     //   },
    //     // ),
    //   ],
    // );
  }
}
