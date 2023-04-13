/*import 'package:flutter/material.dart';
import 'package:vinescart/main.dart';

import 'home.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    //_navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(Duration(milliseconds: 5000), () {});
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => MyHomePage(
                  title: 'Welcome',
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(height: 200, width: 200, color: Colors.blueGrey),
            Container(
                child: Text('Splash Screen',
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
          ],
        ),
      ),
    );
  }
}*/
