// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:category_route_list/category.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:category_route_list/JobsListView.dart';

// TODO: Check if we need to import anything

// TODO: Define any constants
final _backgroundColor = Colors.green[100];
String _email='';
/// Category Route (screen).
///
/// This is the 'home' screen of the Unit Converter. It shows a header and
/// a list of [Categories].
///
/// While it is named CategoryRoute, a more apt name would be CategoryScreen,
/// because it is responsible for the UI at the route's destination.
class CategoryRoute extends StatelessWidget{
  CategoryRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  return MaterialApp(
  home: CategoryRouteFull(),
  );
  }

}
class CategoryRouteFull extends StatefulWidget {


  @override
  _CategoryState createState() {
    // TODO: implement createState
    return _CategoryState();
  }
}

class _CategoryState extends State<CategoryRouteFull>{
  String _email = '';
  static const _categoryNames = <String>[
    'Length',
    'Area',
    'Volume',
    'Mass',
    'Time',
    'Digital Storage',
    'Energy',
    'Currency',
  ];

  static const _baseColors = <Color>[
    Colors.teal,
    Colors.orange,
    Colors.pinkAccent,
    Colors.blueAccent,
    Colors.yellow,
    Colors.greenAccent,
    Colors.purpleAccent,
    Colors.red,
  ];
  Widget _buildCategoryWidgets(List<Widget> categories) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) => categories[index],
      itemCount: categories.length,
    );
  }
  @override
  void initState() {
    super.initState();
    _loadData();
  }

  _loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _email = (prefs.getString('name') ?? '');
    });
  }
  @override
  Widget build(BuildContext context) {
    final categories = <Category>[];


    for (var i = 0; i < _categoryNames.length; i++) {
      categories.add(Category(
        name: _categoryNames[i],
        color: _baseColors[i] as ColorSwatch<dynamic>,
        iconLocation: Icons.cake,
      ));
    }

    final listView = Container(
      color: _backgroundColor,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: _buildCategoryWidgets(categories),
    );

    final appBar = AppBar(
      elevation: 0.0,
      title:  Text(
        _email.toString(),

      ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(
            Icons.search,
            semanticLabel: 'search',
          ),
          onPressed: () {
            print('Search button');
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  JobsListView()),
            );
          },
        ),],
      centerTitle: true,

    );



    return Scaffold(
      appBar: appBar,
      body: listView,
    );
  }
}