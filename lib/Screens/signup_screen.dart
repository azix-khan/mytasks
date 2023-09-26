import 'package:flutter/material.dart';
import 'package:mytasks/Screens/home_screen.dart';
import 'package:mytasks/Screens/login_screen.dart';
import 'package:mytasks/Utils/custom_container.dart';
import 'package:mytasks/Utils/round_button.dart';
import 'package:mytasks/provider/checkbox_provider.dart';
import 'package:mytasks/provider/visibility_provider.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool? check = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController userController = TextEditingController();
  TextEditingController confirmController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final iconVisibilityProvider = Provider.of<IconVisibilityProvider>(context);
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
                      const SizedBox(
                        height: 100,
                      ),
                      TextFormField(
                        controller: userController,
                        keyboardType: TextInputType.name,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Field Required';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'User Name',
                          prefixIcon: const Icon(
                            Icons.person,
                            color: Color(0xff088F8F),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  const BorderSide(color: Color(0xff6495ED))),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          hintText: 'User Name',
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Emaill Required';
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
                                  const BorderSide(color: Color(0xff6495ED))),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
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
                        height: 20,
                      ),
                      Consumer<IconVisibilityProvider>(
                        builder: (context, value, child) {
                          return TextFormField(
                            controller: confirmController,
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
                      Consumer<CheckboxProvider>(
                        builder: (context, providerValue, _) {
                          return CheckboxListTile(
                            value: providerValue.isChecked,
                            activeColor: Colors.blue,
                            checkColor: Colors.white,
                            controlAffinity: ListTileControlAffinity.leading,
                            onChanged: (bool? value) {
                              providerValue.toggleCheckbox();
                            },
                            title: const Text("I agree with Terms and Privacy"),
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 0.0),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      RoundButton(
                          title: 'Sign Up',
                          loading: false,
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const HomeScreen()));
                            }
                          }),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Already have an account? "),
                          InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginScreen()));
                              },
                              child: const Text(
                                'Login',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ))
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
