import 'package:ui/categoryPage/beefpage.dart';
import 'package:ui/categoryPage/chickenpage.dart';
import 'package:ui/categoryPage/dessertpage.dart';
import 'package:ui/categoryPage/eggpage.dart';
import 'package:ui/categoryPage/fishpage.dart';
import 'package:ui/categoryPage/porkpage.dart';
import 'package:ui/categoryPage/ricepage.dart';
import 'package:ui/categoryPage/seafoodpage.dart';
import 'package:ui/categoryPage/souppage.dart';
import 'package:ui/categoryPage/vegetablepage.dart';

import '../dietPage/arthritispage.dart';
import '../dietPage/diabeticpage.dart';
import '../dietPage/standardpage.dart';
import '../dietPage/veganpage.dart';
import '../dietPage/weightpage.dart';

// all list data

// list of health option
final List<String> healthList = [
  'Standard',
  'Weight-reduction',
  'Arthritis',
  'Diabetic',
  'Vegan',
];

// list of health option images/banner
final List<String> healthImages = [
  'assets/beef.jpg',
  'assets/Chicken.jpg',
  'assets/dessert.jpg',
  'assets/soup.jpg',
  'assets/vegetable.jpg',
];

// list of health option pages
const List healthPages = [
  StandardPage(),
  WeightPage(),
  ArthritisPage(),
  DiabeticPage(),
  VeganPage(),
];

// list of category items
final List<String> categoryList = [
  'Chicken',
  'Beef',
  'Egg',
  'Fish',
  'Pork',
  'Soup',
  'Rice and alternative',
  'Vegetable',
  'Dessert',
  'Seafood',
];

// list of category pages
const List categoryPage = [
  ChickenPage(),
  BeefPage(),
  EggPage(),
  FishPage(),
  PorkPage(),
  SoupPage(),
  RicePage(),
  VegetablePage(),
  DessertPage(),
  SeafoodPage(),
];
