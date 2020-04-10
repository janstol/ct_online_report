import 'dart:io';

import 'package:path/path.dart';

String fixture(String name) =>
    File('$_testDirectory/fixtures/$name').readAsStringSync();

// From https://github.com/flutter/flutter/issues/20907#issuecomment-466185328
final _testDirectory = join(
  Directory.current.path,
  Directory.current.path.endsWith('test') ? '' : 'test',
);
