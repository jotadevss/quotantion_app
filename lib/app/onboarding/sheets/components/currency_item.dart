import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quotantion_app/shared/constants.dart';

class CurrencyItem extends StatelessWidget {
  const CurrencyItem({
    super.key,
    required this.onSelect,
    required this.title,
    required this.code,
    required this.logo,
  });

  final void Function() onSelect;
  final String title;
  final String code;
  final Widget logo;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelect,
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    logo,
                    const SizedBox(width: 24),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          code,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            height: 0,
                            fontSize: 12,
                            color: kGrayColor.withOpacity(0.4),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SvgPicture.asset('lib/assets/icons/arrow.svg'),
              ],
            ),
            const SizedBox(height: 12),
            Divider(color: kGrayColor.withOpacity(0.1))
          ],
        ),
      ),
    );
  }
}
