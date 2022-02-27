// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:india_today_astro/views/home_main_view.dart';
import 'package:india_today_astro/views/home_screen.dart';
import 'package:india_today_astro/views/profile_view.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  print(settings.name);
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (_) => HomeMainView());
    case '/profile':
      return MaterialPageRoute(builder: (_) => ProfileView());

    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}')),
              ));
  }
}
