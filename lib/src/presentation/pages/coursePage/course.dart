import 'package:dev_guide/src/core/routes_name.dart';
import 'package:dev_guide/src/domain/model/course.dart';
import 'package:dev_guide/src/domain/viewmodel/course_details_viewmodel/course_details_viewmodel.dart';
import 'package:dev_guide/src/presentation/resources/color_manager.dart';
import 'package:dev_guide/src/presentation/resources/values_manager.dart';
import 'package:dev_guide/src/presentation/widget/back_icon.dart';
import 'package:dev_guide/src/presentation/widget/image_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({Key? key, required this.courses}) : super(key: key);
  final CourseModel courses;

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage>
    with AutomaticKeepAliveClientMixin {
  late ThemeData _theme;
  late double _width;
  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    _theme = Theme.of(context);
    _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
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
                      widget.courses.name!,
                      style: _theme.textTheme.labelMedium,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: AppSize.s28,
              ),
              _courseDetails(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _courseDetails() {
    return GetBuilder<CourseDetailsViewModel>(
      init: CourseDetailsViewModel(),
      builder: (ctr) => Column(
        children: [
          Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
              ),
              margin: const EdgeInsets.only(
                left: AppMargin.m20,
                right: AppMargin.m20,
              ),
              child: ImageView(
                url: widget.courses.image,
                height: AppSize.s140,
                width: _width,
              ),
            ),
          ),
          const SizedBox(
            height: AppSize.s20,
          ),
          Padding(
            padding: EdgeInsets.all(AppPadding.p12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "description".tr,
                  style: _theme.textTheme.headline3,
                ),
                GestureDetector(
                  onTap: () => ctr.getFavToList(),
                  child: ctr.isFav
                      ? Icon(
                          Icons.favorite,
                          color: ColorManager.error,
                        )
                      : Icon(
                          Icons.favorite_outline,
                          color: ColorManager.secondary,
                        ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(AppPadding.p8),
            child: Text(
              widget.courses.desc!,
              style: _theme.textTheme.caption,
            ),
          ),
          _courses(),
        ],
      ),
    );
  }

  Widget _courses() {
    List courses = widget.courses.courses!;

    return GetBuilder<CourseDetailsViewModel>(
      init: CourseDetailsViewModel(),
      builder: (ctr) => Padding(
        padding: EdgeInsets.all(AppPadding.p12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "courses".tr,
              style: _theme.textTheme.headline3,
            ),
            ListView.builder(
              itemBuilder: (context, index) => _courseView(courses[index]),
              itemCount: courses.length,
              shrinkWrap: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _courseView(courses) {
    return GetBuilder<CourseDetailsViewModel>(
      init: CourseDetailsViewModel(),
      builder: (ctr) => InkWell(
        onTap: () {
          Navigator.pushNamed(context, RoutesName.webView,
              arguments: {"link": courses["link"]});
        },
        child: Container(
          decoration: BoxDecoration(
            color: ColorManager.background,
            borderRadius: BorderRadius.circular(20.0),
          ),
          padding: const EdgeInsets.all(AppPadding.p8),
          margin: const EdgeInsets.all(AppMargin.m8),
          child: ListTile(
            leading: Icon(
              Icons.video_collection,
              color: ColorManager.primary,
            ),
            title: Text(
              courses["name"],
              style: TextStyle(
                color: ColorManager.secondary,
              ),
            ),
            trailing: Text(
              "view".tr,
              style: _theme.textTheme.headline3,
            ),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
