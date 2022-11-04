import 'package:flutter/material.dart';

import '../services/local_auth_service.dart';
import './home_screen.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool authenticated = false;

  void _login() async {
    final authenticate = await LocalAuth.authenticate();
    setState(() {
      authenticated = authenticate;
    });

    if (authenticated) {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const Home()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text("Please Authenticate Yourself"),
          ElevatedButton(onPressed: _login, child: const Text("Login")),
        ]),
      ),
    );
  }
}
