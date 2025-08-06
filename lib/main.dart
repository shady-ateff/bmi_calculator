import 'package:bmi_calculator/pages/b_m_i_home_screen.dart';
import 'package:bmi_calculator/widgets/info_card.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: BMIHomeScreen());
  }
}
