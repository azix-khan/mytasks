import 'package:flutter/material.dart';
import 'package:mytasks/Screens/login_screen.dart';
import 'package:mytasks/Screens/signup_screen.dart';
import 'package:mytasks/Screens/welcome_screen.dart';
import 'package:mytasks/Utils/custom_bottomsheet.dart';
import 'package:mytasks/provider/theme_changer_provider.dart';

class MyDrawer extends StatelessWidget {
  final ThemeChangerProvider themeChanger;

  // ignore: use_key_in_widget_constructors
  const MyDrawer({Key? key, required this.themeChanger});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xff78C6F2),
            ),
            accountName: Text(
              "Azix Ur Rahman",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            accountEmail: Text(
              "azixkhan.55@gmail.com",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.person,
                size: 50,
                color: Color(0xff78C6F2),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.sunny),
            title: const Text("Theme Mode"),
            onTap: () {
              Navigator.pop(context);
              showCustomBottomSheet(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.sports_handball_outlined),
            title: const Text("Welcome Screen"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const WelcomeScreen(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("Sign In"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.person_add_alt),
            title: const Text("Sign UP"),
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
    );
  }
}
