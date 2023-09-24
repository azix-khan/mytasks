import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mytasks/Screens/login_screen.dart';
import 'package:mytasks/Screens/signup_screen.dart';
import 'package:mytasks/Utils/custom_container.dart';
import 'package:mytasks/Utils/round_button.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            // Background Container
            customContainer(''),
            // App's Content
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            'MY TASK', // Use the provided title here
                            style: GoogleFonts.carterOne(
                              textStyle: const TextStyle(
                                  color: Colors.white,
                                  letterSpacing: .5,
                                  fontSize: 50),
                            ),
                          ),
                          Text(
                            "Welcome, Let's make it easy", // Use the provided title here
                            style: GoogleFonts.carterOne(
                              textStyle: const TextStyle(
                                  color: Color(0xff63ABFF),
                                  letterSpacing: .5,
                                  fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      RoundButton(
                          title: 'Login',
                          loading: false,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginScreen()));
                          }),
                      const SizedBox(
                        height: 20,
                      ),
                      RoundButton(
                          title: 'Sign Up',
                          loading: false,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const SignUpScreen()));
                          }),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
