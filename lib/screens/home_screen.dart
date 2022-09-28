import 'package:pratice_ui_1/constants/colors.dart';
import 'package:pratice_ui_1/screens/first_screen.dart';
import 'package:pratice_ui_1/screens/second_screen.dart';
import 'package:pratice_ui_1/widget/bottomnavigate.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    const List widgetOptions = [
      FirstScreen(),
      SecondScreen(),
    ];

    return Scaffold(
      appBar: _selectedIndex == 0
          ? AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: whiteColor),
                onPressed: () => Navigator.of(context).pop(),
              ),
              title: const Text('Hướng dẫn'),
              centerTitle: true,
            )
          : null,
      body: widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigate(
        onItemTapped: _onItemTapped,
        selectedIndex: _selectedIndex,
      ),
    );
  }
}
