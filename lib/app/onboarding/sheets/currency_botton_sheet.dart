import 'package:asp/asp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quotantion_app/app/onboarding/interactor/atoms/onboarding_atom.dart';
import 'package:quotantion_app/app/onboarding/interactor/states/onboarding_state.dart';
import 'package:quotantion_app/app/onboarding/sheets/components/currency_item.dart';
import 'package:quotantion_app/shared/constants.dart';
import 'package:routefly/routefly.dart';

class CurrencyBottomSheet extends StatelessWidget {
  const CurrencyBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final state = context.select(() => onboardingState.value);
    return Container(
      height: MediaQuery.of(context).size.height / 1.8,
      width: double.infinity,
      padding: const EdgeInsets.all(26),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Selecione sua moeda",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextButton(
                onPressed: () => Routefly.pop(context),
                style: ButtonStyle(overlayColor: MaterialStatePropertyAll(kPrimaryColor.withOpacity(0.1))),
                child: const Text(
                  "fechar",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: kPrimaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          (state is SuccessOnboardingState)
              ? Expanded(
                  child: ListView.builder(
                    itemCount: currencyLogo.length,
                    itemBuilder: (context, index) {
                      final currency = state.currencies[index];
                      return CurrencyItem(
                        logo: SvgPicture.asset(currencyLogo[currency.code]!),
                        title: currency.name,
                        code: currency.code,
                        onSelect: () {
                          selectCurrencyAction.value = currency;
                          Routefly.pop(context);
                        },
                      );
                    },
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
