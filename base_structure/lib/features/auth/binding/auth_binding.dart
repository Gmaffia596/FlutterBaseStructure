import 'package:base_structure/core/contracts/generic/binding.dart';
import 'package:base_structure/features/auth/presentation/view_model/auth_view_model.dart';
import 'package:get/get.dart';

class AuthBinding extends Binding {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
  }
}
