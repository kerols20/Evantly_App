import 'package:evanly/core/constant/app_color.dart';
import 'package:flutter/material.dart';

class CustomFormField extends StatefulWidget {
  final String labelText;
  final String? hintText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final bool obscureText;
  final bool isPassword;
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
    this.isPassword = false,
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
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  late bool _isObscured;
  void initState() {
    super.initState();
    _isObscured = widget.isPassword; // إذا كان الحقل كلمة مرور، يتم إخفاء النص مبدئيًا
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? const EdgeInsets.all(8.0), // تطبيق padding
      child: TextFormField(
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        obscureText: widget.obscureText,
        validator: widget.validator,
        enabled: widget.enabled,
        decoration: InputDecoration(
          labelText: widget.labelText,
          hintText: widget.hintText,
          prefixIcon: widget.prefixIcon != null ? Icon(widget.prefixIcon) : null,
          suffixIcon: widget.suffixIcon != null
              ? IconButton(
            icon: Icon(_isObscured ? Icons.visibility : Icons.visibility_off,),
            onPressed: (){
              setState(() {
                _isObscured = !_isObscured;
              });
            },
          )
              : null,
          enabledBorder: widget.enabledBorder ??
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: app_color.appColorIconAndTextFormFiled, width: 2),
              ),
          focusedBorder: widget.focusedBorder ??
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: app_color.appColorIconAndTextFormFiled),
              ),
        ),
      ),
    );
  }
}
