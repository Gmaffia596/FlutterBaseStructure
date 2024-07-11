import 'package:get/get.dart';

class Arguments {
  final Map<String, dynamic>? store = Get.arguments as Map<String, dynamic>?;

  T? call<T extends Object>(String key) => store?[key];
}
