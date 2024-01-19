import 'dart:math';

import 'package:asp/asp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quotantion_app/app/onboarding/interactor/atoms/onboarding_atom.dart';
import 'package:quotantion_app/shared/interactor/atoms/currency_atom.dart';
import 'package:quotantion_app/shared/constants.dart';

class SelectedCurrency extends StatelessWidget {
  const SelectedCurrency({super.key, required this.onTap});

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    final currentCurrency = context.select(() => currentCurrencyAtom.value);
    return Column(
      children: [
        const Text(
          "Selecione sua moeda",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            color: kGrayColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 12),
        ElevatedButton(
          onPressed: onTap,
          style: ButtonStyle(
            padding: const MaterialStatePropertyAll(EdgeInsets.all(16)),
            elevation: const MaterialStatePropertyAll(0),
            backgroundColor: MaterialStatePropertyAll(kGrayColor.withOpacity(0.06)),
            overlayColor: MaterialStatePropertyAll(kPrimaryColor.withOpacity(0.1)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(99),
                      color: kPrimaryColor.withOpacity(0.2),
                    ),
                    child: SvgPicture.asset(currencyLogo[currentCurrency?.code], width: currentCurrency?.code == "USD" ? 10 : 14),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    currentCurrency?.code ?? "",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: kGrayColor.withOpacity(0.6),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Container(
                    constraints: const BoxConstraints(minHeight: 28, minWidth: 0.2),
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    color: kGrayColor,
                  ),
                  Text(
                    currentCurrency?.name ?? "",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Transform.rotate(
                  angle: pi / 2,
                  child: SvgPicture.asset('lib/assets/icons/arrow.svg'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
