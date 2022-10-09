import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food/features/store_data/store_data_controller/store_data_controller.dart';
import 'package:food/utils/utils.dart';

class AddScreen extends ConsumerStatefulWidget {
  static const routename = '/addScreen-screen';
  const AddScreen({super.key});

  @override
  ConsumerState<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends ConsumerState<AddScreen> {
  @override
  File? image;
  final TextEditingController dishController = TextEditingController();
  final TextEditingController instructionController = TextEditingController();
  final TextEditingController personalController = TextEditingController();

  void selectImage() async {
    image = await pickImageFromGallery(context);
    setState(() {});
  }

  void storeUserData() async {
    String dish = dishController.text.trim();
    String instrucsion = instructionController.text.trim();
    String personal = personalController.text.trim();
    if (dish.isNotEmpty && instrucsion.isNotEmpty && personal.isNotEmpty) {
      ref
          .read(storedataControllerProvider)
          .saveData(dish, context, image, personal, instrucsion);
    } else {
      showSnackBar(context: context, content: "fill details");
    }
  }

  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Step",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: selectImage,
              child: Container(
                margin: EdgeInsets.all(16.0),
                width: 100,
                height: 100,
                child: Icon(Icons.camera_front_rounded),
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                    blurRadius: 3.0,
                  )
                ]),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              height: 40,
              width: size.width,
              color: Color.fromARGB(255, 5, 16, 80),
              child: Padding(
                padding: EdgeInsets.only(left: 8.0, top: 15.0),
                child: Text(
                  "Upload image ",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(padding: EdgeInsets.all(16.0), child: Text("Step Name")),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                controller: dishController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'step'),
              ),
            ),
            Padding(padding: EdgeInsets.all(16.0), child: Text("instructions")),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                controller: instructionController,
                maxLines: 4,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 10),
                    border: OutlineInputBorder(),
                    labelText: 'instructions'),
              ),
            ),
            Padding(
                padding: EdgeInsets.all(16.0), child: Text("personal touch")),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                controller: personalController,
                maxLines: 3,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 10),
                    border: OutlineInputBorder(),
                    labelText: 'personal touch'),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(14.0))),
        child: Icon(Icons.save_sharp),
        onPressed: storeUserData,
      ),
    );
  }
}
