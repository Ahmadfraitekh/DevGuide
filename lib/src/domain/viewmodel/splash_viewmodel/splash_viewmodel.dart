import 'dart:async';

import 'package:dev_guide/src/core/constants.dart';
import 'package:dev_guide/src/core/preferences.dart';
import 'package:dev_guide/src/core/routes_name.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:get/get.dart';

class SplashViewModel extends GetxController {
  static SplashViewModel instance = Get.find();

  // todo: How to checked if the user logged in or not from splach screen
  // todo: if the user is not logged in so it will open the login page after splash screen
  // todo: and if the user is already logged in it will open the home page after splash screen
  // todo: https://www.youtube.com/watch?v=j5UQ2yaAJn0&list=PLV1fXIAyjeuZ2pOUkmHwzMJCJgCedrQJW&index=10

  // late Rx<User?> _user;

  _startTime() async {
    var duration = const Duration(seconds: 2);
    return Timer(duration, _navigationPage);
  }

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
    _startTime();
  }

  @override
  void onReady() {
    super.onReady();
  }
}
