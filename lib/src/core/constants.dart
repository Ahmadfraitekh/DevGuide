import 'package:flutter/material.dart';

abstract class Constants {
  // Application Name
  static const String appName = 'DevGuide';

  //Navigator Key
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  // Database References
  // static const String userID = 'userId';
  // static const String userToken = 'userToken';

  // static const userName = 'userName';
  // static const userPhoto = 'userPhoto';
  // static const userEmail = 'userEmail';
  // static const userPhone = 'userPhone';
  // static const loginBySocialMedia = 'loginBySocialMedia';

  static const CACHED_USER_DATA = 'CACHED_USER_DATA';
  static const DARK_THEME_KEY = 'isDarkMode';
  static const SWITCH_KEY = 'isSwitched';
  static const LOCALE_LANG_KEY = 'locale';
}
