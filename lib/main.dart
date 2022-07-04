import 'package:flutter/material.dart';
import 'package:innlab_bloc_test_example/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color.fromRGBO(15, 11, 33, 1),
      ),
      home: HomePage(),
    );
  }
}
