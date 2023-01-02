//import 'dart:html';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project/pages/notice/Upload%20files%20Modal/firebase_storage.dart';
import 'package:project/pages/notice/image_page.dart';
import 'package:project/pages/notice/upload_notice.dart';
import 'download_api/firebase_api_download.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  // runApp(MyApp());
}

class NoticeList extends StatefulWidget {
  static final String title = 'Notices';


  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<NoticeList> {
  Future<List<FirebaseFile>> futureFiles;
  @override
  void initState() {
    super.initState();

    futureFiles = FirebaseApi.listAll('files/');
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(NoticeList.title),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => UploadNotice()),
            );
          },
          label: const Text(' + New Notice'),
        ),
        body: FutureBuilder<List<FirebaseFile>>(
          future: futureFiles,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              default:
                if (snapshot.hasError) {
                  return Center(child: Text('Some error occurred!'));
                } else {
                  final files = snapshot.data;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildHeader(files.length),
                      const SizedBox(height: 12),
                      Expanded(
                        child: ListView.builder(
                          itemCount: files.length,
                          itemBuilder: (context, index) {
                            final file = files[index];

                            return buildFile(context, file);
                          },
                        ),
                      ),
                    ],
                  );
                }
            }
          },
        ),
      );

  Widget buildFile(BuildContext context, FirebaseFile file) => Padding(
    padding: const EdgeInsets.all(4.0),
    child: Material(
      elevation: 2.0,
      child: ListTile(
          shape: RoundedRectangleBorder( //<-- SEE HERE
        //side: BorderSide(width: 2),
        borderRadius: BorderRadius.circular(20),
      ),
          // leading: ClipOval(
          //   child: Image.network(
          //     file.url,
          //     width: 52,
          //     height: 52,
          //     fit: BoxFit.cover,
          //   ),
          // ),
          title: Text(
            file.name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
             // decoration: TextDecoration.underline,
              color: Colors.black,
            ),
          ),
          
          trailing:Column(children: <Widget>[
        Container(
        child: IconButton(
        icon: Icon(
        Icons.arrow_forward,
        ),
        color: Colors.red,
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ImagePage(file: file),
            )),
    ))])) ,
          // onTap: () => Navigator.of(context).push(MaterialPageRoute(
          //       builder: (context) => ImagePage(file: file),
          //     ))),
    ),
  );

  Widget buildHeader(int length) => ListTile(
        tileColor: Colors.white,
        leading: Container(
          width: 52,
          height: 52,
          child: Icon(
            Icons.file_copy,
            color: Colors.black,
          ),
        ),
        title: Text(
          '$length Files',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        trailing: Column(children: <Widget>[
        Container(
        child: IconButton(
        icon: Icon(
        Icons.refresh_outlined,
        ),
        color: Colors.black,
        onPressed: () {Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NoticeList()),
            );},
        ),
        ),
        ]));
}
