import 'package:flutter/material.dart';
import 'package:cracha_virtual_beta/screens/home.dart';
import 'package:cracha_virtual_beta/model/user.dart';
import 'package:cracha_virtual_beta/services/api_service.dart';

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

// Define a corresponding State class.
// This class holds the data related to the Form.
class _MyCustomFormState extends State<MyCustomForm> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final myController = TextEditingController();
  late final UserModel? user;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  Future<UserModel?> _getData(String name) async {
    user = (await ApiService().getUser(name));
    return user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: myController,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Nome',
            hintText: 'Inseria seu nome de usuário',
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // When the user presses the button, show an alert dialog containing
        // the text that the user has entered into the text field.
        // onPressed: () => Navigator.push(context, MaterialPageRoute(
        //   builder: (context) {
        //     return SecondPage();
        //   },
        // )),
        onPressed: () {
          Future<UserModel?> teste = _getData(myController.text);

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Home(username: myController.text)));
        },
        child: const Icon(Icons.text_fields),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: const Home(),
      body: Center(
        child: TextButton(
          child: Text('Pop!'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
