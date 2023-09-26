import 'package:flutter/material.dart';
import 'package:mytasks/Screens/welcome_screen.dart';
import 'package:mytasks/provider/visibility_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => IconVisibilityProvider()),
      ],
      child: Builder(builder: (BuildContext context) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primaryColor: const Color(0xff78C6F2),
            scaffoldBackgroundColor: const Color(0xff78C6F2),
            useMaterial3: true,
          ),
          debugShowCheckedModeBanner: false,
          home: const WelcomeScreen(),
        );
      }),
    );
  }
}
