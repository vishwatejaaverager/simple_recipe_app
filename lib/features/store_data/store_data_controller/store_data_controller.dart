import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food/features/store_data/store_data_repo/store_data_repo.dart';
import 'package:food/models/recipe_model.dart';

final storedataControllerProvider = Provider((ref) {
  final authRepository = ref.watch(storeDataRepoProvider);
  return StoreDataController(storeDataRepo: authRepository, ref: ref);
});

final userDataProvider = FutureProvider((ref) {
  final storeController = ref.watch(storedataControllerProvider);
  return storeController.getCurrentUser();
});

class StoreDataController {
  final StoreDataRepo storeDataRepo;
  final ProviderRef ref;

  StoreDataController({required this.storeDataRepo, required this.ref});

  Future<Recipe?> getCurrentUser() async {
    Recipe? recipe = await storeDataRepo.getCurentUserRecipe();
    return recipe;
  }

  void saveData(String dishname, BuildContext context, File? photo,
      String personalTouch, String ingredients) {
    storeDataRepo.saveRecipeData(
        dishname: dishname,
        context: context,
        photo: photo,
        personalTouch: personalTouch,
        ingredients: ingredients,
        ref: ref);
  }
}
