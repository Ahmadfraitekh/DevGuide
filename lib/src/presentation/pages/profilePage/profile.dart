import 'package:dev_guide/src/core/helper/local_storage_data.dart';
import 'package:dev_guide/src/core/routes_name.dart';
import 'package:dev_guide/src/domain/viewmodel/profile_viewmodel/profile_viewmodel.dart';
import 'package:dev_guide/src/domain/viewmodel/theme_viewmodel/theme_viewmodel.dart';
import 'package:dev_guide/src/presentation/resources/color_manager.dart';
import 'package:dev_guide/src/presentation/resources/values_manager.dart';
import 'package:dev_guide/src/presentation/widget/back_icon.dart';
import 'package:dev_guide/src/presentation/widget/rounded_Button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);
  late ThemeData _theme;
  LocalStorageData controller = Get.find();
  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);
    return GetBuilder<ProfileViewModel>(
        init: ProfileViewModel(),
        builder: (ctr) => Scaffold(
              body: ctr.userModel == null
                  ? Center(
                      child: Container(
                        height: 400.0,
                        width: 300.0,
                        child: Card(
                          color: ColorManager.background,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 200.0,
                                child: RoundeButton(
                                  color: ColorManager.secondary,
                                  isLoading: ctr.isLoading.value,
                                  press: () => Get.offNamedUntil(
                                      RoutesName.signup, (route) => false),
                                  text: 'signUp'.tr.toUpperCase(),
                                  textColor: ColorManager.white,
                                ),
                              ),
                              const SizedBox(
                                height: AppSize.s30,
                              ),
                              InkWell(
                                onTap: () => Get.offNamedUntil(
                                    RoutesName.signin, (route) => false),
                                child: Text(
                                  'alreadyHaveAnAccount?'.tr,
                                  style: _theme.textTheme.headline3,
                                ),
                              ),
                              const SizedBox(
                                height: AppSize.s30,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(AppPadding.p8),
                                child: InkWell(
                                    onTap: () => Get.offNamedUntil(
                                        RoutesName.mainPage, (route) => false),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        BackIcon(),
                                        Text(
                                          'back'.tr,
                                          style: _theme.textTheme.headline1,
                                        )
                                      ],
                                    )),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  : SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: AppSize.s40,
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(AppPadding.p8),
                                child: BackIcon(),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(AppPadding.p16),
                                child: Text(
                                  'accout'.tr,
                                  style: _theme.textTheme.labelMedium,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: AppSize.s30,
                          ),
                          _appInfo(),
                          const SizedBox(
                            height: AppSize.s20,
                          ),
                          _settings(),
                        ],
                      ),
                    ),
            ));
  }

  Widget _appInfo() {
    return GetBuilder<ProfileViewModel>(
      init: ProfileViewModel(),
      builder: (ctr) => Card(
        elevation: 0.0,
        child: ctr.userModel == null
            ? Text("")
            : Column(
                children: [
                  CircleAvatar(
                    backgroundColor: ColorManager.secondary,
                    child: CircleAvatar(
                      child: Icon(
                        FontAwesomeIcons.solidUser,
                        color: ColorManager.secondary,
                        size: AppSize.s65,
                      ),
                      backgroundColor: ColorManager.white,
                      radius: 59.0,
                    ),
                    radius: 60.0,
                  ),
                  const SizedBox(
                    height: AppSize.s14,
                  ),
                  Text(
                    ctr.userModel!.fullName!,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: ColorManager.primary,
                    ),
                  ),
                  const SizedBox(
                    height: AppSize.s8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.email_outlined,
                        size: 21.0,
                      ),
                      const SizedBox(
                        width: AppSize.s8,
                      ),
                      Text(
                        ctr.userModel!.email!,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0,
                          color: ColorManager.primary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
      ),
    );
  }

  Widget _settings() {
    return GetBuilder<ProfileViewModel>(
      init: ProfileViewModel(),
      builder: (ctr) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: AppPadding.p16,
              right: AppPadding.p4,
            ),
            child: Text(
              'settings'.tr,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22.0,
                color: ColorManager.primary,
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(
          //     left: AppPadding.p28,
          //     top: AppPadding.p20,
          //   ),
          //   child: Row(
          //     children: [
          //       Expanded(
          //         flex: 5,
          //         child: Text(
          //           'Account setting',
          //           style: TextStyle(
          //             fontSize: 13.5,
          //             color: ColorManager.secondary,
          //           ),
          //         ),
          //       ),
          //       Expanded(
          //         child: Icon(
          //           Icons.arrow_forward_ios,
          //           size: 20.0,
          //           color: ColorManager.secondary,
          //         ),
          //       )
          //     ],
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.only(
              left: AppPadding.p28,
              top: AppPadding.p4,
              right: AppPadding.p8,
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Text(
                    'theme'.tr,
                    style: TextStyle(
                      fontSize: 13.5,
                      color: ColorManager.secondary,
                    ),
                  ),
                ),
                Expanded(
                  child: Switch(
                    activeColor: ColorManager.primary,
                    activeTrackColor: ColorManager.background,
                    inactiveThumbColor: ColorManager.secondary,
                    inactiveTrackColor: ColorManager.background,
                    value: ctr.isSwitched,
                    onChanged: (value) {
                      ctr.isSwitchedThemeState(value) == true
                          ? ThemeViewModel().switchTheme()
                          : ThemeViewModel().switchTheme();

                      print(' Value:  $value');
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: AppPadding.p28,
              top: AppPadding.p8,
              right: AppPadding.p8,
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Text(
                    'language'.tr,
                    style: TextStyle(
                      fontSize: 13.5,
                      color: ColorManager.secondary,
                    ),
                  ),
                ),
                Expanded(
                  child: DropdownButton<String>(
                    dropdownColor: ColorManager.background,
                    value: ctr.savedLang.value,
                    icon: Icon(
                      Icons.arrow_drop_down,
                      size: 20.0,
                      color: ColorManager.secondary,
                    ),
                    elevation: 16,
                    style: TextStyle(color: ColorManager.primary),
                    underline: Container(
                      //padding: EdgeInsets.all(AppPadding.p2),
                      height: 1.0,
                      width: 1.0,
                      color: ColorManager.secondary,
                    ),
                    onChanged: (newValue) {
                      ctr.savedLang.value = newValue!;
                      Get.updateLocale(Locale(newValue.toLowerCase()));
                      ctr.saveLocale();
                    },
                    items: [
                      'EN',
                      'AR',
                    ].map<DropdownMenuItem<String>>(
                      (value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      },
                    ).toList(),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: ColorManager.secondary,
            endIndent: 10,
            indent: 10,
          ),
          // Padding(
          //   padding: const EdgeInsets.only(
          //     left: AppPadding.p28,
          //     top: AppPadding.p8,
          //   ),
          //   child: Row(
          //     children: [
          //       Expanded(
          //         flex: 5,
          //         child: Text(
          //           'Help and Support',
          //           style: TextStyle(
          //             fontSize: 13.5,
          //             color: ColorManager.secondary,
          //           ),
          //         ),
          //       ),
          //       Expanded(
          //         child: Icon(
          //           Icons.arrow_forward_ios,
          //           size: 20.0,
          //           color: ColorManager.secondary,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.only(
              left: AppPadding.p28,
              top: AppPadding.p16,
              right: AppPadding.p8,
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Text(
                    'aboutDevGuide'.tr,
                    style: TextStyle(
                      fontSize: 13.5,
                      color: ColorManager.secondary,
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      // todo: navigate to the about DevGuide screen
                    },
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 20.0,
                      color: ColorManager.secondary,
                    ),
                  ),
                )
              ],
            ),
          ),

          SizedBox(
            height: AppSize.s40,
          ),
          Center(
            child: Container(
              //margin: EdgeInsets.only(left: 30, top: 20, right: 30, bottom: 10),
              height: 28.0,
              width: 200,
              decoration: BoxDecoration(
                color: ColorManager.background.withOpacity(0.8),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(6.0),
                  topRight: Radius.circular(6.0),
                  bottomLeft: Radius.circular(6.0),
                  bottomRight: Radius.circular(6.0),
                ),
              ),
              child: InkWell(
                onTap: () {
                  // todo: add alert dialog to ensure the user if they want to log out or not
                  Get.defaultDialog(
                    backgroundColor: ColorManager.background,
                    title: 'signout'.tr,
                    titlePadding: const EdgeInsets.only(top: AppPadding.p30),
                    titleStyle: TextStyle(
                      color: ColorManager.secondary,
                    ),
                    content: Text(
                      'areYouSureToSignout?'.tr,
                      style: TextStyle(color: ColorManager.primary),
                    ),
                    contentPadding: const EdgeInsets.only(
                      bottom: AppPadding.p30,
                      top: AppPadding.p20,
                    ),
                    textCancel: 'cancel'.tr,
                    textConfirm: 'signout'.tr,
                    confirmTextColor: ColorManager.background,
                    cancelTextColor: ColorManager.primary,
                    buttonColor: ColorManager.primary,
                    onConfirm: () {
                      ctr.signOut();
                      Get.offAllNamed(RoutesName.signin);
                    },
                  );
                },
                child: Text(
                  'signout'.tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: ColorManager.primary,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: AppSize.s20,
          ),
          Center(
            child: Text(
              'DevGuide v1.0',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 10.0,
                color: ColorManager.secondary,
              ),
            ),
          )
        ],
      ),
    );
  }
}
