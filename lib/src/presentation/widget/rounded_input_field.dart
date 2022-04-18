import 'package:dev_guide/src/presentation/resources/color_manager.dart';
import 'package:dev_guide/src/presentation/resources/font_manager.dart';
import 'package:dev_guide/src/presentation/resources/values_manager.dart';
import 'package:dev_guide/src/presentation/widget/text_field_container.dart';
import 'package:flutter/material.dart';

class RoundedInputField extends StatelessWidget {
  final String? hintText;
  final String? helperText;
  final String? valueText;
  final bool? enabled;
  final int? maxLines;
  final TextInputType? inputType;
  final IconData icon;
  final TextInputAction? textInputAction;
  final dynamic validator;
  final ValueChanged<String>? onChange;
  final VoidCallback? onTap;

  const RoundedInputField({
    Key? key,
    this.hintText,
    this.helperText,
    this.valueText,
    this.enabled,
    this.maxLines,
    this.inputType,
    this.textInputAction,
    this.validator,
    this.onChange,
    this.onTap,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p8),
      child: TextFieldContainer(
        child: TextFormField(
          textInputAction: textInputAction,
          onChanged: onChange,
          enabled: enabled,
          validator: validator,
          onTap: onTap,
          readOnly: onTap != null,
          maxLines: maxLines,
          style: const TextStyle(
            color: Colors.black,
            fontSize: FontSize.s14,
          ),
          keyboardType: inputType ?? TextInputType.text,
          cursorColor: ColorManager.primary,
          decoration: InputDecoration(
            prefixIcon: Icon(
              icon,
              color: ColorManager.primary,
              size: AppSize.s22,
            ),
            labelText: hintText,
            helperText: helperText == null ? null : helperText!,
          ),
        ),
      ),
    );
  }
}
