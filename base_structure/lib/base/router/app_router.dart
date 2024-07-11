import 'package:base_structure/base/router/app_routes.dart';
import 'package:base_structure/core/contracts/presentation/page.dart';
import 'package:base_structure/features/auth/presentation/view/page/auth_page.dart';
import 'package:base_structure/features/splash/presentation/view/page/splash_page.dart';

abstract class AppRouter {
  static const String initial = Routes.splash;

  static List<Page<dynamic>> get pages => _getPages();

  static List<Page<dynamic>> _getPages() {
    return <Page<dynamic>>[
      SplashPage(),
      AuthPage(),
    ];
  }
}
