import 'package:base_structure/core/contracts/domain/entity.dart';
import 'package:base_structure/core/utils/base/params.dart';
import 'package:get/get.dart';

abstract class DataSource<E extends Entity, P extends Params<E>>
    extends GetxService {}
