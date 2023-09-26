import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool loading;

  const RoundButton({
    super.key,
    required this.title,
    required this.onTap,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isSmallScreen = screenSize.width < 600;

    return InkWell(
      onTap: onTap,
      child: Container(
        height: isSmallScreen ? 40 : 50,
        width: isSmallScreen ? 100 : 125,
        decoration: BoxDecoration(
          color: const Color(0xff78C6F2),
          borderRadius: BorderRadius.circular(isSmallScreen ? 15 : 20),
          border: Border.all(color: const Color(0xffEAF2F2)),
        ),
        child: Center(
          child: loading
              ? const CircularProgressIndicator(
                  strokeWidth: 3,
                  color: Colors.white,
                )
              : Text(
                  title,
                  style: const TextStyle(color: Colors.white),
                ),
        ),
      ),
    );
  }
}
