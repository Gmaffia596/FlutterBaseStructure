import 'package:base_structure/base/router/app_router.dart';
import 'package:base_structure/core/utils/base/app_binding.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light));
  await AppBinding().dependencies();
  runApp(const BaseApp());
}

class BaseApp extends StatelessWidget {
  const BaseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
          useMaterial3: true,
          textSelectionTheme: TextSelectionThemeData(
            selectionColor: Colors.black.withOpacity(.5),
            cursorColor: Colors.black,
            selectionHandleColor: Colors.black,
          )),
      initialRoute: AppRouter.initial,
      getPages: AppRouter.pages,
    );
  }
}
