import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quotantion_app/shared/constants.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset('lib/assets/icons/logo.svg'),
        const Text(
          "Cotação Hoje",
          style: TextStyle(
            fontSize: 24,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        const SizedBox(
          width: 280,
          child: Text(
            "Acompanhe o preço das moedas mais valiosas do mundo em tempo real.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: kGrayColor,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
