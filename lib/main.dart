import 'package:flutter/material.dart';
import 'package:internee_app/Screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: const Color(0xff78C6F2),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}
