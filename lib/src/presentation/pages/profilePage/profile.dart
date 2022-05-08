import 'package:dev_guide/src/core/constants.dart';
import 'package:dev_guide/src/core/routes_name.dart';
import 'package:dev_guide/src/domain/viewmodel/auth_viewmodel/authentication.dart';
import 'package:dev_guide/src/domain/viewmodel/profile_viewmodel/profile_viewmodel.dart';
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
  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);
    return GetBuilder<ProfileViewModel>(
        init: ProfileViewModel(),
        builder: (ctr) => Scaffold(
              backgroundColor: ColorManager.scaffoldBackgroundColor,
              body: ctr.notUser.value
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
                                  text: 'Sign Up'.toUpperCase(),
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
                                  Constants.alreadyHaveAnAccount,
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
                                          'back',
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
                                  'Account',
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
        color: ColorManager.scaffoldBackgroundColor,
        elevation: 0.0,
        child: Column(
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
              ctr.userModel.fullName!,
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
                  ctr.userModel.email!,
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
            padding: const EdgeInsets.only(left: AppPadding.p16),
            child: Text(
              'Settings',
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
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Text(
                    'Light / Dark',
                    style: TextStyle(
                      fontSize: 13.5,
                      color: ColorManager.secondary,
                    ),
                  ),
                ),
                Expanded(
                  child: Switch(
                    value: true,
                    activeColor: ColorManager.secondary,
                    onChanged: (bool value) {},
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: AppPadding.p28,
              top: AppPadding.p8,
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Text(
                    'Languages',
                    style: TextStyle(
                      fontSize: 13.5,
                      color: ColorManager.secondary,
                    ),
                  ),
                ),
                Expanded(
                  child: Switch(
                    value: true,
                    activeColor: ColorManager.secondary,
                    onChanged: (bool value) {},
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
          Padding(
            padding: const EdgeInsets.only(
              left: AppPadding.p28,
              top: AppPadding.p8,
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Text(
                    'Help and Support',
                    style: TextStyle(
                      fontSize: 13.5,
                      color: ColorManager.secondary,
                    ),
                  ),
                ),
                Expanded(
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 20.0,
                    color: ColorManager.secondary,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: AppPadding.p28,
              top: AppPadding.p16,
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Text(
                    'About DevGuide',
                    style: TextStyle(
                      fontSize: 13.5,
                      color: ColorManager.secondary,
                    ),
                  ),
                ),
                Expanded(
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 20.0,
                    color: ColorManager.secondary,
                  ),
                )
              ],
            ),
          ),

          SizedBox(
            height: AppSize.s20,
          ),
          Center(
            child: Container(
              //margin: EdgeInsets.only(left: 30, top: 20, right: 30, bottom: 10),
              height: 25.0,
              width: 90.0,
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
                  ctr.signOut();
                  Get.offAllNamed(RoutesName.signin);
                },
                child: Text(
                  'Sign Out',
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
            height: AppSize.s18,
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
