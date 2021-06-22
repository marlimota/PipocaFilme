import 'package:flutter/material.dart';
import 'my_app.dart';
import 'injection_container.dart' as di;

Future<void> main() async {
  runApp(MyApp());
  await di.init();
}
