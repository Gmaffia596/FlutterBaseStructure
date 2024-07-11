import 'package:base_structure/base/network/client_service_graph.dart';
import 'package:base_structure/core/contracts/generic/binding.dart';
import 'package:base_structure/core/utils/secure_storage.dart';
import 'package:get/get.dart';

class AppBinding extends Binding {
  @override
  Future<void> dependencies() async {
    await preferencesInit();
    _clientInit();
  }

  static Future<void> preferencesInit() async {
    Get.put<SecureStorage>(SecureStorage());
  }

  static void _clientInit() {
    Get.put<GraphQLApiClient>(
      GraphQLApiClient(),
    );
  }
  // static void _clientInit() {
  //   Get.put<ApiClient>(
  //     ApiClient(Get.find<AuthRepository>()),
  //   );
  // }
}
