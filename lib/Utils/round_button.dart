import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RoundButton extends StatelessWidget {
  String text = '';
  RoundButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
          color: const Color(0xff78C6F2),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.teal)),
      child: Center(
        child: Text(text),
      ),
    );
  }
}
