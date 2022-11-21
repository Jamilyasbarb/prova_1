import 'package:flutter/material.dart';

import '../components/login_form_component.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  _LoginPageState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding( 
        padding: const EdgeInsets.only(),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: SizedBox(
                  width: 220,
                  child: Image.asset('assets/images/logo_RGB.png'),
                ),
              ),
              const Text('Login', style: TextStyle(fontSize: 20),),
              LoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}