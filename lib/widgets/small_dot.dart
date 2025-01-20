import 'package:flutter/material.dart';

class kSmallDot extends StatelessWidget {
  const kSmallDot({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5,
      width: 5,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration:
          const BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
    );
  }
}
