import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quotantion_app/app/onboarding/interactor/atoms/onboarding_atom.dart';
import 'package:quotantion_app/shared/constants.dart';
import 'package:quotantion_app/shared/interactor/atoms/currency_atom.dart';

class AppBarHome extends StatelessWidget {
  const AppBarHome({
    super.key,
    required this.onSelect,
    required this.onRefresh,
  });

  final void Function() onSelect;
  final void Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(99),
          overlayColor: MaterialStatePropertyAll(kPrimaryColor.withOpacity(0.1)),
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xffF2F2F2)),
              borderRadius: BorderRadius.circular(99),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: kPrimaryColor.withOpacity(0.1),
                  child: SvgPicture.asset(currencyLogo[currentCurrency?.code ?? "BRL"], width: 16),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      currentCurrency!.name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      currentCurrency!.code,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        height: 0,
                        fontSize: 10,
                        color: kGrayColor.withOpacity(0.4),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 16),
                SvgPicture.asset('lib/assets/icons/arrow.svg', width: 12),
                const SizedBox(width: 12),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: onRefresh,
          borderRadius: BorderRadius.circular(99),
          overlayColor: MaterialStatePropertyAll(kPrimaryColor.withOpacity(0.1)),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xffF2F2F2)),
              borderRadius: BorderRadius.circular(99),
            ),
            child: SvgPicture.asset('lib/assets/icons/refresh.svg'),
          ),
        )
      ],
    );
  }
}
