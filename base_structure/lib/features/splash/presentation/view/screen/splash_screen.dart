import 'package:base_structure/core/contracts/presentation/screen.dart';
import 'package:base_structure/features/splash/presentation/view_model/splash_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreen extends Screen<SplashViewModel> {
  SplashScreen({super.key});
  
  @override
  Widget builder() {
      return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: SizedBox(
            width: 245,
            height: 94,
            child: SvgPicture.asset('assets/icon/LogoDW.svg',
                color: Colors.white),
          ),
        ),
      );
  }
}
