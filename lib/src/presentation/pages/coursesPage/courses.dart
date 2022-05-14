import 'package:dev_guide/src/core/routes_name.dart';
import 'package:dev_guide/src/domain/model/subcategories.dart';
import 'package:dev_guide/src/presentation/resources/color_manager.dart';
import 'package:dev_guide/src/presentation/resources/styles_manager.dart';
import 'package:dev_guide/src/presentation/resources/values_manager.dart';
import 'package:dev_guide/src/presentation/widget/back_icon.dart';
import 'package:dev_guide/src/presentation/widget/image_view.dart';
import 'package:flutter/material.dart';

class CoursesPage extends StatefulWidget {
  CoursesPage({Key? key, required this.subCategories}) : super(key: key);
  final SubCategoriesModel subCategories;

  @override
  State<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  // ignore: unused_field
  late double _width;
  late ThemeData _theme;

  final List<Map> _coursesDemoData = [
    {
      "name": "Html",
      "image": "https://img.icons8.com/ios-filled/2x/html-5.png",
      "state": ""
    },
    {
      "name": "CSS",
      "image": "https://img.icons8.com/ios-filled/2x/css3.png",
      "state": "Upcoming"
    },
    {
      "name": "JavaScript",
      "image": "https://img.icons8.com/ios-filled/2x/javascript-logo.png",
      "state": "Upcoming"
    },
    {
      "name": "Boostrap",
      "image":
          "https://img.icons8.com/external-tal-revivo-bold-tal-revivo/2x/external-bootstrap-a-free-and-open-source-css-framework-logo-bold-tal-revivo.png",
      "state": "Upcoming"
    },
    {
      "name": "SASS",
      "image": "https://img.icons8.com/ios-filled/2x/sass.png",
      "state": "Upcoming"
    },
    {
      "name": "Version Control Systemes",
      "image": "https://img.icons8.com/ios-filled/2x/git.png",
      "state": "Upcoming"
    },
  ];
  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
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
                padding: EdgeInsets.all(AppPadding.p8),
                child: BackIcon(),
              ),
              Padding(
                padding: EdgeInsets.all(AppPadding.p12),
                child: Text(
                  widget.subCategories.name!,
                  style: _theme.textTheme.labelMedium,
                ),
              )
            ],
          ),
          _coursesView(),
        ],
      )),
    );
  }

  Widget _coursesView() {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) =>
            _coursesItemView(_coursesDemoData[index]),
        itemCount: _coursesDemoData.length,
      ),
    );
  }

  Widget _coursesItemView(Map coursesDemoData) {
    return InkWell(
      onTap: () {
        if (coursesDemoData["state"].toString().isEmpty) {
          Navigator.pushNamed(
            context,
            RoutesName.course,
            arguments: {
              "course": {
                "name": "HTML",
                "image":
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4iodUjOkdyguyYH3m8V-csm774JJwSpbomA&usqp=CAU",
                "desc":
                    "HTML (HyperText Markup Language) is the most basic building block of the Web. It defines the meaning and structure of web content. Other technologies besides HTML are generally used to describe a web page's",
                "courses": [
                  {
                    "name": "HTML5 tutorial in Arabic",
                    "link":
                        "https://www.youtube.com/playlist?list=PLMTdZ61eBnyrnapIyOphXAkIcR5DDOGkz",
                    "desc": "",
                  },
                  {
                    "name": "Learn HTML in Arabic 2021",
                    "link":
                        "https://www.youtube.com/playlist?list=PLDoPjvoNmBAw_t_XWUFbBX-c9MafPk9ji",
                    "desc": ""
                  },
                ],
              },
            },
          );
        }
      },
      child: ListTile(
        leading: ImageView(
          url: coursesDemoData["image"],
          width: AppSize.s28,
          height: AppSize.s28,
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                coursesDemoData["name"],
                style: _theme.textTheme.caption,
              ),
            ),
            const SizedBox(
              width: AppSize.s8,
            ),
            Text(
              coursesDemoData["state"],
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
}
