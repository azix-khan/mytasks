import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:mytasks/Screens/home_screen.dart';
import 'package:mytasks/Screens/signup_screen.dart';
import 'package:mytasks/Utils/custom_container.dart';
import 'package:mytasks/Utils/custom_toast_message.dart';
import 'package:mytasks/Utils/round_button.dart';
import 'package:mytasks/provider/visibility_provider.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool loading = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  late final LocalAuthentication auth;
  bool _supportState = false;
  bool _lights = false;
  String? fingerprintData;

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
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  Future<void> login() async {
    setState(() {
      loading = true;
    });

    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text.toString(),
      );

      final email = userCredential.user?.email;

      if (email != null) {
        await _fetchFingerprintData(email);
      }

      Utils().toastMessage(email ?? "Logged in successfully");

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
      setState(() {
        loading = false;
      });
    } catch (error) {
      debugPrint(error.toString());
      Utils().toastMessage(error.toString());
      setState(() {
        loading = false;
      });
    }
  }

  Future<void> _fetchFingerprintData(String email) async {
    try {
      final snapshot =
          await FirebaseFirestore.instance.collection('users').doc(email).get();

      if (snapshot.exists) {
        fingerprintData = snapshot['fingerprint'];
      } else {
        fingerprintData = null;
      }
    } catch (e) {
      print('Error fetching fingerprint data: $e');
    }
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

      if (authenticated) {
        if (fingerprintData != null) {
          Utils().toastMessage('Fingerprint authenticated.');
        } else {
          Utils().toastMessage('Fingerprint not registered.');
        }
      }
    } on PlatformException catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final iconVisibilityProvider = Provider.of<IconVisibilityProvider>(context);

    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: <Widget>[
            customContainer('My Task', context),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Email Required';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'Email',
                            prefixIcon: const Icon(
                              Icons.email,
                              color: Color(0xff088F8F),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  const BorderSide(color: Color(0xff6495ED)),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            hintText: 'Email',
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Consumer<IconVisibilityProvider>(
                          builder: (context, value, child) {
                            return TextFormField(
                              controller: passwordController,
                              obscureText: !iconVisibilityProvider.isVisible,
                              keyboardType: TextInputType.visiblePassword,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Password Required';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                labelText: 'Password',
                                prefixIcon: const Icon(
                                  Icons.lock,
                                  color: Color(0xff088F8F),
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    iconVisibilityProvider.toggleVisibility();
                                  },
                                  icon: Icon(
                                    iconVisibilityProvider.isVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                  color: Colors.teal,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                      color: Color(0xff6495ED)),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                hintText: 'Password',
                              ),
                            );
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Unlock with Fingerprint?'),
                              const SizedBox(
                                width: 5,
                              ),
                              // Show the CupertinoSwitch conditionally
                              if (_supportState)
                                CupertinoSwitch(
                                  activeColor: CupertinoColors.activeGreen,
                                  trackColor: CupertinoColors.systemTeal,
                                  thumbColor: CupertinoColors.white,
                                  value: _lights,
                                  onChanged: (value) {
                                    setState(() {
                                      _lights = value;
                                      if (_lights) {
                                        if (fingerprintData != null) {
                                          _authenticate();
                                        } else {
                                          Utils().toastMessage(
                                              'Fingerprint not registered.');
                                        }
                                      }
                                    });
                                  },
                                ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        RoundButton(
                          title: 'Login',
                          loading: false,
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              login();
                            }
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Don't have an account? "),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SignUpScreen(),
                                  ),
                                );
                              },
                              child: const Text(
                                'Sign Up',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                        // Column(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   crossAxisAlignment: CrossAxisAlignment.center,
                        //   children: [
                        //     // Conditionally display device support message
                        //     if (_supportState)
                        //       const Text('This device is supported')
                        //     else
                        //       const Text('This device is not supported'),
                        //     ElevatedButton(
                        //       onPressed: () {},
                        //       // onPressed: _getAvailableBiometrics,
                        //       child: const Text('Get Available biometrics'),
                        //     ),
                        //   ],
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
