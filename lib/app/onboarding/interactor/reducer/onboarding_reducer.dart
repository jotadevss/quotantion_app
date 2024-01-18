// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:asp/asp.dart';
import 'package:flutter/material.dart';

import 'package:quotantion_app/app/onboarding/interactor/atoms/onboarding_atom.dart';
import 'package:quotantion_app/app/onboarding/interactor/states/onboarding_state.dart';
import 'package:quotantion_app/core/data/contracts/currency_repository.dart';
import 'package:quotantion_app/core/data/prefs/currency_prefs_repository.dart';
import 'package:quotantion_app/core/models/currency.dart';
import 'package:quotantion_app/shared/atoms/currency_atom.dart';

class OnboardingReducer extends Reducer {
  final ICurrencyRepository repository;
  OnboardingReducer({
    required this.repository,
  }) {
    on(() => [fetchCurrenciesAction], _fetchCurrencies);
    on(() => [selectCurrencyAction], selectCurrency);
  }

  void _fetchCurrencies() async {
    onboardingState.value = LoadingOnboardingState();
    final res = await repository.fetch();
    res.fold((currencies) async {
      List<Currency> selected = [];

      for (var currency in currencies) {
        final data = currencyLogo[currency.code];

        if (data != null) {
          selected.add(currency);
        }

        if (currency.code == "BRL") {
          await CurrencyPrefs.saveCurrentCurrency(currency);
          currentCurrencyAtom.value = currency;
        }
      }
      await CurrencyPrefs.saveCachingCurrency(selected);
      await CurrencyPrefs.getCachingCurrency();
      onboardingState.value = SuccessOnboardingState(currencies: selected);
    }, (_) => _);
  }

  void selectCurrency() async {
    final selectedCurrency = selectCurrencyAction.value!;
    onboardingState.value = LoadingOnboardingState();
    await Future.delayed(const Duration(milliseconds: 700));
    await CurrencyPrefs.saveCurrentCurrency(selectedCurrency);
    currentCurrencyAtom.value = selectedCurrency;
    final currencies = await CurrencyPrefs.getCachingCurrency();
    onboardingState.value = SuccessOnboardingState(currencies: currencies);
  }
}
