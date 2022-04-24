import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({Key? key, required this.title, required this.onPressed})
      : super(key: key);
  final String title;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(title,style: TextStyle(fontSize: 16),),
      style: ElevatedButton.styleFrom(
        primary: const Color(0xff007DFD),
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(8),
        ),
      ),
    );
  }
}
