import 'package:dev_guide/src/core/helper/local_storage_data.dart';
import 'package:dev_guide/src/domain/model/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfileViewModel extends GetxController {
  final LocalStorageData localStorageData = Get.find();

  @override
  void onInit() {
    super.onInit();
    getCurrentUser();
  }

  UserModel get userModel => _userModel;
  ValueNotifier<bool> get notUser => _notUser;

  ValueNotifier<bool> _notUser = ValueNotifier(false);
  late UserModel _userModel;
  var isLoading = false.obs;
  var isDark = false.obs;

  Future<void> signOut() async {
    GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();

    localStorageData.deleteUser();
  }

  void getCurrentUser() async {
    _notUser.value = true;
    await localStorageData.getUser.then((value) {
      _userModel = value!;
    });
    _notUser.value = false;
    update();
  }

  void isLoadingState() async {
    isLoading.value = true;
    await Future.delayed(Duration(seconds: 2));
    isLoading.value = false;
  }

  // void getTheme() async {
  //   //isDark = true.obs;
  //   await localStorageData.getTheme;
  //   //isDark = false.obs;
  // }

  // void saveTheme() async {
  //   await localStorageData.saveTheme;
  // }

  void changeTheme(isDarkStatus) {
    if (isDarkStatus == true) {
      isDark = true.obs;
      Get.changeThemeMode(ThemeMode.dark);
    } else {
      isDark = false.obs;
      Get.changeThemeMode(ThemeMode.light);
    }
    localStorageData.saveTheme;
  }
}
