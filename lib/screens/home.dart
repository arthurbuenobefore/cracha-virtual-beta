import 'package:flutter/material.dart';
import 'package:cracha_virtual_beta/model/user.dart';
import 'package:cracha_virtual_beta/services/api_service.dart';

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
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              color: Colors.grey[300],
                              elevation: 10,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.network(
                                      snapshot.data!.avatar_url,
                                      height: 150.0,
                                      width: 100.0,
                                    ),
                                  ),
                                  // Image(
                                  //   image:
                                  //       NetworkImage(snapshot.data!.avatar_url),
                                  //   width: 200,
                                  //   height: 200,
                                  //   alignment: Alignment.topCenter,
                                  // ),
                                  Text('ID: $idExib'),
                                  Text('Nome: $nameExib'),
                                  Text('Login: $emailExib'),
                                  ElevatedButton(
                                      onPressed: () {},
                                      child: Text('GERAR QRCode'),
                                      style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty
                                              .all<Color>(Colors
                                                  .blueAccent), // background (button) color
                                          //foregroundColor: Colors.white,
                                          padding: MaterialStateProperty.all<
                                              EdgeInsets>(EdgeInsets.all(20)),
                                          shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(18.0),
                                                  side: BorderSide(color: Colors.blueAccent)))))
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
                }
                // body: Center(
                // child: FutureBuilder<User>(
                //   future: futureUser,
                //   builder: (context, snapshot) {
                //     if (snapshot.hasData) {
                //       return Container(
                //             child: Center(
                //           child: Card(
                //             child: Image.network(snapshot.data!.avatar_url),
                //             elevation: 8,
                //             shadowColor: Colors.blueGrey,
                //             margin: EdgeInsets.all(20),
                //             shape: OutlineInputBorder(
                //                 borderRadius: BorderRadius.circular(10),
                //                 borderSide: BorderSide(color: Colors.white)),
                //           ),
                //         ));
                // } else if (snapshot.hasError) {
                //   return Container(
                //       child: Center(
                //     child: Card(
                //       child: ListTile(
                //         title: Text('${snapshot.error}'),
                //       ),
                //       elevation: 8,
                //       shadowColor: Colors.blueGrey,
                //       margin: EdgeInsets.all(20),
                //       shape: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(10),
                //           borderSide: BorderSide(color: Colors.white)),
                //     ),
                //   ));
                //       }
                //       return const CircularProgressIndicator();
                //     },
                //   ),
                // ));
                )));
  }
}
