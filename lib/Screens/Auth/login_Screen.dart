import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Models/cety_model.dart';
import '../../Widgets/botton.dart';
import '../../Widgets/textcontainer.dart';
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
int _count = 0;
List<City> _citys = <City>[
  City(id: 1, name: 'Gaza'),
  City(id: 2, name: 'Rafah'),
  City(id: 1, name: 'DerAlpalah'),
  City(id: 2, name: 'Remal'),
  City(id: 1, name: 'Khosaa'),
  City(id: 2, name: 'Nsirate'),
  City(id: 1, name: 'AlZahra'),
  City(id: 2, name: 'AlPrege'),
  City(id: 1, name: 'Moghraga'),
  City(id: 2, name: 'AlShohada'),
];
String? _selectedCitys;

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
            height: 200,
            width: 200,
          ),
          TextFiled(
              textType: TextInputType.text,
              errorText: errorText_name,
              hint: 'Name',
              suffix: const Icon(Icons.person),
              controller: _nameEditingController,
              obscureText: false),
          TextFiled(
              textPrefix: '+972-',
              textType: TextInputType.phone,
              errorText: errorText_phone,
              hint: 'Phone Number',
              suffix: const Icon(Icons.phone),
              controller: _phoneEditingController,
              obscureText: false),
          TextFiled(
              textType: TextInputType.text,
              errorText: errorText_Password,
              hint: 'Password',
              suffix: const Icon(
                Icons.visibility_off,
              ),
              controller: _passwordEditingController,
              obscureText: true),
          Container(
            height: 50,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Gender'),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          setState(() {
                            _count == 0 ? _count++ : _count--;
                          });
                        },
                        child: TextContainer(
                          genderName: 'Male',
                          color: _count == 1
                              ? const Color(0xff007DFD)
                              : Colors.transparent,
                          count: _count,
                          textcolor: _count == 1
                              ? Colors.white
                              : const Color(0xff717171),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            _count == 1 || _count == 0
                                ? _count = 2
                                : _count = 0;
                          });
                        },
                        child: TextContainer(
                          genderName: 'Female',
                          color: _count == 2
                              ? const Color(0xff007DFD)
                              : Colors.transparent,
                          count: _count,
                          textcolor: _count == 2
                              ? Colors.white
                              : const Color(0xff717171),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: const Color(0xffC1C1C1)),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          const SizedBox(
            height: 7,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: DropdownButton<String>(
              underline: const Divider(
                color: Colors.transparent,
              ),
              borderRadius: BorderRadius.circular(8),
              icon: const Icon(Icons.location_on_rounded),
              value: _selectedCitys,
              hint: const Text('Text Select City'),
              isExpanded: true,
              items: _citys
                  .map(
                    (City city) => DropdownMenuItem<String>(
                      child: Row(
                        children: [
                          const Icon(
                            Icons.circle,
                            color: Color(0xff007DFD),
                            size: 12,
                          ),
                          Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(city.name)),
                        ],
                      ),
                      value: city.name.toString(),
                    ),
                  )
                  .toList(),
              onChanged: (String? value) {
                if (value != null) {
                  setState(() {
                    _selectedCitys = value;
                  });
                }
              },
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xffC1C1C1), width: 1),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Button(
            title: 'Sign up',
            onPressed: () {},
          ),
          const SizedBox(
            height: 32,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Already have an account?',
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Sign in',
                  style: TextStyle(color: Color(0xff007DFD), fontSize: 16),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
