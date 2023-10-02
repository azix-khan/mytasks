import 'package:flutter/material.dart';
import 'package:mytasks/Screens/home_screen.dart';
import 'package:mytasks/Screens/signup_screen.dart';
import 'package:mytasks/Utils/custom_container.dart';
import 'package:mytasks/Utils/round_button.dart';
import 'package:mytasks/provider/visibility_provider.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final iconVisibilityProvider = Provider.of<IconVisibilityProvider>(context);
    print('build');

    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Background Container
          customContainer('My Task', context),
          // App's Content
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
                                borderSide:
                                    const BorderSide(color: Color(0xff6495ED)),
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
                        height: 50,
                      ),
                      RoundButton(
                        title: 'Login',
                        loading: false,
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomeScreen(),
                              ),
                            );
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
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
