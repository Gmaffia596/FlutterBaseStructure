import 'package:base_structure/core/contracts/presentation/view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart' show Get, GetMiddleware, Inst;

@optionalTypeArgs
abstract class Middleware<T extends ViewModel> extends GetMiddleware {
  final T viewModel = Get.find<T>();
}
