import 'package:design_project/UI/home.dart';
import 'package:flutter/material.dart';

void main() {
   WidgetsFlutterBinding.ensureInitialized();
  //SizeUtils.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePageScreen(),
    );
  }
}
