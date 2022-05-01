import 'package:dev_guide/src/domain/viewmodel/auth_viewmodel/authentication.dart';
import 'package:dev_guide/src/presentation/resources/color_manager.dart';
import 'package:dev_guide/src/presentation/resources/values_manager.dart';
import 'package:dev_guide/src/presentation/widget/back_icon.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: must_be_immutable
class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);
  late ThemeData _theme;
  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);
    return Scaffold(
      backgroundColor: ColorManager.scaffoldBackgroundColor,
      body: Column(
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
    );
  }

  Widget _appInfo() {
    return Card(
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
            'Ahmad Fraitekh',
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
                'AhmadFraitekh@gmail.com',
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
    );
  }

  Widget _settings() {
    return Column(
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
        Padding(
          padding: const EdgeInsets.only(
            left: AppPadding.p28,
            top: AppPadding.p20,
          ),
          child: Row(
            children: [
              Expanded(
                flex: 5,
                child: Text(
                  'Account setting',
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
        Padding(
          padding: const EdgeInsets.only(
            left: AppPadding.p28,
            top: AppPadding.p20,
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
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: AppPadding.p28,
            top: AppPadding.p20,
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
        Padding(
          padding: const EdgeInsets.only(
            left: AppPadding.p28,
            top: AppPadding.p20,
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
        SizedBox(
          height: AppSize.s16,
        ),
        Center(
          child: InkWell(
            onTap: () async {
              Authentication.instance.logOut();
            },
            child: Text(
              'Sign out',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                color: ColorManager.secondary,
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
    );
  }
}
