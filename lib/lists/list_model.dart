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
