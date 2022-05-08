import 'package:dev_guide/src/core/helper/local_storage_data.dart';
import 'package:dev_guide/src/domain/model/categories.dart';
import 'package:dev_guide/src/domain/viewmodel/auth_viewmodel/authentication.dart';
import 'package:dev_guide/src/domain/viewmodel/category_viewmodel/categories_viewmodel.dart';
import 'package:dev_guide/src/domain/viewmodel/main_viewmodel/main_viewmodel.dart';
import 'package:dev_guide/src/domain/viewmodel/profile_viewmodel/profile_viewmodel.dart';
import 'package:dev_guide/src/domain/viewmodel/slider_viewmodel/slider_viewmodel.dart';
import 'package:dev_guide/src/domain/viewmodel/splash_viewmodel/splash_viewmodel.dart';
import 'package:get/get.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Authentication>(() => Authentication());
    Get.put<MainViewModel>(MainViewModel());
    Get.put<SplashViewModel>(SplashViewModel());
    Get.put<SliderViewModel>(SliderViewModel());
    Get.put<CategoriesViewModel>(CategoriesViewModel());
    Get.put<LocalStorageData>(LocalStorageData());
    Get.lazyPut<ProfileViewModel>(() => ProfileViewModel());
  }
}
