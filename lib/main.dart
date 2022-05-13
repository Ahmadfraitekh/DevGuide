import 'package:dev_guide/src/core/constants.dart';
import 'package:dev_guide/src/core/helper/binding.dart';
import 'package:dev_guide/src/core/helper/languages/translations.dart';
import 'package:dev_guide/src/core/route.dart';
import 'package:dev_guide/src/domain/viewmodel/theme_viewmodel/theme_viewmodel.dart';

import 'package:dev_guide/src/presentation/resources/theme_manager.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  await SharedPreferences.getInstance();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: Binding(),
      navigatorKey: Constants.navigatorKey,
      title: Constants.appName,
      theme: getLightTheme(),
      darkTheme: getDarkTheme(),
      themeMode: ThemeViewModel().theme,
      translations: Translation(),
      locale: Locale('en'),
      fallbackLocale: Locale('ar'),
      initialRoute: '/',
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
