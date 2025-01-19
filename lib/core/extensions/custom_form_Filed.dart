import 'package:evanly/core/constant/app_color.dart';
import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final String labelText;
  final String? hintText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final bool obscureText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixIconPressed;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final bool enabled;
  final EdgeInsetsGeometry? padding;

  const CustomFormField({
    Key? key,
    required this.labelText,
    this.hintText,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.obscureText = false,
    this.prefixIcon, // أيقونة على اليسار
    this.suffixIcon, // أيقونة على اليمين
    this.onSuffixIconPressed,
    this.enabledBorder,
    this.focusedBorder,
    this.enabled = true,
    this.padding, // إضافة خاصية padding
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(8.0), // تطبيق padding
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        validator: validator,
        enabled: enabled,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
          suffixIcon: suffixIcon != null
              ? IconButton(
            icon: Icon(suffixIcon),
            onPressed: onSuffixIconPressed,
          )
              : null,
          enabledBorder: enabledBorder ??
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: app_color.appColorIconAndTextFormFiled, width: 2),
              ),
          focusedBorder: focusedBorder ??
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: app_color.appColorIconAndTextFormFiled),
              ),
        ),
      ),
    );
  }
}
