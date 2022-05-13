import 'package:dev_guide/src/core/routes_name.dart';
import 'package:dev_guide/src/domain/model/categories.dart';
import 'package:dev_guide/src/presentation/resources/color_manager.dart';
import 'package:dev_guide/src/presentation/resources/styles_manager.dart';
import 'package:dev_guide/src/presentation/resources/values_manager.dart';
import 'package:dev_guide/src/presentation/widget/back_icon.dart';
import 'package:dev_guide/src/presentation/widget/image_view.dart';
import 'package:flutter/material.dart';

class SubCategroyPage extends StatefulWidget {
  const SubCategroyPage({Key? key, required this.category}) : super(key: key);

  final CategoriesModel category;

  @override
  State<SubCategroyPage> createState() => _SubCategroyPage();
}

class _SubCategroyPage extends State<SubCategroyPage>
    with AutomaticKeepAliveClientMixin {
  late ThemeData _theme;

  final List<Map> _subCategoryDemoData = [
    {
      "name": "Front-End",
      "image":
          "https://cdn.icon-icons.com/icons2/1859/PNG/512/codinghtml_117947.png",
      "state": ""
    },
    {
      "name": "Flutter",
      "image": "https://img.icons8.com/material/344/flutter.png",
      "state": "Upcoming"
    },
    {
      "name": "Back-End",
      "image": "https://img.icons8.com/color/344/backend-development.png",
      "state": "Upcoming"
    },
    {
      "name": "Angular",
      "image": "https://img.icons8.com/ios-filled/2x/angularjs.png",
      "state": "Upcoming"
    },
    {
      "name": "Android",
      "image": "https://img.icons8.com/ios-filled/2x/android-os.png",
      "state": "Upcoming"
    },
    {
      "name": "React js",
      "image": "https://img.icons8.com/ios/2x/react-native.png",
      "state": "Upcoming"
    },
    {
      "name": "Database",
      "image": "https://img.icons8.com/ios-filled/2x/database.png",
      "state": "Upcoming"
    },
    {
      "name": "IOS",
      "image": "https://img.icons8.com/ios-glyphs/2x/mac-client.png",
      "state": "Upcoming"
    },
  ];

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
                    widget.category.name!,
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
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) => _subCategoryItemView(
          _subCategoryDemoData[index],
        ),
        itemCount: _subCategoryDemoData.length,
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
      ),
    );
  }

  Widget _subCategoryItemView(
    Map subCategoryDemoData,
  ) {
    return InkWell(
      onTap: () {
        if (subCategoryDemoData["state"].toString().isEmpty) {
          Navigator.pushNamed(context, RoutesName.courses,
              arguments: {"subCategory": subCategoryDemoData});
        }
      },
      child: ListTile(
        leading: ImageView(
          url: subCategoryDemoData["image"],
          width: AppSize.s28,
          height: AppSize.s28,
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                subCategoryDemoData["name"],
                style: _theme.textTheme.caption,
              ),
            ),
            const SizedBox(
              width: AppSize.s8,
            ),
            Text(
              subCategoryDemoData["state"],
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
    );
  }

  @override
  bool get wantKeepAlive => true;
}
