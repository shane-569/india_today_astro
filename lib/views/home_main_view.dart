// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:india_today_astro/views/bottom_navigation_bar.dart';

class HomeMainView extends StatefulWidget {
  const HomeMainView({Key? key}) : super(key: key);

  @override
  _HomeMainViewState createState() => _HomeMainViewState();
}

class _HomeMainViewState extends State<HomeMainView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      debugShowCheckedModeBanner: false,
      home: MottomNavigation(),
    );
  }
}
