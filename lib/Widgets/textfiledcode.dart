import 'package:flutter/material.dart';

class TextFiledCode extends StatelessWidget {
  const TextFiledCode(
      {Key? key, required this.controller,required this.focusNode , required this.onChange})
      : super(key: key);
  final TextEditingController controller;
  final FocusNode focusNode;
  final Function(String value) onChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      height: 47,
      width: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xff007DFD).withAlpha(50),
      ),
      child: TextField(
        keyboardType: const TextInputType.numberWithOptions(
            decimal: false, signed: false),
        controller: controller,
        focusNode: focusNode,
        textAlign: TextAlign.center,
        onChanged
        :onChange,
        maxLength: 1,
        style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        decoration: const InputDecoration(
            counterText: '',
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
            ),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent))),
      ),
    );
  }
}
