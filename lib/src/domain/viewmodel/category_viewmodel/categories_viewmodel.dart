import 'package:dev_guide/src/core/helper/service/firestore_category.dart';
import 'package:dev_guide/src/domain/model/categories.dart';
import 'package:get/get.dart';

class CategoriesViewModel extends GetxController {
  static CategoriesViewModel instance = Get.find();
  List<CategoriesModel> _categoryModel = [];

  @override
  void onInit() {
    super.onInit();
    getCategory();
  }

  List<CategoriesModel> get categoryModel => _categoryModel;

  getCategory() async {
    await FireStoreCategories().getCategoryFromFirebase().then((value) {
      for (int i = 0; i < value.length; i++) {
        _categoryModel.add(
            CategoriesModel.fromJson(value[i].data() as Map<dynamic, dynamic>));
      }
      update();
    });
  }
}
