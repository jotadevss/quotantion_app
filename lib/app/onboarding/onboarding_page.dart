import 'package:asp/asp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:quotantion_app/app/onboarding/components/header.dart';
import 'package:quotantion_app/app/onboarding/components/next_button.dart';
import 'package:quotantion_app/app/onboarding/components/select_currency.dart';
import 'package:quotantion_app/app/onboarding/interactor/atoms/onboarding_atom.dart';
import 'package:quotantion_app/app/onboarding/interactor/states/onboarding_state.dart';
import 'package:quotantion_app/app/onboarding/sheets/currency_botton_sheet.dart';
import 'package:quotantion_app/routes.dart';
import 'package:quotantion_app/shared/components/loading_widget.dart';
import 'package:routefly/routefly.dart';

class OnboadingPage extends StatefulWidget {
  const OnboadingPage({super.key});

  @override
  State<OnboadingPage> createState() => _OnboadingPageState();
}

class _OnboadingPageState extends State<OnboadingPage> {
  showCurrencyBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => const CurrencyBottomSheet(),
    );
  }

  @override
  void initState() {
    fetchCurrenciesAction.call();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.select(() => onboardingState.value);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(flex: 3),
                const Header(),
                const Spacer(flex: 1),
                (state is LoadingOnboardingState) ? const LoadingWidget() : SelectedCurrency(onTap: showCurrencyBottomSheet),
                const Spacer(flex: 2),
                NextButton(onTap: () => Routefly.pushNavigate(routePaths.home)),
                const Spacer(flex: 2),
              ].animate().move(duration: 900.ms).fade(),
            ),
          ),
        ),
      ),
    );
  }
}
