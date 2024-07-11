import 'package:base_structure/base/router/app_routes.dart';
import 'package:base_structure/core/contracts/presentation/view_model.dart';
import 'package:base_structure/core/utils/secure_storage.dart';
import 'package:base_structure/features/auth/domain/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashViewModel extends ViewModel {
  SplashViewModel(
      this.authRepository,
      this.storage
  );

  final AuthRepository authRepository;
  final SecureStorage storage;

  @override
  void onInit() async {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await checkUserSession();
    });
    super.onInit();
  }

  Future<void> checkUserSession() async {
    final String? refreshToken = await storage.getRefreshToken;

    await Future<void>.delayed(
      const Duration(seconds: 2),
    );

    if(refreshToken == '' || refreshToken == null){
      await Get.offNamed(Routes.auth);
    }
  }
}
