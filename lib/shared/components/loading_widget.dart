import 'package:flutter/material.dart';
import 'package:quotantion_app/shared/constants.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: kGrayColor.withOpacity(0.06),
      radius: 24,
      child: const Padding(
        padding: EdgeInsets.all(12),
        child: CircularProgressIndicator(
          color: kPrimaryColor,
          strokeWidth: 3,
        ),
      ),
    );
  }
}
