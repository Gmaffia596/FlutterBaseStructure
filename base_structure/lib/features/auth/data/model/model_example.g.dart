// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_example.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelExample _$ModelExampleFromJson(Map<String, dynamic> json) => ModelExample(
      prop1: json['prop1'] as String?,
      prop2: json['prop2'] as String?,
      prop3: json['prop3'] as String?,
      prop4: json['prop4'] == null
          ? null
          : ModelExample.fromJson(json['prop4'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ModelExampleToJson(ModelExample instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('prop1', instance.prop1);
  writeNotNull('prop2', instance.prop2);
  writeNotNull('prop3', instance.prop3);
  writeNotNull('prop4', instance.prop4);
  return val;
}
