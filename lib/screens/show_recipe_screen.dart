import 'package:flutter/material.dart';

class ShowRecipe extends StatelessWidget {
  final String dishname;
  final String instructions;
  final String personalTouch;
  final String Photo;
  const ShowRecipe(
      {super.key,
      required this.dishname,
      required this.Photo,
      required this.personalTouch,
      required this.instructions});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              margin: EdgeInsets.all(16),
              height: size.height / 6,
              width: size.width / 2.5,
              child: Image.network(Photo),
            ),
            SizedBox(
              width: 20,
            ),
            Text(dishname)
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Container(
            margin: EdgeInsets.all(16),
            child: Text(
              "ingredients",
              style: TextStyle(fontSize: 15),
            )),
        Container(
            margin: EdgeInsets.all(16),
            child: Text(
              instructions,
              style: TextStyle(fontSize: 25),
            )), //dynamic
        Container(
            margin: EdgeInsets.all(16),
            child: Text(
              "personal touch",
              style: TextStyle(fontSize: 15),
            )),
        Container(
            margin: EdgeInsets.all(16),
            child: Text(
              personalTouch,
              style: TextStyle(fontSize: 15),
            )), //dynamic
      ],
    );
  }
}
