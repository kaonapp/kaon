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
  'assets/banners/health_options_banner/standard.png',
  'assets/banners/health_options_banner/weight.png',
  'assets/banners/health_options_banner/arthritis.png',
  'assets/banners/health_options_banner/diabetic.png',
  'assets/banners/health_options_banner/vegan.png',
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
  'Rice and alt.',
  'Vegetable',
  'Dessert',
  'Seafood',
];

// list of category images
const List categoryImage = [
  'assets/banners/category_banner/chicken.jpg',
  'assets/banners/category_banner/beef.jpg',
  'assets/banners/category_banner/egg.jpg',
  'assets/banners/category_banner/fish.jpg',
  'assets/banners/category_banner/pork.jpg',
  'assets/banners/category_banner/soup.jpg',
  'assets/banners/category_banner/rice.jpg',
  'assets/banners/category_banner/vegetables.jpg',
  'assets/banners/category_banner/dessert.jpg',
  'assets/banners/category_banner/seafood.jpg',
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
