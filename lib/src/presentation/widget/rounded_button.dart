import 'package:dev_guide/src/domain/viewmodel/auth_viewmodel/authentication.dart';
import 'package:dev_guide/src/presentation/resources/color_manager.dart';
import 'package:dev_guide/src/presentation/resources/font_manager.dart';
import 'package:dev_guide/src/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoundeButton extends StatelessWidget {
  final TextEditingController? emailController;
  final TextEditingController? passwordController;
  final String text;
  final VoidCallback press;
  final bool isLoading;
  final Color color, textColor;
  final double? width;

  const RoundeButton({
    Key? key,
    this.emailController,
    this.passwordController,
    required this.text,
    required this.press,
    required this.isLoading,
    required this.color,
    required this.textColor,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        margin: const EdgeInsets.symmetric(
          vertical: AppSize.s12,
        ),
        width: width ?? size.width * 0.9,
        child: Obx(
          () {
            return ElevatedButton(
              onPressed:
                  Get.find<Authentication>().isLoading.value ? null : press,
              child: Padding(
                padding: const EdgeInsets.all(AppPadding.p12),
                child: Get.find<Authentication>().isLoading.value
                    ? CircularProgressIndicator(
                        color: ColorManager.secondary,
                      )
                    : Text(
                        text,
                        style: TextStyle(
                          color: textColor,
                          fontSize: FontSize.s16,
                          fontWeight: FontWeightManager.bold,
                        ),
                      ),
              ),
            );
          },
        ));
  }
}
