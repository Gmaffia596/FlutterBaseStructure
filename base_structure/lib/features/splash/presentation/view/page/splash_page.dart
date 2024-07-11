
import 'package:base_structure/base/router/app_routes.dart';
import 'package:base_structure/core/contracts/presentation/page.dart';
import 'package:base_structure/features/splash/binding/splash_binding.dart';
import 'package:base_structure/features/splash/presentation/view/screen/splash_screen.dart';

class SplashPage extends Page<dynamic> {
  SplashPage()
      : super(
          name: Routes.splash,
          page: SplashScreen.new,
          binding: SplashBinding(),
        );
}
