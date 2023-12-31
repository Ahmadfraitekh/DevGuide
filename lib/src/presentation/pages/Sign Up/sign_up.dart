// ignore_for_file: unused_field

import 'package:dev_guide/src/core/constants.dart';
import 'package:dev_guide/src/core/helper/input_validation_mixin.dart';
import 'package:dev_guide/src/core/routes_name.dart';
import 'package:dev_guide/src/domain/viewmodel/auth_viewmodel/authentication.dart';
import 'package:dev_guide/src/presentation/resources/assets_manager.dart';
import 'package:dev_guide/src/presentation/resources/color_manager.dart';
import 'package:dev_guide/src/presentation/resources/font_manager.dart';
import 'package:dev_guide/src/presentation/resources/values_manager.dart';
import 'package:dev_guide/src/presentation/widget/rounded_Button.dart';
import 'package:dev_guide/src/presentation/widget/rounded_input_field.dart';
import 'package:dev_guide/src/presentation/widget/rounded_password_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  late ThemeData _theme;

  var _emailController = TextEditingController();
  var _passwordController = TextEditingController();
  var _fullNameController = TextEditingController();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  late double _width, _pixelRatio;

  //late bool _xLarge;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    _theme = Theme.of(context);
    return GetBuilder<Authentication>(
      init: Authentication(),
      builder: (ctr) => Scaffold(
        backgroundColor: _theme.backgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const SizedBox(
                  height: AppSize.s30,
                ),
                Stack(
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          ImageAssets.appLogo,
                          width: _width * 0.2,
                        ),
                        const SizedBox(
                          height: AppSize.s12,
                        ),
                        Text(
                          Constants.appName,
                          style: _theme.textTheme.labelMedium,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: AppSize.s8,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: AppMargin.m12,
                      ),
                      RoundedInputField(
                        controller: _fullNameController,
                        onChange: (value) {},
                        //AppCubit.get(context).fullName = value,
                        // valueText: _fullName,
                        hintText: 'fullName'.tr,
                        icon: Icons.person,
                        inputType: TextInputType.text,
                        validator: (fullName) {
                          // if (!isEmpty(fullName)) {
                          //   return null;
                          // } else {
                          //   return Constants.fullNameRequired;
                          // }
                          if (!InputValidationMixin.isEmpty(fullName)) {
                            return null;
                          } else {
                            return 'yourNameIsRequired'.tr;
                          }
                        },
                        onSave: (value) {
                          ctr.fullName = value;
                        },
                      ),
                      RoundedInputField(
                        controller: _emailController,
                        onChange: (value) {},
                        // valueText: _email,
                        hintText: 'email'.tr,
                        icon: Icons.email,
                        inputType: TextInputType.emailAddress,
                        validator: (email) {
                          // if (isEmailValid(email)) {
                          //   return null;
                          // } else if (isEmpty(email)) {
                          //   return Constants.emailRequired;
                          // } else if (!isEmailValid(email)) {
                          //   return Constants.invalidEmail;
                          // }
                          if (InputValidationMixin.isEmailValid(email)) {
                            return null;
                          } else if (InputValidationMixin.isEmpty(email)) {
                            return 'emailIsRequired'.tr;
                          } else if (!InputValidationMixin.isEmailValid(
                              email)) {
                            return 'invalidEmail'.tr;
                          }
                        },
                        onSave: (value) {
                          ctr.email = value;
                        },
                      ),
                      RoundedPasswordField(
                        controller: _passwordController,
                        onChange: (value) {},
                        icon: Icons.lock,
                        hintText: 'password'.tr,
                        validator: (password) {
                          // if (!isEmpty(password)) {
                          //   return null;
                          // } else {
                          //   return Constants.passwordRequired;
                          // }
                          if (!InputValidationMixin.isEmpty(password)) {
                            return null;
                          } else {
                            return 'passwordIsRequired'.tr;
                          }
                        },
                        onSave: (value) {
                          ctr.password = value;
                        },
                      ),
                      RoundeButton(
                        text: 'signUp'.tr,
                        isLoading: ctr.isLoading.value,
                        press: () async {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            Authentication.instance
                                .signUpWithEmailAndPassword();
                          }
                        },
                        color: ColorManager.secondary,
                        textColor: ColorManager.white,
                      ),
                      const SizedBox(
                        height: AppSize.s8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'alreadyHaveAnAccount?'.tr,
                            style: _theme.textTheme.headline4,
                          ),
                          const SizedBox(
                            width: AppSize.s12,
                          ),
                          InkWell(
                            onTap: () {
                              // Navigator.pushReplacementNamed(
                              //     context, RoutesName.signin);
                              Get.offNamed(RoutesName.signin);
                            },
                            child: Text(
                              'signIn'.tr,
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: ColorManager.primary,
                                fontSize: FontSize.s16,
                                fontWeight: FontWeightManager.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: AppSize.s40,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.all(AppPadding.p8),
                          child: Text(
                            'privacyPolicy'.tr,
                            textAlign: TextAlign.center,
                            style: _theme.textTheme.caption,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: AppSize.s20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
