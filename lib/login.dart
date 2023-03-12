import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:auth_buttons/auth_buttons.dart';
import 'package:flutter_forward_demo/services/auth_services.dart';
import 'package:flutter_forward_demo/utils/app_dimension.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool _hidePass = true;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  children: [
                    Image.asset('images/login.png'),
                    const SizedBox(
                      height: 25,
                    ),
                    const Text(
                      'Welcome Back!',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Text(
                      'Enter your credentials',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 15,
                            ),
                            child: TextFormField(
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Email is empty';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.person),
                                labelText: 'Email',
                                hintText: 'abc@gmail.com',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 10,
                            ),
                            child: TextFormField(
                              obscureText: _hidePass,
                              controller: _passwordController,
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Password is empty';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.password),
                                labelText: 'Password',
                                hintText: '********',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _hidePass = !_hidePass;
                                    });
                                  },
                                  icon: Icon(
                                    _hidePass
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 45,
                      width: 250,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            //loading starts

                            setState(() {
                              _isLoading = !_isLoading;
                            });

                            await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                    email: _emailController.text,
                                    password: _passwordController.text);

                            //loading stop
                            setState(() {
                              _isLoading = !_isLoading;
                            });

                            Navigator.pushNamedAndRemoveUntil(
                                context, '/home', (route) => false);
                          }
                        },
                        style: ButtonStyle(
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)))),
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    verticalSpace(10.0),
                    TextButton(
                      onPressed: () {
                        print('sign up pressed');
                        Navigator.pushNamed(context, "/signup");
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: const [
                        Expanded(
                          child: Divider(
                            thickness: 2,
                            indent: 20,
                            endIndent: 15,
                          ),
                        ),
                        Text('Other Options'),
                        Expanded(
                          child: Divider(
                            thickness: 2,
                            indent: 15,
                            endIndent: 20,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GoogleAuthButton(
                      onPressed: () async {
                        // print('Google');
                        setState(() {
                          _isLoading = !_isLoading;
                        });
                        await AuthService().signInGoogle();
                        setState(() {
                          _isLoading = !_isLoading;
                        });
                        Navigator.pushReplacementNamed(context, '/home');
                      },
                      style: const AuthButtonStyle(
                        buttonType: AuthButtonType.secondary,
                        buttonColor: Colors.blue,
                        iconBackground: Colors.white,
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
