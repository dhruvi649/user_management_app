import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../base/utils/constants/color_constants.dart';

class CustomTextFormField extends StatefulWidget {
  final String hintText;
  final String labelText;
  final TextEditingController controller;
  final FocusNode focusNode;
  final Function(String? value) onSubmit;
  final String? Function(String?)? validator;
  final TextInputType? textInputType;
  final IconData icon;

  const CustomTextFormField({
    Key? key,
    required this.hintText,
    required this.focusNode,
    required this.onSubmit,
    required this.controller,
    this.validator,
    this.textInputType,
    required this.labelText,
    required this.icon,
  }) : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _customTextFormField(context),
    );
  }

  TextFormField _customTextFormField(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: widget.validator,
      controller: widget.controller,
      obscureText: _isObscureText(),
      onFieldSubmitted: widget.onSubmit,
      focusNode: widget.focusNode,
      keyboardType: widget.textInputType,
      style: const TextStyle(fontSize: 16.0, color: kBlackColor),
      decoration: InputDecoration(
        hintText: widget.hintText,
        labelText: widget.labelText,
        floatingLabelStyle:
        MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
          final Color color = states.contains(MaterialState.focused)
              ? kGreenColor
              : kBlackColor;
          return TextStyle(color: color, letterSpacing: 1.3);
        }),
        hintStyle: const TextStyle(color: kGreyColor),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: kGreyColor,
            width: 1.0,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: kGreenColor),
        ),
        prefixIcon: Icon(
          widget.icon,
          color: kBlackColor,
        ),
        suffixIcon: widget.hintText.contains("Password")
            ? IconButton(
                icon: Icon(
                  _isVisible ? CupertinoIcons.eye_slash : CupertinoIcons.eye,
                  color: kBlackColor,
                ),
                onPressed: () {
                  if (widget.hintText.contains("Password")) {
                    setState(
                      () {
                        _isVisible = !_isVisible;
                      },
                    );
                  }
                },
              )
            : null,
      ),
    );
  }

  bool _isObscureText() {
    if (!_isVisible) {
      if (widget.hintText.contains("Password")) {
        return true;
      }
    }
    return false;
  }
}
