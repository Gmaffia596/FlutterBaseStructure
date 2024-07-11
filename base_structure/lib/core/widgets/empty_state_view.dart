import 'package:base_structure/base/namespaces/dimensions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
 import 'package:get/get.dart';

class EmptyStateView extends GetView {
  const EmptyStateView({
    super.key,
    this.title,
    this.description,
  });

  final String? title;
  final String? description;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
        const Icon(Icons.warning),
        const SizedBox(height: Dimensions.gapXXL),
        Text(
          title ?? '',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Theme.of(context).colorScheme.secondary,
              ),
        ),
        const SizedBox(height: Dimensions.gap),
        Text(
          description ?? '',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(StringProperty('title', title))
      ..add(StringProperty('description', description));
  }
}
