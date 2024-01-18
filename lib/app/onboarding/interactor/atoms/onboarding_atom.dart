import 'package:asp/asp.dart';
import 'package:quotantion_app/app/onboarding/interactor/states/onboarding_state.dart';
import 'package:quotantion_app/core/models/currency.dart';

// State
final onboardingState = Atom<OnboardingState>(InitOnboardingState());

// Getters
Map<String, dynamic> get currencyLogo => {
      "USD": 'lib/assets/icons/dolar.svg',
      "EUR": 'lib/assets/icons/euro.svg',
      "GBP": 'lib/assets/icons/libra.svg',
      "JPY": 'lib/assets/icons/iene.svg',
      "BRL": 'lib/assets/icons/reais.svg',
    };

// Action
final fetchCurrenciesAction = Atom.action();
final selectCurrencyAction = Atom<Currency?>(null);
