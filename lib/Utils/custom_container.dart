import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mytasks/provider/theme_changer_provider.dart';
import 'package:provider/provider.dart';

Widget customContainer(String title, BuildContext context) {
  final screenSize = MediaQuery.of(context).size;
  final isSmallScreen = screenSize.width < 600;
  final themeChanger = Provider.of<ThemeChangerProvider>(context);

  // Define colors for both light and dark themes
  final backgroundColor = themeChanger.themeMode == ThemeMode.dark
      ? Colors.black // Dark theme background color
      : const Color(0xffC2E5FE); // Light theme background color

  final textColor = themeChanger.themeMode == ThemeMode.dark
      ? Colors.white // Dark theme text color
      : const Color(0xffEAF2F2); // Light theme text color

  // Define the color of the other container based on the theme
  final otherContainerColor = themeChanger.themeMode == ThemeMode.dark
      ? const Color(0xff1e2029) // Dark theme container color
      : const Color(0xff78C6F2); // Light theme container color

  return Stack(
    children: <Widget>[
      Container(
        alignment: Alignment.topCenter,
        width: double.infinity,
        decoration: BoxDecoration(
          color: backgroundColor,
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
          color: otherContainerColor,
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
                color: textColor,
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
            color: otherContainerColor,
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
  );
}
