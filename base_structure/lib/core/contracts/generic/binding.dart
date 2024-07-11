import 'package:get/get.dart' show Bindings, Inst, InstanceBuilderCallback, Get;

abstract class Binding extends Bindings {
  S put<S>(
    S dependency, {
    bool permanent = false,
  }) =>
      Get.put(dependency, permanent: permanent);

  void lazyPut<S>(InstanceBuilderCallback<S> builder) => Get.lazyPut(builder);

  S find<S>() => Get.find<S>();
}
