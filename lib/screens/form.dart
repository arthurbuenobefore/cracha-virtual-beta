import 'package:flutter/material.dart';
import 'package:cracha_virtual_beta/screens/home.dart';

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                    controller: myController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Insira seu nome de usuário',
                    )),
              ],
            ),
          ],
        ),
      ),
      // body: Padding(
      //     padding: const EdgeInsets.all(16.0),
      //     child: Center(
      //       child: TextField(
      //         controller: myController,
      //         decoration: InputDecoration(
      //           prefixIcon: Icon(Icons.search),
      //           hintText: 'Insira seu nome de usuário',
      //         ),
      //       ),
      //     )),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: () {
      //     Navigator.push(
      //         context,
      //         MaterialPageRoute(
      //             builder: (context) => Home(username: myController.text)));
      //   },
      //   label: const Text('PESQUISAR'),
      //   backgroundColor: Colors.blueAccent,
      // ),
    );
  }
}
