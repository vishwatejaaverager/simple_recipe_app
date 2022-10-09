import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food/features/authentication/auth_controller/auth_controller.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  static const routename = '/signUp-screen';

  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passsController = TextEditingController();

  void signUp() async {
    String email = emailController.text.trim();
    String pass = passsController.text.trim();

    if (email.isNotEmpty && pass.isNotEmpty) {
      ref.read(authControllerProvider).signUpWithEmail(context,email, pass);
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign up"),
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
                  border: OutlineInputBorder(), labelText: 'enter email'),
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              controller: passsController,
              obscureText: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'enter password'),
            ),
          ),
          ElevatedButton(onPressed: signUp, child: Text("create account"))
        ],
      ),
    );
  }
}
