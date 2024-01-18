import 'package:asp/asp.dart';
import 'package:flutter/material.dart';
import 'package:quotantion_app/app/onboarding/interactor/reducer/onboarding_reducer.dart';
import 'package:quotantion_app/core/data/api/dio_currency_repository.dart';
import 'package:quotantion_app/routes.dart';
import 'package:routefly/routefly.dart';

void main() {
  runApp(const RxRoot(child: MyApp()));

  OnboardingReducer(repository: DioCurrencyRepository());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Qanelas'),
      routerConfig: Routefly.routerConfig(routes: routes, initialPath: routePaths.onboarding),
    );
  }
}
