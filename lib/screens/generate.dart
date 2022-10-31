import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter/rendering.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

import 'package:flutter/services.dart';
import 'dart:async';
import 'dart:typed_data';
import 'dart:ui';
import 'dart:io';
import 'package:flutter/rendering.dart';
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
    final bodyHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).viewInsets.bottom;

    void _printScreen() {
      Printing.layoutPdf(onLayout: (PdfPageFormat format) async {
        final doc = pw.Document();

        final image = await WidgetWraper.fromKey(key: globalKey);

        doc.addPage(pw.Page(
            pageFormat: format,
            build: (pw.Context context) {
              return pw.Center(
                child: pw.Expanded(
                  child: pw.Image(image),
                ),
              );
            }));

        return doc.save();
      });
    }

    Future<void> _captureAndSharePng() async {
      try {
        RenderRepaintBoundary? boundary = globalKey.currentContext
            ?.findRenderObject() as RenderRepaintBoundary?;
        var image = await boundary!.toImage();
        ByteData? byteData =
            await image.toByteData(format: ImageByteFormat.png);
        Uint8List pngBytes = byteData!.buffer.asUint8List();
        final result = await ImageGallerySaver.saveImage(pngBytes);

        //final tempDir = await getTemporaryDirectory();
        //final file = await new File('${tempDir.path}/image.png').create();
        //await file.writeAsBytes(pngBytes);

        //final channel = const MethodChannel('channel:me.alfian.share/share');
        //channel.invokeMethod('shareFile', 'image.png');

        // final tempDir = await getTemporaryDirectory();
        // final file = await new File('${tempDir.path}/image.jpg').create();
        // file.writeAsBytesSync(pngBytes);

        // final channel = const MethodChannel('channel:me.albie.share/share');
        // channel.invokeMethod('shareFile', 'image.jpg');
      } catch (e) {
        print(e.toString());
      }
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.chevron_left),
          iconSize: 46,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.blueAccent),
      ),
      body: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            Container(
                width: 300,
                height: 500,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: Colors.grey[300],
                  elevation: 10,
                  child: Container(
                    width: 100,
                    height: 100,
                    child: Padding(
                        padding: EdgeInsets.all(50),
                        child: RepaintBoundary(
                          key: globalKey,
                          child: QrImage(
                            size: 100,
                            data: widget.url,
                          ),
                        )),
                  ),
                )),
          ])),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.print),
        onPressed: _captureAndSharePng,
      ),
    );
  }
}
