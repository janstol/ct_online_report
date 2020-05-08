import 'package:ct_online_report/core/constants.dart';
import 'package:ct_online_report/service_locator.dart';
import 'package:ct_online_report/core/presentation/app.dart';
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
