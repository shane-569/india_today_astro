import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:india_today_astro/bloc/categories_bloc/categories_bloc.dart';
import 'package:india_today_astro/bloc/categories_bloc/categories_state.dart';
import 'package:india_today_astro/config/app_routes.dart';
import 'package:india_today_astro/repository/api_repository.dart';
import 'package:india_today_astro/views/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                CategoriesBloc(CategoriesInitialStates(), Repository())),
      ],
      child: MaterialApp(
        title: 'DMS Picklite',
        theme: ThemeData(primarySwatch: Colors.purple, fontFamily: "Brandon"),
        onGenerateRoute: generateRoute,
        initialRoute: '/',
      ),
    );
  }
}
