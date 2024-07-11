import 'package:flutter/widgets.dart';

abstract class Routes {
  static const String splash = '/spalsh';
  static const String auth = '/auth';
  static const String singIn = '/singIn';
  static const String signUp = '/signUp';
  static const String qrTagFlow = '/qrTagFlow';
  static const String microchipFlow = '/microchipFlow';
  static const String gpsTrackerFlow = '/gpsTrackerFlow';
}

@immutable
abstract class Destinations {
  Destinations(this.root)
      : assert(
          root.startsWith('/'),
          'Destinations.root must begin with: `/`',
        );

  final String root;

  String call(String route) {
    assert(route.startsWith('/'), 'Route must begin with: `/`');
    return root + route;
  }
}
