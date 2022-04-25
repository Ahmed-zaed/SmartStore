import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/Mixin/mixinsnackbare.dart';
import 'package:untitled2/Widgets/botton.dart';

import '../../Widgets/textfiledcode.dart';

class ValidationCode extends StatefulWidget {
  final String phone;

  const ValidationCode({Key? key, required this.phone}) : super(key: key);

  @override
  State<ValidationCode> createState() => _ValidationCodeState();
}

late TextEditingController _numberOneEditingController;
late TextEditingController _numberTowEditingController;
late TextEditingController _numberThreeEditingController;
late TextEditingController _numberForeEditingController;
late FocusNode _numberOneFocusNode;
late FocusNode _numberTowFocusNode;
late FocusNode _numberThreeFocusNode;
late FocusNode _numberForeFocusNode;

String _code = '';

class _ValidationCodeState extends State<ValidationCode> with Helper {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _numberOneEditingController = TextEditingController();
    _numberTowEditingController = TextEditingController();
    _numberThreeEditingController = TextEditingController();
    _numberForeEditingController = TextEditingController();
    _numberOneFocusNode = FocusNode();
    _numberThreeFocusNode = FocusNode();
    _numberTowFocusNode = FocusNode();
    _numberForeFocusNode = FocusNode();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _numberOneEditingController.dispose();
    _numberTowEditingController.dispose();
    _numberThreeEditingController.dispose();
    _numberForeEditingController.dispose();

    _numberOneFocusNode.dispose();
    _numberTowFocusNode.dispose();
    _numberThreeFocusNode.dispose();
    _numberForeFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
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
            Container(
              alignment: AlignmentDirectional.center,
              margin: const EdgeInsets.symmetric(vertical: 104),
              child: const Text(
                'Validation code',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                  color: Color(0xff278EF8),
                ),
              ),
            ),
            const SizedBox(
              height: 28,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFiledCode(
                    onChange: (String value) {
                      if (value.isNotEmpty) {
                        _numberTowFocusNode.requestFocus();
                      }
                    },
                    controller: _numberOneEditingController,
                    focusNode: _numberOneFocusNode),
                TextFiledCode(
                    controller: _numberTowEditingController,
                    focusNode: _numberTowFocusNode,
                    onChange: (String value) {
                      if (value.isNotEmpty) {
                        _numberThreeFocusNode.requestFocus();
                      } else {
                        _numberOneFocusNode.requestFocus();
                      }
                    }),
                TextFiledCode(
                    controller: _numberThreeEditingController,
                    focusNode: _numberThreeFocusNode,
                    onChange: (String value) {
                      if (value.isNotEmpty) {
                        _numberForeFocusNode.requestFocus();
                      } else {
                        _numberTowFocusNode.requestFocus();
                      }
                    }),
                TextFiledCode(
                    controller: _numberForeEditingController,
                    focusNode: _numberForeFocusNode,
                    onChange: (String value) {
                      if (value.isEmpty) {
                        _numberThreeFocusNode.requestFocus();
                      }
                    }),
              ],
            ),
            const SizedBox(
              height: 47,
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Resend ?',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto'),
              ),
            ),
            const SizedBox(
              height: 57,
            ),
            Button(
                title: 'Submit',
                onPressed: () {
                  checkCode();
                }),
          ],
        ),
      ),
    );
  }

  bool checkEmptyFiled() {
    if (_numberOneEditingController.text.isNotEmpty &&
        _numberTowEditingController.text.isNotEmpty &&
        _numberThreeEditingController.text.isNotEmpty &&
        _numberForeEditingController.text.isNotEmpty) {
      return true;
    } else {
      showSnackBare(context,
          message: 'Something went wrong with the code fields',
          visibility: true);
      return false;
    }
  }

  void checkCode() {
    String numberOne = _numberOneEditingController.text.toString();
    String numberTow = _numberTowEditingController.text.toString();
    String numberThree = _numberThreeEditingController.text.toString();
    String numberFore = _numberForeEditingController.text.toString();
    if (checkEmptyFiled()) {
      _code = numberOne + numberTow + numberThree + numberFore;
    }
  }
}
