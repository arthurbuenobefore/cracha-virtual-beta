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
          title: new Text(widget.username),
        ),
        body: Center(
            child: FutureBuilder<User>(
                future: futureUser,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: NetworkImage(snapshot.data!.avatar_url),
                            width: 100,
                            height: 100,
                            alignment: Alignment.center,
                          ),
                        ]);
                  } else if (snapshot.hasError) {
                    return Container(
                        child: Center(
                      child: Card(
                        child: ListTile(
                          title: Text('${snapshot.error}'),
                        ),
                        elevation: 8,
                        shadowColor: Colors.blueGrey,
                        margin: EdgeInsets.all(20),
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.white)),
                      ),
                    ));
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
