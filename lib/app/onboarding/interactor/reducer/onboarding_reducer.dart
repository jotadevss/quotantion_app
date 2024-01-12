// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:asp/asp.dart';
import 'package:quotantion_app/app/onboarding/interactor/atoms/onboarding_atom.dart';
import 'package:quotantion_app/app/onboarding/interactor/states/onboarding_state.dart';

import 'package:quotantion_app/core/data/contracts/currency_repository.dart';

class OnboardingReducer extends Reducer {
  final ICurrencyRepository repository;
  OnboardingReducer({required this.repository}) {
    on(() => [fetchCurrenciesAction], _fetchCurrencies);
  }

  void _fetchCurrencies() async {
    onboardingState.value = LoadingOnboardingState();
    final res = await repository.fetch();
    res.fold((currencies) => onboardingState.value = SuccessOnboardingState(currencies: currencies), (_) => _);
  }
}
