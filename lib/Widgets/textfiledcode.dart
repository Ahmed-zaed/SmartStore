import 'package:flutter/material.dart';

class TextFiledCode extends StatelessWidget {
  const TextFiledCode({Key? key, required this.controller}) : super(key: key);
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
margin: EdgeInsets.symmetric(horizontal: 16),
      height: 47,
      width: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xff007DFD).withAlpha(50),
      ),
      child: TextField(
        keyboardType: TextInputType.numberWithOptions(decimal: false , signed: false),
        controller: controller,
        textAlign: TextAlign.center,
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
