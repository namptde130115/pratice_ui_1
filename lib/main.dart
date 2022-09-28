import 'package:flutter/material.dart';
import 'package:pratice_ui_1/models/advertisement.dart';
import 'package:pratice_ui_1/provider/advertisement.dart';
import 'package:pratice_ui_1/screens/first_screen.dart';
import 'package:pratice_ui_1/screens/second_screen.dart';
import 'package:pratice_ui_1/services/advertisement.dart';
import 'package:pratice_ui_1/widget/bottomnavigate.dart';
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
            primarySwatch: Colors.red,
          ),
          home: const HomeScreen()));
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  List<Advertisement>? advertisements;
  var isLoaded = false;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();

    //fetch data from API
    getData();
  }

  getData() async {
    advertisements = await AdvertisementService().getAdvertisement();
    if (advertisements != null) {
      setState(() {
        isLoaded = true;
      });
    }
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
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.of(context).pop(),
              ),
              title: const Text('Hướng dẫn'),
              centerTitle: true,
            )
          : null,
      body: widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
              textTheme: Theme.of(context)
                  .textTheme
                  .copyWith(caption: const TextStyle(color: Colors.black))),
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30), topLeft: Radius.circular(30)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black38, spreadRadius: 0, blurRadius: 10),
              ],
            ),
            child: BottomNavigate(
              selectedIndex: _selectedIndex,
              onItemTapped: _onItemTapped,
            ),
          )),
    );
  }
}
