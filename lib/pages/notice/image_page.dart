import 'package:flutter/material.dart';
import 'package:project/pages/notice/Upload%20files%20Modal/firebase_storage.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import 'download_api/firebase_api_download.dart';

class ImagePage extends StatelessWidget {
  final FirebaseFile file;

  const ImagePage({
    Key key,
    this.file,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isImage = ['.jpeg', '.jpg', '.png'].any(file.name.contains);
    final ispdf = ['.pdf'].any(file.name.contains);

    return Scaffold(
      appBar: AppBar(
        title: Text(file.name),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.file_download),
            onPressed: () async {
              await FirebaseApi.downloadFile(file.ref);

              final snackBar = SnackBar(
                content: Text('Downloaded ${file.name}'),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
          ),
          const SizedBox(width: 12),
        ],
      ),
      body: ispdf
          ? Container(
              child: SfPdfViewer.network(file.url,
                  pageLayoutMode: PdfPageLayoutMode.single,
                  enableDoubleTapZooming: true,
                  scrollDirection: PdfScrollDirection.horizontal))
          : Center(
              child: Text(
                'File Cannot be opened',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
    );
  }
}
