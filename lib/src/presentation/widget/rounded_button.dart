import 'package:dev_guide/src/presentation/resources/font_manager.dart';
import 'package:dev_guide/src/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

class RoundeButton extends StatelessWidget {
  final String text;
  final VoidCallback press;
  final bool isLoading;
  final Color color, textColor;
  final double? width;

  const RoundeButton({
    Key? key,
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
      child: ElevatedButton(
        onPressed: isLoading ? null : press,
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p12),
          child: isLoading
              ? const CircularProgressIndicator()
              : Text(
                  text,
                  style: TextStyle(
                    color: textColor,
                    fontSize: FontSize.s16,
                    fontWeight: FontWeightManager.bold,
                  ),
                ),
        ),
      ),
    );
  }
}
