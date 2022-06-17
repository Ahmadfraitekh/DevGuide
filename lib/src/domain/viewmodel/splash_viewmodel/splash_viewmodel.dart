import 'dart:async';

import 'package:dev_guide/src/core/helper/local_storage_data.dart';
import 'package:dev_guide/src/core/routes_name.dart';

import 'package:get/get.dart';

class SplashViewModel extends GetxController
    with GetSingleTickerProviderStateMixin {
  static SplashViewModel instance = Get.find();
  final LocalStorageData localStorageData = Get.find();

  _startTime() async {
    var duration = const Duration(seconds: 4);
    return Timer(duration, _navigationPage);
  }

  get startTime => _startTime();

  void _navigationPage() async {
    // Checked if the user is logged in or not
    // if the user is already is logged in the application will take him/her to the main page dirctly
    // if not it will take him/her to the login page
    if (localStorageData != null) {
      localStorageData.getUser!.then((value) {
        if (value?.userId == null) {
          Get.offNamedUntil(RoutesName.signin, (route) => false);
        } else {
          return Get.offNamedUntil(RoutesName.mainPage, (route) => false);
        }
      });
    }
    return Get.offNamedUntil(RoutesName.mainPage, (route) => false);
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
