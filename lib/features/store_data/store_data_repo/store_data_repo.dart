import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food/features/store_data/store_data_repo/storage_data_repo.dart';
import 'package:food/models/recipe_model.dart';
import 'package:food/screens/dashboard.dart';
import 'package:food/utils/utils.dart';

final storeDataRepoProvider = Provider((ref) => StoreDataRepo(
    auth: FirebaseAuth.instance, firestore: FirebaseFirestore.instance));

class StoreDataRepo {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  StoreDataRepo({required this.auth, required this.firestore});

  void saveRecipeData(
      {required String dishname,
      required ProviderRef ref,
      required BuildContext context,
      required File? photo,
      required String personalTouch,
      required String ingredients}) async {
    try {
      String uid = auth.currentUser!.uid;
      String photoUrl =
          'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg';
      if (photo != null) {
        photoUrl = await ref
            .read(StorageRepoProvider)
            .storeFileToFirebase('profilePic/$uid', photo);
      }
      var user = Recipe(
        dishName: dishname,
        uid: uid,
        photo: photoUrl,
        ingredients: ingredients,
        personaltouch: personalTouch,
      );
      await firestore.collection('users').doc(uid).set(user.toMap());
      Navigator.pushNamed(context, Dashboard.routename,);
    } catch (e) {
      showSnackBar(context: context, content: e.toString());
    }
  }

  Future<Recipe?> getCurentUserRecipe() async {
    Recipe? recipe;
    var userData =
        await firestore.collection("users").doc(auth.currentUser?.uid).get();
    if (userData.data() != null) {
      recipe = Recipe.fromMap(userData.data()!);
    }
    return recipe;
  }
}
