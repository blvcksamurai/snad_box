import 'package:flutter/material.dart';

import '../constants.dart';

class CustomButton extends StatelessWidget {
  final String text;
  double? iconSize;
  CustomButton({
    super.key,
    this.iconSize,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 382,
      height: 64,
      decoration: BoxDecoration(
          color: kButtonColor, borderRadius: BorderRadius.circular(80)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            text,
            style: const TextStyle(
              color: Color(0xFF0A0A0A),
              fontFamily: 'Gsa',
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 3),
          Icon(
            Icons.arrow_forward,
            size: iconSize,
          ),
        ],
      ),
    );
  }
}
