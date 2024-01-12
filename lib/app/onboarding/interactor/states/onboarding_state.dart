// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:quotantion_app/core/models/currency.dart';

abstract class OnboardingState {}

class InitOnboardingState extends OnboardingState {}

class SuccessOnboardingState extends OnboardingState {
  final List<Currency> currencies;
  SuccessOnboardingState({required this.currencies});
}

class LoadingOnboardingState extends OnboardingState {}
