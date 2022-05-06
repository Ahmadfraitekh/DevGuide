import 'dart:async';

import 'package:dev_guide/src/core/constants.dart';
import 'package:dev_guide/src/core/preferences.dart';
import 'package:dev_guide/src/core/routes_name.dart';
import 'package:dev_guide/src/presentation/resources/assets_manager.dart';

import 'package:get/get.dart';

class SplashViewModel extends GetxController
    with GetSingleTickerProviderStateMixin {
  static SplashViewModel instance = Get.find();
  // FirebaseAuth _auth = FirebaseAuth.instance;

  _startTime() async {
    var duration = const Duration(seconds: 4);
    return Timer(duration, _navigationPage);
  }

  get startTime => _startTime();

  void _navigationPage() async {
    Preference.load().then((value) {
      // Check if the user is logged in by user id

      if (value!.getString(Constants.userID) != null) {
        Get.offNamedUntil(RoutesName.mainPage, (route) => false);
      } else {
        return Get.offNamedUntil(RoutesName.signin, (route) => false);
      }
    });
  }

  @override
  void onInit() async {
    super.onInit();
    startTime;
  }

  @override
  void onReady() {
    super.onReady();
  }
}
