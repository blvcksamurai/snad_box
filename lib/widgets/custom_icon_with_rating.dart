import 'package:flutter/material.dart';

import '../utils/constants.dart';

class CustomIconRating extends StatelessWidget {
  final VoidCallback? onPressed;
  final IconData icon;
  final Color? bgColor;
  final double rating;
  final double? size;
  const CustomIconRating({
    this.onPressed,
    required this.icon,
    super.key,
    this.bgColor = kIconButtonColor,
    required this.rating,
    this.size = 16,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 26,
        padding: const EdgeInsets.symmetric(horizontal: 5),
        constraints: const BoxConstraints(
          minWidth: 1,
          maxWidth: 50,
        ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: bgColor, borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Icon(
              icon,
              size: 16,
            ),
            const SizedBox(width: 5),
            Text(
              rating.toString(),
              style: kRatingTextStyle,
            )
          ],
        ),
      ),
    );
  }
}
