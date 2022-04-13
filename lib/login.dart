// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:category_route_list/category_route.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();


  final _unfocusedColor = Colors.grey[600];
  final _usernameFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 120.0),
            // TODO: Wrap Username with AccentColorOverride (103)
            // TODO: Remove filled: true values (103)
            TextFormField(
              controller: _usernameController,
              decoration:  InputDecoration(
                labelText: 'Username',
                labelStyle: TextStyle(
                    color: _usernameFocusNode.hasFocus
                        ? Theme.of(context).colorScheme.secondary
                        : _unfocusedColor),
              ),
              focusNode: _usernameFocusNode,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter username';
                }
                return null;},

            ),
            const SizedBox(height: 12.0),
            // TODO: Wrap Password with AccentColorOverride (103)
            TextFormField(
              controller: _passwordController,
              decoration:  InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(
                    color: _passwordFocusNode.hasFocus
                        ? Theme.of(context).colorScheme.secondary
                        : _unfocusedColor),
              ),
              focusNode: _passwordFocusNode,
    validator: (value) {
    if (value == null || value.isEmpty) {
    return 'Please enter password';
    }
    return null;},
              obscureText: true,
            ),
            ButtonBar(
              children: <Widget>[
                // TODO: Add a beveled rectangular border to CANCEL (103)

                // TODO: Add an elevation to NEXT (103)
                // TODO: Add a beveled rectangular border to NEXT (103)
                ElevatedButton(
                  child: const Text('Login'),
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(8.0),
                    shape: MaterialStateProperty.all(
                      const BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(7.0)),
                      ),
                    ),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      prefs.setString('name', _usernameController.text);
                      prefs.setString('password', _passwordController.text);
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (BuildContext ctx) => CategoryRoute()));

                    }

                  },

                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _usernameFocusNode.addListener(() {
      setState(() {
        //Redraw so that the username label reflects the focus state
      });
    });
    _passwordFocusNode.addListener(() {
      setState(() {
        //Redraw so that the password label reflects the focus state
      });
    });
  }
}

// TODO: Add AccentColorOverride (103)
