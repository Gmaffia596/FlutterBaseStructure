
import 'package:base_structure/core/contracts/domain/entity.dart';

class EntityExample extends Entity{
  EntityExample({
    this.prop1,
    this.prop2,
    this.prop3,
    this.prop4,
  });

  String? prop1;
  String? prop2;
  String? prop3;
  EntityExample? prop4;
}