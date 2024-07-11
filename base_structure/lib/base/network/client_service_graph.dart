import 'package:base_structure/base/utils/constants.dart';
import 'package:base_structure/core/utils/secure_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:graphql/client.dart';

class GraphQLApiClient {
  late GraphQLClient client;
  SecureStorage storage = SecureStorage();

  GraphQLApiClient() {
    final HttpLink httpLink = HttpLink(
      Constant.baseUrl,
      defaultHeaders: {
        'Authorization': 'Bearer ${storage.getAuthToken}',
        'Content-Type': 'application/json',
      },
    );

    final WebSocketLink webSocketLink = WebSocketLink(
      Constant.webSocketBaseUrl,
      config: SocketClientConfig(
        autoReconnect: true,
        headers: {
          'Authorization': 'Bearer ${storage.getAuthToken}',
        },
      ),
    );

    final Link link = Link.split(
          (request) => request.isSubscription,
      webSocketLink,
      httpLink,
    );

    client = GraphQLClient(
      cache: GraphQLCache(store: InMemoryStore()),
      link: link,
    );
  }

  Future<QueryResult> query({
    required String query,
    Map<String, dynamic>? variables,
  }) async {
    final options = QueryOptions(
      document: gql(query),
      variables: variables ?? {},
    );

    final result = await client.query(options);

    if (result.hasException) {
      if (kDebugMode) {
        print('Query exception: ${result.exception.toString()}');
      }
      throw result.exception!;
    }

    return result;
  }

  Future<QueryResult> mutate({
    required String mutation,
    Map<String, dynamic>? variables,
  }) async {
    final options = MutationOptions(
      document: gql(mutation),
      variables: variables ?? {},
    );

    final result = await client.mutate(options);

    if (result.hasException) {
      if (kDebugMode) {
        print('Mutation exception: ${result.exception.toString()}');
      }
      throw result.exception!;
    }

    return result;
  }

  Stream<QueryResult> subscribe({
    required String subscription,
    Map<String, dynamic>? variables,
  }) {
    final options = SubscriptionOptions(
      document: gql(subscription),
      variables: variables ?? {},
    );

    final stream = client.subscribe(options);

    return stream.map((result) {
      if (result.hasException) {
        if (kDebugMode) {
          print('Subscription exception: ${result.exception.toString()}');
        }
        throw result.exception!;
      }
      return result;
    });
  }
}
