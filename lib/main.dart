import 'package:flutter/material.dart';
import 'package:pratice_ui_1/constants/colors.dart';
import 'package:pratice_ui_1/provider/advertisement.dart';
import 'package:pratice_ui_1/screens/home_screen.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => WritingProvider(),
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: redColor,
          ),
          home: const HomeScreen()));
}
