import 'package:flutter/material.dart';

import '../utils/constants.dart';

class CustomIconButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final IconData icon;
  final double? iconSize;
  final Color? bgColor;
  final Color? iconColor;
  const CustomIconButton({
    this.onPressed,
    required this.icon,
    super.key,
    this.bgColor = kIconButtonColor,
    this.iconColor = Colors.black,
    this.iconSize = 16,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 36,
        width: 36,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: bgColor, borderRadius: BorderRadius.circular(10)),
        child: Icon(
          icon,
          size: iconSize,
          color: iconColor,
        ),
      ),
    );
  }
}
