import 'package:base_structure/core/utils/base/arguments.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart' show GetPage;

typedef ScreenBuilder = Widget Function();

@optionalTypeArgs
abstract class Page<T> extends GetPage<T> {
  Page({
    required super.name,
    required super.page,
    super.binding,
    super.bindings,
    super.middlewares,
    super.children,
    super.transition
  });

  // shorthand syntax.
  static Arguments get args => Arguments();
}
