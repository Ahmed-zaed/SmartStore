import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Widgets/botton.dart';
import '../../Widgets/textfiled.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

late TextEditingController _nameEditingController;
late TextEditingController _phoneEditingController;
late TextEditingController _passwordEditingController;
String? errorText_name;
String? errorText_phone;
String? errorText_Password;

class _SignupScreenState extends State<SignupScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameEditingController = TextEditingController();
    _passwordEditingController = TextEditingController();
    _phoneEditingController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _nameEditingController.dispose();
    _phoneEditingController.dispose();
    _passwordEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          const SizedBox(
            height: 30,
          ),
          Image.asset(
            'images/logo.png',
            fit: BoxFit.cover,
            height: 300,
            width: 200,
          ),
          TextFiled(
              textType: TextInputType.text,
              errorText: errorText_name,
              hint: 'Name',
              suffix: const Icon(Icons.person),
              controller: _nameEditingController,
              obscureText: false),
          const SizedBox(
            height: 10,
          ),
          TextFiled(
              textPrefix: '+972-',
              textType: TextInputType.phone,
              errorText: errorText_phone,
              hint: 'Phone Number',
              suffix: const Icon(Icons.phone),
              controller: _phoneEditingController,
              obscureText: false),
          const SizedBox(
            height: 10,
          ),
          TextFiled(
              textType: TextInputType.text,
              errorText: errorText_Password,
              hint: 'Password',
              suffix: const Icon(
                Icons.visibility_off,
              ),
              controller: _passwordEditingController,
              obscureText: true),
          const SizedBox(
            height: 30,
          ),
          Button(
            title: 'Sign up',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
