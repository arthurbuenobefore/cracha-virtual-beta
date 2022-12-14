import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class Generate extends StatefulWidget {
  final String url;

  const Generate({super.key, required this.url});

  @override
  _GenerateState createState() => _GenerateState();
}

class _GenerateState extends State<Generate> {
  @override
  void initState() {
    super.initState();
  }

  GlobalKey globalKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    ScreenshotController screenshotController = ScreenshotController();

    Future getPdf() async {
      final uint8List = await screenshotController.capture();
      String tempPath = (await getTemporaryDirectory()).path;
      String fileName = "meuCrachaVirtual";
      if (await Permission.storage.request().isGranted) {
        File file = await File('$tempPath/$fileName.png').create();
        file.writeAsBytesSync(uint8List!);
        await Share.shareFiles([file.path]);
      }
    }

    return Scaffold(
      body: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            Screenshot(
              controller: screenshotController,
              child: Container(
                  width: 300,
                  height: 500,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: Colors.grey[300],
                    elevation: 10,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                          child: Padding(
                              padding: EdgeInsets.all(50),
                              child: RepaintBoundary(
                                key: globalKey,
                                child: QrImage(
                                  data: widget.url,
                                ),
                              )),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 0,
                              bottom: 0,
                              right: 0,
                              top: 60), //apply padding to all four sides
                          child: ElevatedButton(
                              onPressed: getPdf,
                              child: Text('EXPORTAR QRCODE'),
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Color.fromRGBO(22, 101, 149,
                                              1)), // background (button) color
                                  //foregroundColor: Colors.white,
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18.0),
                                          side: BorderSide(
                                              color:
                                                  Color.fromRGBO(22, 101, 149, 1)))))),
                        ),
                      ],
                    ),
                  )),
            ),
          ])),
    );
  }
}
