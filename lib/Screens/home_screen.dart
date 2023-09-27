import 'package:flutter/material.dart';
import 'package:mytasks/Screens/welcome_screen.dart';
import 'package:mytasks/Utils/custom_container.dart';
import 'package:mytasks/Utils/custom_drawer.dart';
import 'package:mytasks/provider/theme_changer_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChangerProvider>(context);
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: const Text('Home Screen'),
        automaticallyImplyLeading: false,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer(); // This will open the drawer
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
      drawer: MyDrawer(
        themeChanger: themeChanger,
      ),
      body: Stack(
        children: <Widget>[
          customContainer('Home', context),
          const Center(
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
      ),
    );
  }
}
