import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food/features/store_data/store_data_controller/store_data_controller.dart';
import 'package:food/screens/add_steps_screen.dart';
import 'package:food/screens/create_recipe_screen.dart';
import 'package:food/screens/show_recipe_screen.dart';
import 'package:food/utils/utils.dart';

class Dashboard extends ConsumerWidget {
  static const routename = '/dash-screen';

  const Dashboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ok = ref.watch(userDataProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("recipe app"),
      ),
      body: SingleChildScrollView(
          child: ok.when(
              data: (data) {
                if (data != null) {
                  return ShowRecipe(
                    dishname: data.dishName,
                    Photo: data.photo,
                    instructions: data.ingredients,
                    personalTouch: data.personaltouch,
                  );
                } else {
                  return Text("data");
                }
              },
              error: (error, stackTrace) {
                showSnackBar(context: context, content: error.toString());
              },
              loading: () => CircularProgressIndicator())),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.widgets), label: ''),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        isExtended: true,
        onPressed: () {
          Navigator.pushNamed(context, AddScreen.routename);
        },
        child: Center(child: Text("aad recipe")),
      ),
    );
  }
}
