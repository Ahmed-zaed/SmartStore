import 'package:flutter/material.dart';
import 'package:untitled2/Screens/Auth/validationcode_screen.dart';
import 'package:untitled2/Widgets/botton.dart';
import 'package:untitled2/Widgets/textfiled.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

late TextEditingController _phoneEditingController;
String? errorPhone;

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _phoneEditingController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _phoneEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
          children: [
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black38,
                ),
              ),
            ),
            Image.asset(
              'images/lock.png',
              width: 260,
              height: 260,
            ),
            const SizedBox(
              height: 39,
            ),
            TextFiled(
              hint: 'PhoneNumber',
              controller: _phoneEditingController,
              suffix: const Icon(Icons.phone),
              textType: TextInputType.phone,
              errorText: errorPhone,
              textPrefix: '+972-',
              helperText: '567390091',
              maxLingth: 9,
            ),
            const SizedBox(
              height: 25,
            ),
            Button(
              title: 'Send',
              onPressed: () {
                sendCode();
              },
            ),
          ],
        ),
      ),
    );
  }

  void sendCode() {
    if (checkEmpty()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              ValidationCode(phone: _phoneEditingController.text.toString()),
        ),
      );
    }
  }

  bool checkEmpty() {
    if (_phoneEditingController.text.isNotEmpty &&
        _phoneEditingController.text.length == 9) {
      checkErrorFiled();
      return true;
    } else {
      checkErrorFiled();
      return false;
    }
  }

  void checkErrorFiled() {
    setState(() {
      if (_phoneEditingController.text.isEmpty) {
        errorPhone = 'Phone field is empty';
      } else if (_phoneEditingController.text.length < 9) {
        errorPhone = 'The number of the number is not equal to 9';
      } else {
        errorPhone = null;
      }
    });
  }
}
