import 'package:flutter/material.dart';

import '../../Widgets/botton.dart';

class OpenScreen extends StatefulWidget {
  const OpenScreen({Key? key}) : super(key: key);

  @override
  State<OpenScreen> createState() => _OpenScreenState();
}

class _OpenScreenState extends State<OpenScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Image.asset(
                'images/Group.png',
                height: 500,
                width: 400,
                fit: BoxFit.fill,
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                'Shop With Ease',
                style: TextStyle(
                    fontSize: 34,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                    color: Color(0xff007DFD)),
              ),
              const SizedBox(
                height: 4,
              ),
              const Text(
                'We offer you many features to facilitate your\n'
                'daily business. You can buy and sell with\n'
                'one click. Isnt that amazing',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Roboto',
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Button(
                title: 'Open',
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/Signup_Screen');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
