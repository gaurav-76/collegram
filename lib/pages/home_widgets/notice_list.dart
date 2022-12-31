import 'package:flutter/material.dart';

class NoticeList extends StatelessWidget {
  const NoticeList({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'Horizontal List';

    return SafeArea(
      child: ListView.builder(
          itemCount: 15,
          itemBuilder: (BuildContext context, int index) {
            // ignore: prefer_const_constructors
            // return Container(
            //   //color: Colors.white,
            //   child: Column(
            //     children: [
            //       Text(
            //         "Notice $index+1",
            //         style: TextStyle(color: Colors.white),
            //       ),
            //       ListTile(
            //         textColor: Colors.white,
            //         leading: Text("View"),
            //         trailing: Text(
            //           "Download",
            //           //   style: TextStyle(color: Colors.white, fontSize: 15),
            //         ),
            //         // title: Text("List item $index"));
            //       )
            //     ],
            //   ),
            // );
            return ListTile(
              textColor: Colors.white,
              leading: const Icon(
                Icons.list,
                color: Colors.white,
              ),
              // leading: Text("Notice $index"),
              trailing: Text("View | Download"),
              title: Text("Notice $index"),
            );
          }),
    );
  }
}
