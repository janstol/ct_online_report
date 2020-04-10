import 'package:ctonlinereport/core/constants.dart';
import 'package:ctonlinereport/service_locator.dart';
import 'package:ctonlinereport/core/presentation/app.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  await Hive.initFlutter(); // calls WidgetsFlutterBinding.ensureInitialized();
  await Hive.openBox<dynamic>(settingsBoxName);

  // setup dependencies
  await setupServiceLocator();

  runApp(const App());
}
