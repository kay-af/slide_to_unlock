import 'package:flutter/material.dart';
import 'package:slide_to_unlock/home_screen.dart';
import 'package:slide_to_unlock/lock_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => const LockScreen(),
        "/home": (context) => const HomeScreen()
      },
    );
  }
}
