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
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(
            image: AssetImage('assets/logo.png'),
            width: 200,
            height: 200,
            alignment: Alignment.center,
          ),
          Padding(
              padding: const EdgeInsets.all(54.0),
              child: Center(
                child: TextFormField(
                  validator: (value) {
                    if (value == '') return 'Insira o nome de usuário';
                    return null;
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: myController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Nome de usuário',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50)),
                  ),
                ),
              )),
          ElevatedButton(
            onPressed: () {
              if (myController.text == '') {
                showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('Erro:'),
                    content: const Text('Insira um nome antes de pesquisar!'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'OK'),
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
              } else {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Home(username: myController.text)));
              }
            },
            child: Text('PESQUISAR'),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.blueAccent), // background (button) color
                //foregroundColor: Colors.white,
                padding:
                    MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(20)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.blueAccent)))),
          )
        ],
      )),
    );
  }
}
