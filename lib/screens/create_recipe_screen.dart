import 'package:flutter/material.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class CreateRecipe extends StatefulWidget {
  static const routename = '/createRecipe-screen';
  const CreateRecipe({super.key});

  @override
  State<CreateRecipe> createState() => _CreateRecipeState();
}

class _CreateRecipeState extends State<CreateRecipe> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    List<String> list = <String>['One', 'Two', 'Three', 'Four'];
    String dropdownValue = list.first;

    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text("click "),
            bottom: TabBar(
              labelColor: Color.fromARGB(255, 39, 3, 45),
              unselectedLabelColor: Colors.grey,
              indicator: DotIndicator(
                color: Color.fromARGB(255, 39, 3, 45),
                distanceFromCenter: 16,
              ),
              tabs: [
                Tab(child: Text("Recipe")),
                Tab(child: Text("ingredients")),
                Tab(child: Text("steps"))
              ],
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
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
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Recipe name'),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(padding: EdgeInsets.all(16.0), child: Text("Serves")),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      height: 40,
                      width: size.width / 4,
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(), labelText: 'Ex 2'),
                      ),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 16),
                        height: 40,
                        width: size.width / 4,
                        decoration:
                            BoxDecoration(border: Border.all(color: Colors.grey)),
                        child: DropdownButton(
                          value: dropdownValue,
                          items:
                              list.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? value) {
                            setState(() {
                              dropdownValue = value!;
                            });
                          },
                        )),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text("prep and cook time")),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      height: 40,
                      width: size.width / 4,
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(), labelText: '00 : 00'),
                      ),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      height: 40,
                      width: size.width / 4,
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 16),
                        height: 40,
                        width: size.width / 4,
                        child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(), labelText: '00 : 00'),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
