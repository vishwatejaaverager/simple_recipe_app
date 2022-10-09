import 'package:flutter/material.dart';
import 'package:food/features/authentication/auth_repo/auth_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authControllerProvider = Provider((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return AuthController(authRepository: authRepository, providerRef: ref);
});

class AuthController {
  final AuthRepository authRepository;
  final ProviderRef providerRef;

  AuthController({required this.authRepository, required this.providerRef});

  void signUpWithEmail(BuildContext context, String email, String pass) {
    authRepository.signUpWithEmail(context, email, pass);
  }

  void signInUser(BuildContext context, String email, String pass) {
    authRepository.signInUser(context, email, pass);
  }
}
