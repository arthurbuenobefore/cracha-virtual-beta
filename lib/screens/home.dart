import 'package:cracha_virtual_beta/screens/generate.dart';
import 'package:flutter/material.dart';
import 'package:cracha_virtual_beta/model/user.dart';
import 'package:cracha_virtual_beta/services/api_service.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class Home extends StatefulWidget {
  final String username;

  const Home({super.key, required this.username});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<User> futureUser;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    futureUser = ApiService().fetchUser(widget.username);
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

    final PageController pageController = PageController();
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
        body: PageView(
          controller: pageController,
          children: <Widget>[
            Screenshot(
                controller: screenshotController,
                child: Center(
                    child: FutureBuilder<User>(
                        future: futureUser,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            var nameExib = snapshot.data!.name;
                            var emailExib = snapshot.data!.login;
                            var idExib = snapshot.data!.id;
                            return Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 300,
                                    height: 500,
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      color: Colors.grey[300],
                                      elevation: 10,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 0,
                                                bottom: 0,
                                                right: 0,
                                                top:
                                                    40), //apply padding to all four sides
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.network(
                                                snapshot.data!.avatar_url,
                                                height: 200.0,
                                                width: 200.0,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 70.0, top: 20),
                                            child: Table(
                                              columnWidths: const {
                                                0: FlexColumnWidth(0.6),
                                                1: FlexColumnWidth(1.5),
                                              },
                                              children: [
                                                TableRow(children: [
                                                  Text(
                                                    'ID: ',
                                                    style: TextStyle(
                                                        fontSize: 15.0,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    idExib.toString(),
                                                    style: TextStyle(
                                                        fontSize: 15.0),
                                                  ),
                                                ]),
                                                TableRow(children: [
                                                  Text(
                                                    "Nome: ",
                                                    style: TextStyle(
                                                        fontSize: 15.0,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    nameExib,
                                                    style: TextStyle(
                                                        fontSize: 15.0),
                                                  ),
                                                ]),
                                                TableRow(children: [
                                                  Text(
                                                    "Login: ",
                                                    style: TextStyle(
                                                        fontSize: 15.0,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    emailExib,
                                                    style: TextStyle(
                                                        fontSize: 15.0),
                                                  ),
                                                ]),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 0,
                                                bottom: 20,
                                                right: 0,
                                                top:
                                                    20), //apply padding to all four sides
                                            child: ElevatedButton(
                                                onPressed: getPdf,
                                                child: const Text(
                                                    'EXPORTAR CRACHÁ'),
                                                style: ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStateProperty.all<Color>(
                                                            const Color.fromRGBO(
                                                                22,
                                                                101,
                                                                149,
                                                                1)), // background (button) color
                                                    //foregroundColor: Colors.white,
                                                    shape: MaterialStateProperty.all<
                                                            RoundedRectangleBorder>(
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                    18.0),
                                                            side: BorderSide(color: Color.fromRGBO(22, 101, 149, 1)))))),
                                          ),
                                          const Text(
                                              'Arraste para o lado para ver seu QrCode'),
                                        ],
                                      ),
                                    ),
                                  ),
                                ]);
                          } else if (snapshot.hasError) {
                            return Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image(
                                    image: AssetImage('assets/not-found.png'),
                                    width: 100,
                                    height: 100,
                                    alignment: Alignment.center,
                                  ),
                                  const Text('Usuário não encontrado!')
                                ]);
                          }
                          return const CircularProgressIndicator();
                        }))),
            Generate(url: 'teste-rul')
          ],
        ));
  }
}

@override
Widget build(BuildContext context) {
  // TODO: implement build
  throw UnimplementedError();
}
