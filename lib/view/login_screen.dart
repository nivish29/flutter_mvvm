import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/utils/Routes/routes_name.dart';

import '../utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  FocusNode emailFocusNode =
      FocusNode(); //focus node is used to shift the cursor to the next edit text when pressed enter
  FocusNode passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Center(
            //     child: InkWell(
            //         onTap: () {
            //
            //           Utils.flushBarErrorMessage(
            //               'No internet Connection', context);
            //         },
            //         child: Text('Click'))),
            TextFormField(
              controller: _emailController,
              focusNode: emailFocusNode,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                hintText: 'Email',
                labelText: 'Email',
                prefixIcon: Icon(Icons.email),
                suffixIcon: Icon(Icons.visibility_off_outlined),
              ),
              onFieldSubmitted: (value) {
                FocusScope.of(context).requestFocus(passwordFocusNode);
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              focusNode: passwordFocusNode,
              obscureText: true,
              controller: _passwordController,
              obscuringCharacter: '*',
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                hintText: 'Password',
                labelText: 'Password',
                prefixIcon: Icon(Icons.password),
                suffixIcon: Icon(Icons.visibility_off_outlined),
              ),
              onFieldSubmitted: (value) {
                FocusScope.of(context).requestFocus();
              },
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                  child: Text(
                'Submit',
                style: TextStyle(color: Colors.white),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
