import 'package:flutter/material.dart';
import 'package:auth_buttons/auth_buttons.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                height: 40,
                width: 250,
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      print(_emailController.text);
                      print(_passwordController.text);
                    }
                  },
                  child: Text('Login'),
                  style: ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)))),
                ),
              ),
              TextButton(
                onPressed: () {
                  print('sign up pressed');
                },
                child: Text('Sign Up'),
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
                onPressed: () {
                  print('Google');
                },
                style: const AuthButtonStyle(
                  buttonType: AuthButtonType.secondary,
                  buttonColor: Colors.blue,
                  iconBackground: Colors.white,
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
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
