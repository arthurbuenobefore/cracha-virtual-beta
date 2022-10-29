import 'package:flutter/material.dart';
import 'package:cracha_virtual_beta/screens/home.dart';

// void main() => runApp(const CrachaVirtualApp());

// class CrachaVirtualApp extends StatelessWidget {
//   const CrachaVirtualApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       title: 'Material App',
//       home: Home(),
//     );
//   }
// }
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: CrachaVirtualApp());
  }
}

class CrachaVirtualApp extends StatelessWidget {
  const CrachaVirtualApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Crachá Virtual'),
        ),
        body: Center(
          child: TextButton(
            child: Text('Push'),
            onPressed: () => Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return SecondPage();
              },
            )),
          ),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Home(),
    );
  }
}
