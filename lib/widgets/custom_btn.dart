import 'package:flutter/material.dart';

import '../utils/constants.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool enabled;
  IconData? icon;
  double? iconSize;
  CustomButton({
    super.key,
    this.icon,
    this.iconSize,
    required this.text,
    this.onPressed,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: enabled ? 1.0 : 0.5,
      child: InkWell(
        onTap: enabled ? onPressed : null,
        child: Container(
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
              if (icon != null) ...[
                // Check if icon is not null
                const SizedBox(width: 3),
                Icon(
                  icon,
                  size: iconSize,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
