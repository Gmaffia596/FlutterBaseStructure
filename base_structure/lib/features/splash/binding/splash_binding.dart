import 'package:base_structure/core/contracts/generic/binding.dart';
import 'package:base_structure/core/utils/secure_storage.dart';
import 'package:base_structure/features/auth/data/auth_repository_impl.dart';
import 'package:base_structure/features/auth/data/data_sources/auth_data_source.dart';
import 'package:base_structure/features/auth/data/data_sources/auth_data_source_impl.dart';
import 'package:base_structure/features/auth/domain/auth_repository.dart';
import 'package:base_structure/features/splash/presentation/view_model/splash_view_model.dart';
import 'package:get/get.dart';

class SplashBinding extends Binding {
  @override
  void dependencies() {
    Get.lazyPut<AuthDataSources>(AuthDataSourceImpl.new);

    Get.lazyPut<AuthRepository>(
      () => AuthRepositoryImpl(
        Get.find<AuthDataSources>(),
      ),
    );

    Get.lazyPut(() => SplashViewModel(
        Get.find<AuthRepository>(),
        Get.find<SecureStorage>())
    );
  }
}
