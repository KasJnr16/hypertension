import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hypertension_app/bindings/general_bindings.dart';
import 'package:hypertension_app/features/core/screens/home/home_screen.dart';
import 'package:hypertension_app/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      //Defining themes for app
      themeMode: ThemeMode.system,
      theme: UniAppTheme.lightTheme,
      darkTheme: UniAppTheme.darkTheme,

      initialBinding: GeneralBindings(),

      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
