import 'package:base_structure/core/utils/base/message_type.dart';
import 'package:flutter/cupertino.dart';


typedef MessengerCallback<S> = void Function(
  BuildContext context,
  S message, [
  MessageType? messageType,
]);

typedef JsonObject = Map<String, dynamic>;

typedef ErrorBuilder = Widget Function(String? error);
 
