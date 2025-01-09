import 'package:flutter/material.dart';

import '../utils/constants.dart';
import 'custom_icon_button.dart';

class LargeTextWithIcon extends StatelessWidget {
  final String headerTitle;
  final VoidCallback? onPressed;
  const LargeTextWithIcon({
    super.key,
    required this.headerTitle,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            headerTitle,
            style: kBigTextStyle,
          ),
          CustomIconButton(
            icon: Icons.arrow_forward_ios,
            onPressed: onPressed,
          )
        ],
      ),
    );
  }
}
