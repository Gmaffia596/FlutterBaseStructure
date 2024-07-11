
import 'package:base_structure/core/contracts/domain/entity.dart';
import 'package:base_structure/core/utils/base/sorting.dart';

class Params<E extends Entity> {
  Params({
    this.entity,
    this.page,
    this.records,
    this.sort,
    this.filters,
  });

  E? entity;
  int? page;
  int? records;
  Map<String, SortOrder>? sort;
  Map<String, dynamic>? filters;
}
