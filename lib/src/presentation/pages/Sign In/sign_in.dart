// ignore_for_file: unused_field

import 'package:dev_guide/src/core/constants.dart';
import 'package:dev_guide/src/core/helper/input_validation_mixin.dart';
import 'package:dev_guide/src/core/routes_name.dart';
import 'package:dev_guide/src/presentation/resources/assets_manager.dart';
import 'package:dev_guide/src/presentation/resources/color_manager.dart';
import 'package:dev_guide/src/presentation/resources/font_manager.dart';
import 'package:dev_guide/src/presentation/resources/values_manager.dart';
import 'package:dev_guide/src/presentation/widget/rounded_Button.dart';
import 'package:dev_guide/src/presentation/widget/rounded_input_field.dart';
import 'package:dev_guide/src/presentation/widget/rounded_password_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({Key? key}) : super(key: key);

  @override
  State<SigninPage> createState() => _SigninPageState();
}

// ignore: duplicate_ignore
class _SigninPageState extends State<SigninPage> with InputValidationMixin {
  late ThemeData _theme;

  String _email = "", _password = "";
  late double _width, _pixelRatio;

  //late bool _xLarge;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    _theme = Theme.of(context);
    return Scaffold(
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
                      onChange: (value) => _email = value,
                      valueText: _email,
                      hintText: Constants.email,
                      icon: Icons.email,
                      inputType: TextInputType.emailAddress,
                      validator: (email) {
                        if (isEmailValid(email)) {
                          return null;
                        } else if (isEmpty(email)) {
                          return Constants.emailRequired;
                        } else if (!isEmailValid(email)) {
                          return Constants.invalidEmail;
                        }
                      },
                    ),
                    RoundedPasswordField(
                      onChange: (value) => _password = value,
                      icon: Icons.lock,
                      hintText: Constants.password,
                      validator: (password) {
                        if (!isEmpty(password)) {
                          return null;
                        } else {
                          return Constants.passwordRequired;
                        }
                      },
                    ),
                    RoundeButton(
                      text: Constants.singIn,
                      press: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            RoutesName.mainPage,
                            (route) => false,
                          );
                        }
                      },
                      isLoading: false,
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
                          Constants.dontHaveAnAccount,
                          style: _theme.textTheme.headline4,
                        ),
                        const SizedBox(
                          width: AppSize.s12,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushReplacementNamed(
                                context, RoutesName.signup);
                          },
                          child: Text(
                            Constants.singUp,
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
                      height: AppSize.s20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: ColorManager.secondary),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(AppPadding.p14),
                            child: Icon(
                              FontAwesomeIcons.facebookF,
                              color: ColorManager.secondary,
                              size: AppSize.s20,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: AppSize.s20,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: ColorManager.secondary),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(AppPadding.p14),
                            child: Icon(
                              FontAwesomeIcons.google,
                              color: ColorManager.secondary,
                              size: AppSize.s20,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: AppSize.s20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppPadding.p20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pushNamedAndRemoveUntil(
                                context,
                                RoutesName.mainPage,
                                (route) => false,
                              );
                            },
                            child: Text(
                              Constants.skip,
                              style: TextStyle(
                                  fontSize: FontSize.s20,
                                  fontWeight: FontWeightManager.bold,
                                  color: ColorManager.primary),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
