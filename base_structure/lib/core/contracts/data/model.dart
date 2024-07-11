

import 'package:base_structure/core/contracts/domain/entity.dart';

abstract class Model<T extends Entity> {
  T toEntity();

  Map<String, dynamic> toJson();
}
