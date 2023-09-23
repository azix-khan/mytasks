import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget customContainer() {
  return Container(
    child: Stack(
      children: <Widget>[
        Container(
          alignment: Alignment.topCenter,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Color(0xffC2E5FE),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(80),
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
          decoration: const BoxDecoration(
            color: Color(0xff78C6F2),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.elliptical(800.20, 300.30),
              bottomRight: Radius.circular(180),
            ),
          ),
          child: Center(
            child: Text(
              'My Task',
              style: GoogleFonts.carterOne(
                textStyle: const TextStyle(
                    color: Color(0xffEAF2F2), letterSpacing: .5, fontSize: 50),
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
            decoration: const BoxDecoration(
              color: Color(0xff78C6F2),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(180),
                topRight: Radius.elliptical(800.20, 300.30),
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
