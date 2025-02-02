import 'package:flutter/material.dart';

class AnimatedCustomIconButton extends StatefulWidget {
  final IconData filledIcon;
  final IconData outlineIcon;
  final double iconSize;
  final Color filledColor;
  final Color outlineColor;
  final Color bgColor;

  const AnimatedCustomIconButton({
    super.key,
    required this.filledIcon,
    required this.outlineIcon,
    required this.iconSize,
    required this.filledColor,
    required this.outlineColor,
    required this.bgColor,
  });

  @override
  _AnimatedCustomIconButtonState createState() =>
      _AnimatedCustomIconButtonState();
}

class _AnimatedCustomIconButtonState extends State<AnimatedCustomIconButton> {
  bool isFilled = false;

  void toggleHeart() {
    setState(() {
      isFilled = !isFilled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggleHeart,
      child: AnimatedContainer(
        height: 36,
        width: 36,
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: widget.bgColor, borderRadius: BorderRadius.circular(10)),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return ScaleTransition(scale: animation, child: child);
          },
          child: Icon(
            isFilled ? widget.filledIcon : widget.outlineIcon,
            key: ValueKey<bool>(isFilled),
            color: isFilled ? widget.filledColor : widget.outlineColor,
            size: widget.iconSize,
          ),
        ),
      ),
    );
  }
}
