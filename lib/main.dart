// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// You can read about packages here: https://flutter.dev/using-packages/
import 'package:category_route_list/login.dart';
import 'package:flutter/material.dart';
import 'package:category_route_list/category_route.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';

// TODO: Import the CategoryRoute widget

/// The function that is called when main.dart is run.
/// // @dart=2.9
void main() {
  runApp(const UnitConverterListApp());
}

/// This widget is the root of our application.
///
/// The first screen we see is a list [Categories].
class UnitConverterListApp extends StatelessWidget {
  const UnitConverterListApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Static List',

      // TODO: Instead of pointing to exactly 1 Category widget,
      // our home should now point to an instance of the CategoryRoute widget.
      builder: (context, widget) => ResponsiveWrapper.builder(
          ClampingScrollWrapper.builder(context, widget!),
          maxWidth: 1200,
          minWidth: 480,
          defaultScale: true,
          breakpoints: [
            ResponsiveBreakpoint.resize(480, name: MOBILE),
            ResponsiveBreakpoint.autoScale(800, name: TABLET),
            ResponsiveBreakpoint.resize(1000, name: DESKTOP),
          ],
          background: Container(color: Color(0xFFF5F5F5))),
      home: LoginPage(),
    );
  }
}
