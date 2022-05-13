import 'package:dev_guide/src/core/routes_name.dart';
import 'package:dev_guide/src/domain/viewmodel/main_viewmodel/main_viewmodel.dart';
import 'package:flutter/material.dart';

import 'package:dev_guide/src/core/constants.dart';

import 'package:dev_guide/src/presentation/resources/assets_manager.dart';

import 'package:dev_guide/src/presentation/resources/color_manager.dart';
import 'package:dev_guide/src/presentation/resources/values_manager.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class MainPage extends GetWidget<MainViewModel> {
  MainPage({Key? key}) : super(key: key);

  late ThemeData _theme;

  late double _width;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _theme = Theme.of(context);
    //ProfileViewModel profileViewModel = Get.put(ProfileViewModel());
    return SafeArea(
      child: GetBuilder<MainViewModel>(
        init: MainViewModel(),
        builder: (ctr) => Scaffold(
          key: _scaffoldKey,
          backgroundColor: _theme.scaffoldBackgroundColor,
          appBar: AppBar(
            title: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.p8,
                vertical: AppPadding.p8,
              ),
              child: Stack(
                children: [
                  Column(
                    children: [
                      Image.asset(
                        ImageAssets.appLogo,
                        width: _width * 0.12,
                      ),
                      const SizedBox(
                        height: AppSize.s1,
                      ),
                      Text(
                        Constants.appName,
                        //style: _theme.textTheme.caption,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            centerTitle: false,
            titleSpacing: 10,
            backgroundColor: ColorManager.secondary,
            elevation: 0.0,
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.p8,
                  vertical: AppPadding.p8,
                ),
                child: CircleAvatar(
                  backgroundColor: ColorManager.white,
                  radius: 29.0,
                  child: CircleAvatar(
                    radius: 30.0,
                    backgroundColor: ColorManager.secondary,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RoutesName.profile);
                      },
                      icon: Icon(
                        FontAwesomeIcons.solidUser,
                        size: AppSize.s25,
                        color: ColorManager.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          body: ctr.currentPage,
          bottomNavigationBar: _bottomNavigatonBar(),
        ),
      ),
    );
  }

  // void onPageChange(int page) {
  //   MainViewModel.instance.pageIndex = page;
  // }

  Widget _bottomNavigatonBar() {
    return GetBuilder<MainViewModel>(
      init: MainViewModel(),
      builder: (ctr) => BottomNavigationBar(
        currentIndex: ctr.navigatorValue,
        type: BottomNavigationBarType.fixed,
        onTap: (index) => ctr.changeSelectedValue(index),
        showUnselectedLabels: true,
        selectedItemColor: ColorManager.white,
        unselectedItemColor: ColorManager.grey2.withOpacity(0.7),
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'home'.tr,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.dashboard,
            ),
            label: 'category'.tr,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
            ),
            label: 'search'.tr,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
            ),
            label: 'favorite'.tr,
          ),
        ],
      ),
    );
  }
}
