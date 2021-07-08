import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './controllers/app_bindings.dart';
import './widgets/app_theme.dart';
import 'core/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News',
      initialRoute: Routes.initial,
      initialBinding: AppBinding(),
      theme: appThemeData,
      defaultTransition: Transition.fade,
      getPages: Routes.route,
    );
  }
}
