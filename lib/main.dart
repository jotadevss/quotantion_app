import 'package:asp/asp.dart';
import 'package:flutter/material.dart';
import 'package:quotantion_app/core/data/api/dio_currency_repository.dart';

void main() {
  runApp(const RxRoot(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    DioCurrencyRepository().fetch();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Qanelas'),
    );
  }
}
