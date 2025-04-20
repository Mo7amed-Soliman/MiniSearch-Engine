import 'package:flutter/material.dart';
import 'package:search_engine/utils/constants.dart';
import 'package:search_engine/views/search_view.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _themeData(context),
      home: const SearchView(),
    );
  }

  ThemeData _themeData(context) => ThemeData.dark(
        useMaterial3: true,
      ).copyWith(
        scaffoldBackgroundColor: bgColor,
        canvasColor: secondaryColor,
      );
}
