import 'package:flutter/material.dart';

abstract class Constants {
  // Application Name
  static const String appName = 'DevGuide';

  //TextFormField Text
  static const String fullName = "Full Name";
  static const String email = "Email";
  static const String password = "Password";

  //Button Text
  static const String singIn = "Sign In";
  static const String singUp = "Sign Up";
  static const String explore = "Explore";

  //Normal Text
  static const String dontHaveAnAccount = "Dont't have an account?";
  static const String alreadyHaveAnAccount = "Already have an account?";

  //Error Required Text
  static const String fullNameRequired = "Your name is required";
  static const String emailRequired = "Email is required";
  static const String passwordRequired = "Password is required";
  static const String invalidEmail = "Invalid Email Address";

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
}
