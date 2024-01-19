import 'package:flutter/material.dart';
import 'package:quotantion_app/shared/constants.dart';

class NextButton extends StatelessWidget {
  const NextButton({super.key, required this.onTap});

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: const ButtonStyle(
        padding: MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 24, horizontal: 52)),
        backgroundColor: MaterialStatePropertyAll(kBlackColor),
        overlayColor: MaterialStatePropertyAll(Colors.black26),
      ),
      child: const Text(
        "Continuar",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
