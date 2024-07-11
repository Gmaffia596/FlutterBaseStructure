import 'package:base_structure/core/utils/base/arguments.dart';
import 'package:base_structure/core/utils/base/typedefs.dart';
import 'package:base_structure/core/widgets/empty_state_view.dart';
import 'package:base_structure/core/widgets/error_state_view.dart';
import 'package:base_structure/core/widgets/loading_state_view.dart';
import 'package:flutter/material.dart'
    show
        BuildContext,
        Material,
        Theme,
        Widget,
        mustCallSuper,
        optionalTypeArgs,
        protected;
import 'package:get/get.dart'
    show
        Get,
        GetxController,
        Inst,
        NotifierBuilder,
        RxStatus,
        SimpleBuilder,
        StateMixin;

// import 'package:shared_preferences/shared_preferences.dart';

@optionalTypeArgs
abstract class ViewModel<T> extends GetxController with StateMixin<T> {
  late BuildContext context;

  // @protected
  // SharedPreferences get preferences => Get.find<SharedPreferences>();

  @protected
  Arguments get arguments => Arguments();

  @protected
  @override
  @mustCallSuper
  void onInit() {
    super.onInit();
    change(null, status: RxStatus.loading());
  }

  @protected
  @override
  void onReady();

  @protected
  @override
  void onClose();

  Widget obx(
    NotifierBuilder<T?> widget, {
    ErrorBuilder? onError,
    Widget? onLoading,
    Widget? onEmpty,
  }) {
    return Material(
      color: Theme.of(context).colorScheme.background,
      child: SimpleBuilder(
        builder: (_) {
          if (status.isLoading) {
            return onLoading ?? const LoadingStateView();
          } else if (status.isError) {
            return onError != null
                ? onError(status.errorMessage)
                : ErrorStateView(status.errorMessage);
          } else if (status.isEmpty) {
            return onEmpty ?? const EmptyStateView();
          }

          return widget(value);
        },
      ),
    );
  }
}
