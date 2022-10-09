import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food/features/authentication/auth_controller/auth_controller.dart';
import 'package:food/features/authentication/screens/signup_screen.dart';


class LoginScreen extends ConsumerStatefulWidget {

  static const routename = '/login-screen';
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passsController = TextEditingController();

  void login() async {
    String email = emailController.text.trim();
    String pass = passsController.text.trim();

    if (email.isNotEmpty && pass.isNotEmpty) {
      ref.read(authControllerProvider).signInUser(context,email, pass);
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("log in"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'enter email'
              ),

            ),
          ),
           Container(
            
            padding: EdgeInsets.all(16.0),
            child: TextField(
              controller: passsController,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'enter password'
              ),

            ),
          ),
          ElevatedButton(onPressed: login, child: Text("login")),
          Container(
            child: InkWell(
              onTap: (() => Navigator.pushNamed(context, SignUpScreen.routename)),
              child: Text("if not register click here ")),
          )
        ],
      ),
    );
  }
}