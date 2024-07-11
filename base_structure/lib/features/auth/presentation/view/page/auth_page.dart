import 'package:base_structure/base/router/app_routes.dart';
import 'package:base_structure/core/contracts/presentation/page.dart';
import 'package:base_structure/features/auth/binding/auth_binding.dart';
import 'package:base_structure/features/auth/presentation/view/screen/auth_screen.dart';

class AuthPage extends Page<dynamic> {
  AuthPage()
      : super(
    name: Routes.auth,
    page: AuthScreen.new,
    binding: AuthBinding(),
  );
}