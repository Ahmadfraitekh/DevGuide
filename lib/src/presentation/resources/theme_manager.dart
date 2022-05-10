import 'package:dev_guide/src/presentation/resources/color_manager.dart';
import 'package:dev_guide/src/presentation/resources/font_manager.dart';
import 'package:dev_guide/src/presentation/resources/styles_manager.dart';
import 'package:dev_guide/src/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

ThemeData getLightTheme() {
  return ThemeData(
    // Main colors of the app

    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.primary,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grey1,
    scaffoldBackgroundColor: ColorManager.scaffoldBackgroundColor,
    backgroundColor: ColorManager.background,
    iconTheme: IconThemeData(
      color: ColorManager.primary,
      size: AppSize.s28,
    ),

    //Ripple color
    splashColor: ColorManager.primary,

    //CardView theme
    cardTheme: CardTheme(
      color: ColorManager.scaffoldBackgroundColor,
      shadowColor: ColorManager.grey,
      elevation: AppSize.s4,
    ),

    //Bottom NavigationBarTheme
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorManager.secondary,
      selectedItemColor: ColorManager.white,
      unselectedItemColor: ColorManager.lightGrey,
    ),

    //AppBar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.primary,
      elevation: AppSize.s4,
      toolbarHeight: AppSize.s90,
      iconTheme: const IconThemeData(
        size: AppSize.s28,
      ),
      titleTextStyle:
          getRegularStyle(color: ColorManager.white, fontSize: FontSize.s12),
    ),

    //Button Theme
    buttonTheme: ButtonThemeData(
      shape: const StadiumBorder(),
      disabledColor: ColorManager.grey1,
      buttonColor: ColorManager.primary,
      splashColor: ColorManager.primary,
    ),

    // Elevated Button Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getRegularStyle(
          color: ColorManager.white,
        ),
        primary: ColorManager.secondary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s12),
        ),
      ),
    ),

    //Text Theme
    textTheme: TextTheme(
      headline1: getSemiBoldStyle(
        color: ColorManager.secondary,
        fontSize: FontSize.s16,
      ),
      headline2: getRegularStyle(
        color: ColorManager.black,
        fontSize: FontSize.s16,
      ),
      headline3: getBoldStyle(
        color: ColorManager.primary,
        fontSize: FontSize.s16,
      ),
      headline4: getRegularStyle(
        color: ColorManager.primary,
        fontSize: FontSize.s14,
      ),
      headline5: getRegularStyle(
        color: ColorManager.primary,
        fontSize: FontSize.s40,
      ),
      subtitle1: getMediumStyle(
        color: ColorManager.white,
        fontSize: AppSize.s14,
      ),
      subtitle2: getMediumStyle(
        color: ColorManager.primary,
        fontSize: AppSize.s14,
      ),
      labelMedium: getBoldStyle(
        color: ColorManager.primary,
        fontSize: FontSize.s30,
      ),
      bodyText2: getMediumStyle(color: ColorManager.black),
      caption: getRegularStyle(
          color: ColorManager.secondary, fontSize: FontSize.s12),
      bodyText1:
          getRegularStyle(color: ColorManager.black, fontSize: FontSize.s12),
    ),

    //Input decoration theme (TextFormField)

    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(AppPadding.p8),
      fillColor: ColorManager.white,
      prefixStyle: getMediumStyle(
        color: ColorManager.darkGrey,
        fontSize: FontSize.s12,
      ),

      // Hint style
      hintStyle: getMediumStyle(
        color: ColorManager.primary,
        fontSize: FontSize.s12,
      ),

      //Label style
      labelStyle: getMediumStyle(
        color: ColorManager.primary,
        fontSize: FontSize.s12,
      ),

      //Error style
      errorStyle: getRegularStyle(
        color: ColorManager.error,
        fontSize: FontSize.s12,
      ),
      // // enabled border
      // enabledBorder: OutlineInputBorder(
      //     borderSide:
      //         BorderSide(color: ColorManager.grey, width: AppSize.s1_5),
      //     borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
      //
      // // focused border
      // focusedBorder: OutlineInputBorder(
      //     borderSide:
      //         BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
      //     borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
      //
      // // error border
      // errorBorder: OutlineInputBorder(
      //     borderSide:
      //         BorderSide(color: ColorManager.error, width: AppSize.s1_5),
      //     borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
      // // focused error border
      // focusedErrorBorder: OutlineInputBorder(
      //     borderSide:
      //         BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
      //     borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),

      border: InputBorder.none,
    ),

    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: ColorManager.grey,
    ),
  );
}

