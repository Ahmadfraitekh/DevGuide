import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:dev_guide/src/core/constants.dart';
import 'package:dev_guide/src/domain/viewmodel/splash_viewmodel/splash_viewmodel.dart';
import 'package:dev_guide/src/presentation/resources/assets_manager.dart';
import 'package:dev_guide/src/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class SplashPage extends GetView<SplashViewModel> {
  SplashPage({Key? key}) : super(key: key);

  var initial = SplashViewModel.instance.onInit();

  late ThemeData _theme;
  late double width;
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
