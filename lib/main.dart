import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:testapp/core/infrastructure/injection.dart';
import 'package:testapp/features/app.dart';

Future<void> main(Environment environment) async {
  assert(environment != null);
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection(environment);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) => runApp(App(environment: environment)));
}
