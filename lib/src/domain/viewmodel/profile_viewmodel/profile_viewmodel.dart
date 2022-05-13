import 'package:dev_guide/src/core/constants.dart';
import 'package:dev_guide/src/core/helper/local_storage_data.dart';
import 'package:dev_guide/src/domain/model/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfileViewModel extends GetxController {
  final LocalStorageData localStorageData = Get.find();

  @override
  void onInit() {
    super.onInit();
    getCurrentUser();
    _saveSwitchThemeStatus(isSwitched);
    getLocale();
  }

  ProfileViewModel() {
    if (_getSwitchThemeStatus()) {
      isSwitched = _getSwitchThemeStatus();
      update();
    }
  }

  UserModel get userModel => _userModel;
  ValueNotifier<bool> get notUser => _notUser;

  ValueNotifier<bool> _notUser = ValueNotifier(false);
  late UserModel _userModel;
  var isLoading = false.obs;
  var isSwitched = false;
  final _storage = GetStorage();

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

  // Save isDarkMode to local storage
  _saveSwitchThemeStatus(bool isSwitch) =>
      _storage.write(Constants.SWITCH_KEY, isSwitch);

  // Load isDarkMode from local storage and if it's empty, return false (that means default theme is light)
  bool _getSwitchThemeStatus() =>
      _storage.read<bool>(Constants.SWITCH_KEY) ?? false;

  isSwitchedThemeState(var value) {
    isSwitched = value;
    _saveSwitchThemeStatus(isSwitched);
    update();
  }

  // Save the languages

  var savedLang = 'EN'.obs;

  saveLocale() {
    localStorageData.createString(Constants.LOCALE_LANG_KEY, savedLang.value);
  }

  Future<void> getLocale() async {
    localStorageData.readString(Constants.LOCALE_LANG_KEY).then((value) {
      if (value != '' && value != null) {
        Get.updateLocale(Locale(value.toString().toLowerCase()));
        savedLang = value.toString().obs;
        //update();
      }
    });
  }
}
