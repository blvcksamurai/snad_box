import 'package:flutter/material.dart';

import '../constants.dart';

class CustomIconButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final IconData icon;
  const CustomIconButton({
    this.onPressed,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 40,
        width: 40,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: kIconButtonColor, borderRadius: BorderRadius.circular(10)),
        child: Icon(
          icon,
          size: 20,
        ),
      ),
    );
  }
}
