// ignore_for_file: one_member_abstracts

/// annotate subclasses with
///
/// ```dart
/// @JsonSerializable(createFactory: false)
/// ```
abstract class Request {
  Map<String, dynamic> toJson();
}

/// A request that has a different path url.
///
/// ```dart
/// @JsonSerializable(createFactory: false)
/// ```
///
/// Remember to set the `path` in conceit `Repository`.
///
/// [Example](https://github.com/duckma/giusti/blob/1f388fe99a0d16853f0092a5c90e45287e092015/lib/features/client/data/client_repository_impl.dart#L71-L75)
abstract class DynamicRequest extends Request {
  /// The path of the request including the controller.
  ///
  /// Example: `/clienti/getListaClienti`, `/utenti/doLogOut`
  late String path;
}
