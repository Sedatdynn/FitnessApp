import 'dart:async';
import 'dart:developer';

import 'core/init/app/app_initial.dart';
import 'package:flutter/material.dart';

Future<void> bootstrap(
  FutureOr<Widget> Function() builder,
) async {
  //For flutter errors (widget errors etc.)
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  await runZonedGuarded(() => _onInit(builder), _onError);
}

///initial func
Future<void> _onInit(
  FutureOr<Widget> Function() builder,
) async {
  runApp(await builder());
  await AppInitialize().init();
}

///Handles zone error
void _onError(Object error, StackTrace stack) {
  log(error.toString(), stackTrace: stack);
}
