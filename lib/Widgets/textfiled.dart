import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFiled extends StatelessWidget {
  const TextFiled(
      {Key? key,
      required this.hint,
      required this.controller,
      required this.suffix,
      this.obscureText = false,
      required this.textType,
      required this.errorText,
      this.textPrefix = '',
      this.helperText = null,
      this.maxLingth = null})
      : super(key: key);
  final String hint;
  final TextEditingController controller;
  final Icon suffix;
  final bool obscureText;
  final String? errorText;
  final TextInputType textType;
  final String textPrefix;
  final String? helperText;
  final int? maxLingth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 7),
      child: TextField(
        maxLength: maxLingth,
        controller: controller,
        obscureText: obscureText,
        keyboardType: textType,
        decoration: InputDecoration(
            errorText: errorText,
            counterText: '',
            suffixIcon: suffix,
            labelText: hint,
            prefixText: textPrefix,
            helperText: helperText,
            hintStyle:
                const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xffC1C1C1), width: 1),
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide:
                    const BorderSide(color: Color(0xff717171), width: 1)),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.red, width: 1),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.red, width: 1),
            )),
      ),
    );
  }
}
