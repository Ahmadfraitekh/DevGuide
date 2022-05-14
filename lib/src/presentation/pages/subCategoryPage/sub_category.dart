import 'package:dev_guide/src/core/routes_name.dart';
import 'package:dev_guide/src/domain/model/categories.dart';
import 'package:dev_guide/src/domain/model/subcategories.dart';
import 'package:dev_guide/src/domain/viewmodel/sub_category_viewmodel/sub_category_viewmodel.dart';
import 'package:dev_guide/src/presentation/resources/color_manager.dart';
import 'package:dev_guide/src/presentation/resources/styles_manager.dart';
import 'package:dev_guide/src/presentation/resources/values_manager.dart';
import 'package:dev_guide/src/presentation/widget/back_icon.dart';
import 'package:dev_guide/src/presentation/widget/image_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubCategroyPage extends StatelessWidget {
  SubCategroyPage({Key? key, required this.category}) : super(key: key);

  final CategoriesModel category;

  // final List<Map> _subCategoryDemoData = [
  //   {1
  //     "name": "Front-End",
  //     "image":
  //         "https://cdn.icon-icons.com/icons2/1859/PNG/512/codinghtml_117947.png",
  //     "state": ""
  //   },
  //   {2
  //     "name": "Flutter",
  //     "image": "https://img.icons8.com/material/344/flutter.png",
  //     "state": "Upcoming"
  //   },
  //   {3
  //     "name": "Back-End",
  //     "image": "https://img.icons8.com/color/344/backend-development.png",
  //     "state": "Upcoming"
  //   },
  //   {4
  //     "name": "Angular",
  //     "image": "https://img.icons8.com/ios-filled/2x/angularjs.png",
  //     "state": "Upcoming"
  //   },
  //   {5
  //     "name": "Android",
  //     "image": "https://img.icons8.com/ios-filled/2x/android-os.png",
  //     "state": "Upcoming"
  //   },
  //   {6
  //     "name": "React js",
  //     "image": "https://img.icons8.com/ios/2x/react-native.png",
  //     "state": "Upcoming"
  //   },
  //   {7
  //     "name": "Database",
  //     "image": "https://img.icons8.com/ios-filled/2x/database.png",
  //     "state": "Upcoming"
  //   },
  //   {8
  //     "name": "IOS",
  //     "image": "https://img.icons8.com/ios-glyphs/2x/mac-client.png",
  //     "state": "Upcoming"
  //   },
  // ];
  late ThemeData _theme;

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    _theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: AppSize.s16,
            ),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(
                    AppPadding.p8,
                  ),
                  child: BackIcon(),
                ),
                Padding(
                  padding: const EdgeInsets.all(AppSize.s18),
                  child: Text(
                    category.name!,
                    style: _theme.textTheme.labelMedium,
                  ),
                ),
              ],
            ),
            _subCategoryView(),
          ],
        ),
      ),
    );
  }

  Widget _subCategoryView() {
    return GetBuilder<SubCategoriesViewModel>(
      init: SubCategoriesViewModel(),
      builder: (ctr) => Expanded(
        child: ListView.builder(
          itemBuilder: (context, index) => _subCategoryItemView(
            ctr.subCategoryModel[index],
          ),
          itemCount: ctr.subCategoryModel.length,
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
        ),
      ),
    );
  }

  Widget _subCategoryItemView(
    SubCategoriesModel subCategoriesModel,
  ) {
    return GetBuilder<SubCategoriesViewModel>(
        init: SubCategoriesViewModel(),
        builder: (ctr) => InkWell(
              onTap: () {
                if (subCategoriesModel.state.toString().isEmpty) {
                  // Navigator.pushNamed(context, RoutesName.courses,
                  //     arguments: {"subCategory": subCategoryDemoData});
                  Get.toNamed(RoutesName.courses,
                      arguments: {"subCategory": subCategoriesModel});
                }
              },
              child: ListTile(
                leading: ImageView(
                  url: subCategoriesModel.image,
                  width: AppSize.s28,
                  height: AppSize.s28,
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        subCategoriesModel.name!,
                        style: _theme.textTheme.caption,
                      ),
                    ),
                    const SizedBox(
                      width: AppSize.s8,
                    ),
                    Text(
                      subCategoriesModel.state!,
                      style: getLightStyle(
                        color: ColorManager.grey,
                      ),
                    ),
                  ],
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: ColorManager.primary,
                ),
              ),
            ));
  }
}
