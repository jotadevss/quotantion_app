import 'package:asp/asp.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const RxRoot(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Qanelas'),
    );
  }
}
