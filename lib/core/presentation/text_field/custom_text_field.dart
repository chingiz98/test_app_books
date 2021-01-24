import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testapp/core/presentation/themes/custom_theme.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key key,
    this.hintText,
    this.onChanged,
    this.height,
    this.width,
    this.style,
    this.contentPadding,
    this.maxLength,
    this.validator,
    this.autofocus = false,
    this.hintStyle,
    this.helperStyle,
    this.counterStyle,
    this.errorStyle,
    this.labelStyle,
    this.prefixStyle,
    this.suffixStyle,
    this.backGroundColor,
    this.enabled,
    this.focusNode,
    this.inputFormatters,
    this.padding,
    this.errorText,
    this.fillColor,
    this.counterText,
    this.keyboardType,
    this.maxLines,
    this.onTap,
    this.labelText,
    this.textDirection,
    this.helperText,
    this.prefix,
    this.suffix,
    this.icon,
    this.prefixIcon,
    this.suffixIcon,
    this.prefixText,
    this.suffixText,
    this.controller,
    this.obscureText = false,
  }) : super(key: key);

  final String hintText;

  final ValueChanged<String> onChanged;

  final double height;

  final double width;

  final TextStyle style;

  final EdgeInsets contentPadding;

  final int maxLength;

  final String Function(String) validator;

  final bool autofocus;

  final TextStyle hintStyle;

  final TextStyle helperStyle;

  final TextStyle counterStyle;

  final TextStyle errorStyle;

  final TextStyle labelStyle;

  final TextStyle prefixStyle;

  final TextStyle suffixStyle;

  final Color backGroundColor;

  final bool enabled;

  final FocusNode focusNode;

  final List<TextInputFormatter> inputFormatters;

  final EdgeInsetsGeometry padding;

  final String errorText;

  final Color fillColor;

  final String counterText;

  final TextInputType keyboardType;

  final int maxLines;

  final VoidCallback onTap;

  final String labelText;

  final TextDirection textDirection;

  final String helperText;

  final Widget prefix;

  final Widget suffix;

  final Widget icon;

  final Widget prefixIcon;

  final Widget suffixIcon;

  final String prefixText;

  final String suffixText;

  final TextEditingController controller;

  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      height: height,
      width: width,
      decoration: (height != null)
          ? CustomTheme.outLineBorderTextField
          : CustomTheme.underLineBorderTextField,
      color: backGroundColor,
      child: TextFormField(
        obscureText: obscureText,
        textDirection: textDirection,
        maxLines: obscureText ? 1 : maxLines,
        onTap: onTap,
        focusNode: focusNode,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        autofocus: autofocus,
        maxLength: maxLength,
        validator: validator,
        enabled: enabled,
        style: style ?? CustomTheme.textGray15SourceSansPro400,
        controller: controller,
        decoration: InputDecoration(
          icon: icon,
          suffixText: suffixText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          prefixText: prefixText,
          helperText: helperText,
          prefix: prefix,
          suffix: suffix,
          labelText: labelText,
          errorText: errorText,
          fillColor: fillColor,
          counterText: counterText,
          hintText: hintText,
          hintStyle: hintStyle ?? CustomTheme.textGray15SourceSansPro400,
          helperStyle: helperStyle,
          counterStyle: counterStyle,
          errorStyle: errorStyle,
          labelStyle: labelStyle,
          prefixStyle: prefixStyle,
          suffixStyle: suffixStyle,
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
          contentPadding: keyboardType == TextInputType.multiline
              ? const EdgeInsets.all(17.0)
              : contentPadding,
        ),
        onChanged: onChanged,
      ),
    );
  }
}
