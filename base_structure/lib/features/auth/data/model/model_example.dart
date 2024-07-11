import 'package:base_structure/core/contracts/data/model.dart';
import 'package:base_structure/features/auth/domain/entity/entity_example.dart';
import 'package:json_annotation/json_annotation.dart';

part 'model_example.g.dart';

@JsonSerializable(includeIfNull: false)
class ModelExample extends Model<EntityExample> {

  final String? prop1;
  final String? prop2;
  final String? prop3;
  final ModelExample? prop4;

  ModelExample({
    this.prop1,
    this.prop2,
    this.prop3,
    this.prop4,
  });

  @override
  EntityExample toEntity() {
    return EntityExample(
      prop1: prop1,
      prop2: prop2,
      prop3: prop3,
      prop4: prop4?.toEntity(),
    );
  }

  factory ModelExample.fromEntity(EntityExample? entity) {
    return ModelExample(
        prop1: entity?.prop1,
        prop2: entity?.prop2,
        prop3: entity?.prop3,
        prop4: ModelExample.fromEntity(entity?.prop4)
    );
  }

  factory ModelExample.fromJson(Map<String, dynamic> json) =>
      _$ModelExampleFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ModelExampleToJson(this);
}