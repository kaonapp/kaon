// ignore_for_file: depend_on_referenced_packages, unused_local_variable, no_leading_underscores_for_local_identifiers, unused_import

import 'package:flutter/material.dart';
import 'package:ui/categoryPage/chickenpage.dart';
import 'package:ui/categorypage.dart';
import 'package:ui/homepage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ui/searchpage.dart';
import 'package:ui/views/onboarding_page.dart';
import 'filteringpage.dart';
import 'firebase_options.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FlutterNativeSplash.remove();
  runApp(const MyApp());
}

void initialization(BuildContext? context) async {
  // This is where you can initialize the resources needed by your app while
  // the splash screen is displayed.  Remove the following example because
  // delaying the user experience is a bad design practice!
  // ignore_for_file: avoid_print

  await Future.delayed(const Duration(seconds: 3));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // int _selectedIndex = 0;

  // final List<Widget> _pages = const [HomePage(), SearchPage(), FilterPage()];

  TextStyle optionStyle =
      const TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  @override
  // void initState() {
  //   super.initState();
  //   initialization();
  // }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final List<Widget> _widgetOptions = <Widget>[
      Text(
        'Index 0: Home',
        style: optionStyle,
      ),
      Text(
        'Index 2: School',
        style: optionStyle,
      ),
      Text(
        'Index 3: wawaweewa',
        style: optionStyle,
      ),
    ];

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const Scaffold(body: HomePage()
          //OnboardingPage(),
          //     _pages[_selectedIndex],
          // bottomNavigationBar: BottomNavigationBar(
          //   items: const [
          //     BottomNavigationBarItem(
          //       icon: Icon(Icons.home),
          //       label: 'Home',
          //     ),
          //     BottomNavigationBarItem(
          //       icon: Icon(Icons.search),
          //       label: 'Search',
          //     ),
          //     BottomNavigationBarItem(
          //       icon: Icon(Icons.food_bank),
          //       label: 'Filter',
          //     ),
          //   ],
          //   currentIndex: _selectedIndex,
          //   onTap: (int index) {
          //     setState(
          //       () {
          //         _selectedIndex = index;
          //       },
          //     );
          //   },
          // ),
          ),
    );
  }
}
