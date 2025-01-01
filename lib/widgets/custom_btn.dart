import 'package:flutter/material.dart';

import '../constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 382,
      height: 64,
      decoration: BoxDecoration(
          color: kButtonColor, borderRadius: BorderRadius.circular(80)),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Get Started  ',
            style: TextStyle(
              color: Color(0xFF0A0A0A),
              fontFamily: 'Gsa',
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          Icon(Icons.arrow_forward, size: 0),
        ],
      ),
    );
  }
}
