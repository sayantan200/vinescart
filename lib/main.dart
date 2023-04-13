import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:vinescart/home.dart';
import 'splash.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: AnimatedSplashScreen(
            duration: 3000,
            splash: Image.asset('assets/icon/vinescart.png'),
            nextScreen: B2BEcommerceForm(),
            splashTransition: SplashTransition.fadeTransition,
            backgroundColor: Color.fromARGB(255, 189, 236, 212)),
        debugShowCheckedModeBanner: false);
  }
}
