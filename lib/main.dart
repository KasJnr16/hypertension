import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hypertension_app/app.dart';

Future<void> main() async {
  //Added Widgets Binding
  // final WidgetsBinding widgetsBinding =
  //     WidgetsFlutterBinding.ensureInitialized();

  // Init Local Storage
  await GetStorage.init();

  runApp(const App());
}
