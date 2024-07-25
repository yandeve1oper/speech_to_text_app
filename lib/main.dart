import 'package:flutter/material.dart';

import 'core/app.dart';
import 'core/dependencies.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Dependencies.init();

  runApp(const MyApp());
}
