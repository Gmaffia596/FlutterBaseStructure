import 'package:base_structure/core/contracts/presentation/view_model.dart';
import 'package:flutter/cupertino.dart';

class AuthViewModel extends ViewModel {
  AuthViewModel();

  TextEditingController passwordController = TextEditingController();
  TextEditingController mailController = TextEditingController();

  @override
  void onInit() async {
    super.onInit();
  }
}
