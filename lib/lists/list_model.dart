import 'package:ui/categoryPage/beef_page.dart';
import 'package:ui/categoryPage/chicken_page.dart';
import 'package:ui/categoryPage/dessert_page.dart';
import 'package:ui/categoryPage/egg_page.dart';
import 'package:ui/categoryPage/fish_page.dart';
import 'package:ui/categoryPage/pork_page.dart';
import 'package:ui/categoryPage/rice_page.dart';
import 'package:ui/categoryPage/sea_foodpage.dart';
import 'package:ui/categoryPage/soup_page.dart';
import 'package:ui/categoryPage/vegetable_page.dart';

import '../dietPage/arthritis_page.dart';
import '../dietPage/diabetic_page.dart';
import '../dietPage/standard_page.dart';
import '../dietPage/vegan_page.dart';
import '../dietPage/weight_page.dart';

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

// home banner carousel images
const List homeBannerImage = [
  'assets/home_carousel/home_banner.png',
  'assets/home_carousel/home_banner2.png',
  'assets/home_carousel/home_banner3.png',
  'assets/home_carousel/home_banner4.png',
];
