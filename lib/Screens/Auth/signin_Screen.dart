import 'package:flutter/material.dart';

import '../../Widgets/botton.dart';
import '../../Widgets/textfiled.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

late TextEditingController _phoneEditingController;
late TextEditingController _passwordEditingController;
String? errorTextPhone;
String? errorTextPassword;

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
    _phoneEditingController = TextEditingController();
    _passwordEditingController = TextEditingController();
  }

  @override
  void dispose() {
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
            height: 336,
            width: 336,
          ),
          TextFiled(
              maxLingth: 9,
              helperText: '567390091',
              textPrefix: '+972',
              textType: TextInputType.phone,
              errorText: errorTextPhone,
              hint: 'Phone',
              suffix: const Icon(Icons.phone),
              controller: _phoneEditingController,
              obscureText: false),
          TextFiled(
              textType: TextInputType.text,
              errorText: errorTextPassword,
              hint: 'Password',
              suffix: const Icon(Icons.visibility_off),
              controller: _passwordEditingController,
              obscureText: true),
          const SizedBox(
            height: 20,
          ),
          Button(
            title: 'Sign up',
            onPressed: () {
              signIn();
            },
          ),
        ],
      ),
    );
  }

  void signIn() {
    if (checkTextFiledEmpty()) {
      Navigator.pushNamed(context, '/Signup_Screen');
    }
  }

  bool checkTextFiledEmpty() {
    if (_phoneEditingController.text.isNotEmpty &&
        _passwordEditingController.text.isNotEmpty &&
        _phoneEditingController.text.length == 9) {
      errorTextFiled();
      return true;
    } else {
      errorTextFiled();
      return false;
    }
  }

  void errorTextFiled() {
    setState(() {
      if (_phoneEditingController.text.isEmpty) {
        errorTextPhone = 'Phone field is empty';
      } else if (_phoneEditingController.text.length < 9) {
        errorTextPhone = 'The number of the number is not equal to 9';
      } else {
        errorTextPhone = null;
      }
      errorTextPassword = _passwordEditingController.text.isEmpty
          ? 'Password field is empty'
          : null;
    });
  }
}
