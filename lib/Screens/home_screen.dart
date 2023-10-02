import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:mytasks/Screens/welcome_screen.dart';
import 'package:mytasks/Utils/custom_container.dart';
import 'package:mytasks/Utils/custom_drawer.dart';
import 'package:mytasks/provider/theme_changer_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final LocalAuthentication auth;
  bool _supportState = false;

  @override
  void initState() {
    super.initState();
    auth = LocalAuthentication();
    _checkBiometricSupport();
  }

  Future<void> _checkBiometricSupport() async {
    bool isSupported = await auth.isDeviceSupported();
    if (mounted) {
      setState(() {
        _supportState = isSupported;
      });
    }
  }

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
          customContainer('', context),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (_supportState)
                const Text('This device is supported')
              else
                const Text('This device is not supported'),
              const Divider(
                height: 100,
              ),
              ElevatedButton(
                  onPressed: _getAvailableBiometrics,
                  child: Text('Get Available biometrics')),
              const Divider(
                height: 100,
              ),
              ElevatedButton(
                  onPressed: _authenticate, child: Text('Authenticate')),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _authenticate() async {
    try {
      bool authenticated = await auth.authenticate(
        localizedReason: 'Authenticate to continue',
        options: const AuthenticationOptions(
          biometricOnly: false,
          stickyAuth: true,
        ),
      );
      print('Authenticated: $authenticated');
    } on PlatformException catch (e) {
      print(e);
    }
  }

  Future<void> _getAvailableBiometrics() async {
    List<BiometricType> availableBiometrics =
        await auth.getAvailableBiometrics();
    print('List of available biometrics $availableBiometrics');
  }
}
