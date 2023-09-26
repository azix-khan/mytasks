import 'package:flutter/material.dart';
import 'package:mytasks/Screens/login_screen.dart';
import 'package:mytasks/Screens/signup_screen.dart';
import 'package:mytasks/Screens/welcome_screen.dart';
import 'package:mytasks/Utils/custom_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff78C6F2),
          foregroundColor: Colors.white,
          title: const Text('Home Screen'),
          automaticallyImplyLeading: false,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context)
                      .openDrawer(); // This will open the drawer
                },
              );
            },
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WelcomeScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.exit_to_app),
            ),
          ],
        ),
        drawer: Drawer(
          backgroundColor: const Color(0xffC2E5FE),
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              const UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xff78C6F2),
                ),
                accountName: Text("Azix Ur Rahman"),
                accountEmail: Text("azixkhan.55@gmail.com"),
                currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      size: 50,
                    )),
              ),
              ListTile(
                leading: const Icon(Icons.sports_handball_outlined),
                title: const Text("Welcome Screen"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const WelcomeScreen()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text("Sign In"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.person_add_alt),
                title: const Text("Sign UP"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUpScreen()));
                },
              ),
            ],
          ),
        ),
        body: Stack(
          children: <Widget>[
            customContainer('Home', context),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Internee.pk',
                    style: TextStyle(fontSize: 50, color: Colors.teal),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