ThemeData getDarkTheme() {
  return ThemeData(
    // Main colors of the app

    primaryColor: ColorManager.primary,
    // primaryColorLight: ColorManager.primary,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grey1,
    scaffoldBackgroundColor: ColorManager.scaffoldBackgroundColorDark,
    backgroundColor: ColorManager.background,
    iconTheme: IconThemeData(
      color: ColorManager.primary,
      size: AppSize.s28,
    ),

    //Ripple color
    splashColor: ColorManager.primary,

    //CardView theme
    cardTheme: CardTheme(
      color: ColorManager.scaffoldBackgroundColorDark,
      shadowColor: ColorManager.grey,
      elevation: AppSize.s4,
    ),

    //Bottom NavigationBarTheme
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorManager.secondary,
      selectedItemColor: ColorManager.white,
      unselectedItemColor: ColorManager.lightGrey,
    ),

    //AppBar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.primary,
      elevation: AppSize.s4,
      toolbarHeight: AppSize.s90,
      iconTheme: const IconThemeData(
        size: AppSize.s28,
      ),
      titleTextStyle:
          getRegularStyle(color: ColorManager.white, fontSize: FontSize.s12),
    ),

    //Button Theme
    buttonTheme: ButtonThemeData(
      shape: const StadiumBorder(),
      disabledColor: ColorManager.grey1,
      buttonColor: ColorManager.primary,
      splashColor: ColorManager.primary,
    ),

    // Elevated Button Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getRegularStyle(
          color: ColorManager.white,
        ),
        primary: ColorManager.secondary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s12),
        ),
      ),
    ),

    //Text Theme
    textTheme: TextTheme(
      headline1: getSemiBoldStyle(
        color: ColorManager.secondary,
        fontSize: FontSize.s16,
      ),
      headline2: getRegularStyle(
        color: ColorManager.black,
        fontSize: FontSize.s16,
      ),
      headline3: getBoldStyle(
        color: ColorManager.primary,
        fontSize: FontSize.s16,
      ),
      headline4: getRegularStyle(
        color: ColorManager.primary,
        fontSize: FontSize.s14,
      ),
      headline5: getRegularStyle(
        color: ColorManager.primary,
        fontSize: FontSize.s40,
      ),
      subtitle1: getMediumStyle(
        color: ColorManager.white,
        fontSize: AppSize.s14,
      ),
      subtitle2: getMediumStyle(
        color: ColorManager.primary,
        fontSize: AppSize.s14,
      ),
      labelMedium: getBoldStyle(
        color: ColorManager.primary,
        fontSize: FontSize.s30,
      ),
      bodyText2: getMediumStyle(color: ColorManager.black),
      caption: getRegularStyle(
          color: ColorManager.secondary, fontSize: FontSize.s12),
      bodyText1:
          getRegularStyle(color: ColorManager.black, fontSize: FontSize.s12),
    ),

    //Input decoration theme (TextFormField)

    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(AppPadding.p8),
      fillColor: ColorManager.white,
      prefixStyle: getMediumStyle(
        color: ColorManager.darkGrey,
        fontSize: FontSize.s12,
      ),

      // Hint style
      hintStyle: getMediumStyle(
        color: ColorManager.primary,
        fontSize: FontSize.s12,
      ),

      //Label style
      labelStyle: getMediumStyle(
        color: ColorManager.primary,
        fontSize: FontSize.s12,
      ),

      //Error style
      errorStyle: getRegularStyle(
        color: ColorManager.error,
        fontSize: FontSize.s12,
      ),
      // // enabled border
      // enabledBorder: OutlineInputBorder(
      //     borderSide:
      //         BorderSide(color: ColorManager.grey, width: AppSize.s1_5),
      //     borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
      //
      // // focused border
      // focusedBorder: OutlineInputBorder(
      //     borderSide:
      //         BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
      //     borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
      //
      // // error border
      // errorBorder: OutlineInputBorder(
      //     borderSide:
      //         BorderSide(color: ColorManager.error, width: AppSize.s1_5),
      //     borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
      // // focused error border
      // focusedErrorBorder: OutlineInputBorder(
      //     borderSide:
      //         BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
      //     borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),

      border: InputBorder.none,
    ),

    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: ColorManager.grey,
    ),
  );
}
