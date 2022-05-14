import 'package:dev_guide/src/core/helper/service/firestore_subCategory.dart';
import 'package:dev_guide/src/domain/model/subcategories.dart';
import 'package:get/get.dart';

class SubCategoriesViewModel extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getSubCategory();
  }

  static SubCategoriesViewModel instance = Get.find();

  List<SubCategoriesModel> _subCategoryModel = [];

  List<SubCategoriesModel> get subCategoryModel => _subCategoryModel;

  getSubCategory() async {
    await FireStoreSubCategories().getSubCategoryFromFirebase().then((value) {
      for (int i = 0; i < value.length; i++) {
        _subCategoryModel.add(SubCategoriesModel.fromJson(
            value[i].data() as Map<dynamic, dynamic>));

        //print(value[i]);
      }

      update();
    });
  }
}
