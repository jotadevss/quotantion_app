import 'package:asp/asp.dart';
import 'package:quotantion_app/app/onboarding/interactor/states/onboarding_state.dart';

// State
final onboardingState = Atom<OnboardingState>(InitOnboardingState());

// Action
final fetchCurrenciesAction = Atom.action();
