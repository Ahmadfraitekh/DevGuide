import 'dart:async';

import 'package:dev_guide/src/core/constants.dart';
import 'package:dev_guide/src/core/preferences.dart';
import 'package:dev_guide/src/core/routes_name.dart';
import 'package:dev_guide/src/presentation/resources/assets_manager.dart';
import 'package:dev_guide/src/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  startTime() async {
    var duration = const Duration(seconds: 2);
    return Timer(duration, _navigationPage);
  }

  void _navigationPage() async {
    Preference.load().then((value) {
      // Check if the user is logged in by user id
      if (value!.getString(Constants.userID) != null) {
        return Navigator.of(context)
            .pushNamedAndRemoveUntil(RoutesName.mainPage, (route) => false);
      } else {
        return Navigator.of(context)
            .pushNamedAndRemoveUntil(RoutesName.signin, (route) => false);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  void dispose() {
    super.dispose();
  }

  late var width;
  late ThemeData _theme;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    _theme = Theme.of(context);
    return Scaffold(
      backgroundColor: _theme.backgroundColor,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                ImageAssets.appLogo,
                width: width * 0.4,
              ),
              const SizedBox(
                height: AppSize.s14,
              ),
              Text(
                Constants.appName,
                style: _theme.textTheme.labelMedium,
              )
            ],
          ),
        ],
      ),
    );
  }
}
