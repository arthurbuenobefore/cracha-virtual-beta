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
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide:
                                BorderSide(width: 0, style: BorderStyle.none)),
                        prefixIcon: Icon(Icons.person),
                        hintText: 'Nome de usuário',
                        filled: true,
                        fillColor: Color.fromRGBO(209, 233, 243, 1),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 10.0)),
                  ),
                )),
          ],
        )),
        floatingActionButton: FloatingActionButton.extended(
          extendedPadding: EdgeInsetsDirectional.only(start: 60, end: 60),
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
                      builder: (context) => Home(username: myController.text)));
            }
          },
          label: const Text('PESQUISAR'),
          backgroundColor: Color.fromRGBO(22, 101, 149, 1),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
  }
}
