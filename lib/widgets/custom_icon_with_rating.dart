import 'package:flutter/material.dart';

import '../utils/constants.dart';

class CustomIconRating extends StatelessWidget {
  final VoidCallback? onPressed;
  final IconData icon;
  final Color? bgColor;
  final double rating;
  const CustomIconRating({
    this.onPressed,
    required this.icon,
    super.key,
    this.bgColor = kIconButtonColor,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 54,
        height: 26,
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
        decoration: BoxDecoration(
            color: bgColor, borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Icon(
              icon,
              size: 20,
            ),
            Text(
              rating.toString(),
              style: kPriceTextStyle,
            )
          ],
        ),
      ),
    );
  }
}
