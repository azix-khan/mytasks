import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget customContainer(String title, BuildContext context) {
  final screenSize = MediaQuery.of(context).size;
  final isSmallScreen = screenSize.width < 600;

  return Container(
    child: Stack(
      children: <Widget>[
        Container(
          alignment: Alignment.topCenter,
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xffC2E5FE),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(isSmallScreen ? 30 : 80),
            ),
          ),
          child: const Text(
            '',
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xff78C6F2),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.elliptical(isSmallScreen ? 400.20 : 800.20,
                  isSmallScreen ? 150.30 : 300.30),
              bottomRight: Radius.circular(isSmallScreen ? 90 : 180),
            ),
          ),
          child: Center(
            child: Text(
              title,
              style: GoogleFonts.carterOne(
                textStyle: TextStyle(
                  color: const Color(0xffEAF2F2),
                  letterSpacing: isSmallScreen ? 0.2 : 0.5,
                  fontSize: isSmallScreen ? 40 : 50,
                ),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xff78C6F2),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(isSmallScreen ? 90 : 180),
                topRight: Radius.elliptical(isSmallScreen ? 400.20 : 800.20,
                    isSmallScreen ? 150.30 : 300.30),
              ),
            ),
            child: const Center(
              child: Text(
                '',
                style: TextStyle(
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
