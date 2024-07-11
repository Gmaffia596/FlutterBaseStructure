import 'package:base_structure/base/network/client_service_graph.dart';
import 'package:base_structure/core/contracts/data/data_sources/data_source.dart';
import 'package:base_structure/core/contracts/domain/entity.dart';
import 'package:base_structure/core/utils/base/params.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class BaseRemoteDataSource<ID, E extends Entity, P extends Params<E>>
    extends DataSource<E, P> {
  GraphQLApiClient get client => Get.find<GraphQLApiClient>();
  //ApiClient get client => Get.find<ApiClient>();
}

@optionalTypeArgs
abstract class RemoteDataSource<ID, E extends Entity, P extends Params<E>>
    extends BaseRemoteDataSource<ID, E, P> {}
