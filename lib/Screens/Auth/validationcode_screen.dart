import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

class _ValidationCodeState extends State<ValidationCode> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _numberOneEditingController = TextEditingController();
    _numberTowEditingController = TextEditingController();
    _numberThreeEditingController = TextEditingController();
    _numberForeEditingController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _numberOneEditingController.dispose();
    _numberTowEditingController.dispose();
    _numberThreeEditingController.dispose();
    _numberForeEditingController.dispose();

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
            SizedBox(
              height: 28,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFiledCode(controller: _numberOneEditingController),
                TextFiledCode(controller: _numberTowEditingController),
                TextFiledCode(controller: _numberThreeEditingController),
                TextFiledCode(controller: _numberForeEditingController),
              ],
            ),
            SizedBox(
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
            Button(title: 'Submit', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
