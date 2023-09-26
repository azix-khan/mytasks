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
    final screenSize = MediaQuery.of(context).size;
    final isSmallScreen = screenSize.width < 600;
    final isShortScreen = screenSize.height < 600;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Background Container
          customContainer('', context),
          Center(
            child: Padding(
              padding: EdgeInsets.all(isSmallScreen ? 10.0 : 20.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text(
                          'MY TASK',
                          style: GoogleFonts.carterOne(
                            textStyle: TextStyle(
                              color: Colors.white,
                              letterSpacing: isSmallScreen ? 1.0 : 0.5,
                              fontSize: isSmallScreen ? 30 : 50,
                            ),
                          ),
                        ),
                        Text(
                          "Welcome, Let's make it easy",
                          style: GoogleFonts.carterOne(
                            textStyle: TextStyle(
                              color: const Color(0xff63ABFF),
                              letterSpacing: isSmallScreen ? 0.5 : 0.2,
                              fontSize: isSmallScreen ? 16 : 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: isShortScreen ? 20 : (isSmallScreen ? 30 : 50),
                    ),
                    RoundButton(
                      title: 'Login',
                      loading: false,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: isShortScreen ? 10 : (isSmallScreen ? 15 : 20),
                    ),
                    RoundButton(
                      title: 'Sign Up',
                      loading: false,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
