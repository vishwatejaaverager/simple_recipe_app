import 'package:flutter/material.dart';
import 'package:food/screens/add_steps_screen.dart';

class ShowScreen extends StatelessWidget {
  static const routename = '/show-screen';
  const ShowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("add reciepe"),
      ),
      body: Center(
        child: Text("click button to add recipe"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          Navigator.pushNamed(context, AddScreen.routename);
        }),
        child: Icon(Icons.add),
      ),
    );
  }
}
