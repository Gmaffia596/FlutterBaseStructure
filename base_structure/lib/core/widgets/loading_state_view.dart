import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class LoadingStateView extends GetView{
  const LoadingStateView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: const Center(
          child: CircularProgressIndicator(
          color: Colors.black,)
    ));

  }
}
