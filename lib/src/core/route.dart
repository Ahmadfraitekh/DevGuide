import 'package:dev_guide/src/core/routes_name.dart';

import 'package:dev_guide/src/presentation/pages/Sign%20In/sign_in.dart';
import 'package:dev_guide/src/presentation/pages/Sign%20Up/sign_up.dart';
import 'package:dev_guide/src/presentation/pages/coursePage/course.dart';
import 'package:dev_guide/src/presentation/pages/coursesPage/courses.dart';
import 'package:dev_guide/src/presentation/pages/mainPage/main_page.dart';
import 'package:dev_guide/src/presentation/pages/profilePage/profile.dart';
import 'package:dev_guide/src/presentation/pages/splash/splash.dart';
import 'package:dev_guide/src/presentation/pages/subCategoryPage/sub_category.dart';
import 'package:dev_guide/src/presentation/pages/webView/web_view.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    ScaleTransition transitionBuilder(
        context, animation, secondaryAnimation, child) {
      return ScaleTransition(
        scale: Tween<double>(
          begin: 0.0,
          end: 1.0,
        ).animate(
          CurvedAnimation(
              parent: animation, curve: Curves.fastLinearToSlowEaseIn),
        ),
        child: child,
      );
    }

    switch (settings.name) {
      case RoutesName.splash:
        return PageRouteBuilder<dynamic>(
          pageBuilder: (context, Animation<double> a1, Animation<double> a2) =>
              SplashPage(),
        );
      case RoutesName.signin:
        return PageRouteBuilder<dynamic>(
          pageBuilder: (context, Animation<double> a1, Animation<double> a2) =>
              SigninPage(),
        );
      case RoutesName.signup:
        return PageRouteBuilder<dynamic>(
          pageBuilder: (_, Animation<double> a1, Animation<double> a2) =>
              SignUpPage(),
        );
      case RoutesName.mainPage:
        return PageRouteBuilder<dynamic>(
          pageBuilder: (_, Animation<double> a1, Animation<double> a2) =>
              MainPage(),
        );
      case RoutesName.subCategory:
        final args = settings.arguments as Map;
        return PageRouteBuilder<dynamic>(
          pageBuilder: (_, Animation<double> a1, Animation<double> a2) =>
              SubCategroyPage(
            category: args["category"],
          ),
        );
      case RoutesName.courses:
        final args = settings.arguments as Map;
        return PageRouteBuilder<dynamic>(
          pageBuilder: (_, Animation<double> a1, Animation<double> a2) =>
              CoursesPage(
            subCategories: args["subCategory"],
          ),
        );
      case RoutesName.course:
        final args = settings.arguments as Map;
        return PageRouteBuilder<dynamic>(
          pageBuilder: (_, Animation<double> a1, Animation<double> a2) =>
              CoursePage(
            courses: args["course"],
          ),
        );
      case RoutesName.webView:
        final args = settings.arguments as Map;
        return PageRouteBuilder<dynamic>(
          pageBuilder: (_, Animation<double> a1, Animation<double> a2) =>
              WebLinkView(
            link: args["link"],
          ),
        );
      case RoutesName.profile:
        return PageRouteBuilder<dynamic>(
          pageBuilder: (_, Animation<double> a1, Animation<double> a2) =>
              ProfilePage(),
        );

      default:
        return PageRouteBuilder<dynamic>(
          pageBuilder: (_, Animation<double> a1, Animation<double> a2) =>
              MainPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return transitionBuilder(
                context, animation, secondaryAnimation, child);
          },
        );
    }
  }
}
