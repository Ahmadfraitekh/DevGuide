import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dev_guide/src/core/routes_name.dart';
import 'package:dev_guide/src/domain/model/course.dart';
import 'package:dev_guide/src/domain/viewmodel/course_viewmodel/course_viewmodel.dart';
import 'package:dev_guide/src/presentation/resources/assets_manager.dart';
import 'package:dev_guide/src/presentation/resources/color_manager.dart';
import 'package:dev_guide/src/presentation/resources/styles_manager.dart';
import 'package:dev_guide/src/presentation/resources/values_manager.dart';
import 'package:dev_guide/src/presentation/widget/image_view.dart';
import 'package:dev_guide/src/presentation/widget/rounded_input_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class SearchPage extends StatefulWidget {
  SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _searchController = TextEditingController();

  late ThemeData _theme;

  late QuerySnapshot snapShotData;

  bool isExcecuted = false;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);
    return Scaffold(
      body: GetBuilder<CourseViewModel>(
        init: CourseViewModel(),
        builder: (ctr) => SingleChildScrollView(
          child: Column(
            children: [
              _searchBar(),
              Divider(
                indent: 10.0,
                endIndent: 10.0,
                thickness: 0.3,
                color: ColorManager.secondary,
              ),
              SizedBox(
                height: AppSize.s16,
              ),
              _coursesView(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _searchBar() {
    return GetBuilder<CourseViewModel>(
      init: CourseViewModel(),
      builder: (ctr) => RoundedInputField(
        controller: _searchController,
        icon: Icons.search_outlined,
        hintText: 'Search',
        onFieldSubmitted: (name) {
          ctr.getSearch(_searchController.text).then((value) {
            snapShotData = value;
            setState(() {
              isExcecuted = true;
            });
          });
        },
      ),
    );
  }

  Widget _coursesView() {
    return GetBuilder<CourseViewModel>(
      init: CourseViewModel(),
      builder: (ctr) {
        return isExcecuted
            ? ListView.builder(
                itemBuilder: (context, index) =>
                    _courseItemView(ctr.courseModel[index]),
                itemCount: snapShotData.docs.length,
                shrinkWrap: true,
              )
            : Padding(
                padding: const EdgeInsets.only(top: AppPadding.p30),
                child: Column(
                  children: [
                    Image.asset(ImageAssets.searchLogo),
                    const SizedBox(
                      height: AppSize.s20,
                    ),
                    Text(
                      'Discover Courses',
                      style: _theme.textTheme.headline1,
                    ),
                    const SizedBox(
                      height: AppSize.s14,
                    ),
                    Text(
                      'Try discovering new courses with search or browse our categories',
                      style: _theme.textTheme.headline1,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
      },
    );
  }

  Widget _courseItemView(CourseModel course) {
    return GetBuilder<CourseViewModel>(
      init: CourseViewModel(),
      builder: (ctr) => InkWell(
        onTap: () {
          if (course.state!.isEmpty) {
            Get.toNamed(RoutesName.course, arguments: {"course": course});
          }
        },
        child: ListTile(
          leading: ImageView(
            url: course.image,
            width: AppSize.s28,
            height: AppSize.s28,
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  course.name!,
                  style: _theme.textTheme.caption,
                ),
              ),
              const SizedBox(
                width: AppSize.s8,
              ),
              Text(
                course.state!,
                style: getLightStyle(
                  color: ColorManager.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
