import 'package:dev_guide/src/presentation/resources/color_manager.dart';
import 'package:dev_guide/src/presentation/resources/font_manager.dart';
import 'package:dev_guide/src/presentation/resources/values_manager.dart';
import 'package:dev_guide/src/presentation/widget/text_field_container.dart';
import 'package:flutter/material.dart';

class RoundedPasswordField extends StatefulWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChange;
  final String? hintText;
  final IconData icon;

  final dynamic validator;
  final Function(String? val)? onSave;

  const RoundedPasswordField({
    Key? key,
    this.onChange,
    this.hintText,
    required this.icon,
    this.validator,
    this.controller,
    this.onSave,
  }) : super(key: key);

  @override
  State<RoundedPasswordField> createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  late ThemeData _theme;

  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p8),
      child: TextFieldContainer(
        child: TextFormField(
          obscureText: _showPassword ? false : true,
          onChanged: widget.onChange,
          cursorColor: _theme.primaryColor,
          onSaved: widget.onSave,
          validator: widget.validator,
          style: const TextStyle(
            color: Colors.black,
            fontSize: FontSize.s14,
          ),
          decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.lock,
                color: ColorManager.primary,
                size: AppSize.s22,
              ),
              labelText: widget.hintText,
              suffixIcon: InkWell(
                onTap: () {
                  setState(() {
                    if (_showPassword) {
                      _showPassword = false;
                    } else {
                      _showPassword = true;
                    }
                  });
                },
                child: Icon(
                  Icons.visibility,
                  color: _theme.primaryColor,
                ),
              )),
        ),
      ),
    );
  }
}
