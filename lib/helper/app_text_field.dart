import 'package:flutter/material.dart';
import 'package:ttn_flix/constants/app_constant.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    required this.label,
    this.controller,
    this.validator,
    this.isPassword = false,
    this.inputType = TextInputType.none,
    this.readOnly = false,
    this.required = true,
    this.maxLines = 1,
    this.onTap,
    Key? key,
  }) : super(key: key);

  final String label;
  final TextEditingController? controller;
  final bool isPassword;
  final bool readOnly;
  final bool required;
  final FormFieldValidator? validator;
  final TextInputType inputType;
  final int? maxLines;
  final VoidCallback? onTap;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late bool _obscureText;

  @override
  void initState() {
    _obscureText = widget.isPassword ? true : false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: Key(widget.label),
      onTap: widget.onTap,
      maxLines: widget.maxLines,
      readOnly: widget.readOnly,
      autofocus: false,
      keyboardType: widget.inputType,
      obscureText: _obscureText,
      controller: widget.controller,
      decoration: InputDecoration(
        labelStyle: const TextStyle(color: AppColors.white),
        isDense: true,
        label: Text("${widget.label} ${widget.required ? "*" : ""}"),
        border: const OutlineInputBorder(),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                })
            : null,
      ),
      validator: widget.validator,
    );
  }
}
