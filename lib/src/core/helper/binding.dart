import 'package:dev_guide/src/core/helper/local_storage_data.dart';

import 'package:dev_guide/src/domain/viewmodel/auth_viewmodel/authentication.dart';
import 'package:dev_guide/src/domain/viewmodel/category_viewmodel/categories_viewmodel.dart';
import 'package:dev_guide/src/domain/viewmodel/course_details_viewmodel/course_details_viewmodel.dart';
import 'package:dev_guide/src/domain/viewmodel/course_viewmodel/course_viewmodel.dart';
import 'package:dev_guide/src/domain/viewmodel/home_viewmodel/home_viewmodel.dart';
import 'package:dev_guide/src/domain/viewmodel/main_viewmodel/main_viewmodel.dart';
import 'package:dev_guide/src/domain/viewmodel/profile_viewmodel/profile_viewmodel.dart';
import 'package:dev_guide/src/domain/viewmodel/slider_viewmodel/slider_viewmodel.dart';
import 'package:dev_guide/src/domain/viewmodel/splash_viewmodel/splash_viewmodel.dart';
import 'package:dev_guide/src/domain/viewmodel/sub_category_viewmodel/sub_category_viewmodel.dart';
import 'package:get/get.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Authentication>(() => Authentication());
    Get.put<MainViewModel>(MainViewModel());
    Get.put<HomeViewModel>(HomeViewModel());
    Get.lazyPut<SplashViewModel>(() => SplashViewModel());
    Get.put<SliderViewModel>(SliderViewModel());
    Get.put<CategoriesViewModel>(CategoriesViewModel());
    Get.put<SubCategoriesViewModel>(SubCategoriesViewModel());
    Get.put<LocalStorageData>(LocalStorageData());
    Get.put<CourseViewModel>(CourseViewModel());
    Get.put<CourseDetailsViewModel>(CourseDetailsViewModel());
    Get.lazyPut<ProfileViewModel>(() => ProfileViewModel());
  }
}
