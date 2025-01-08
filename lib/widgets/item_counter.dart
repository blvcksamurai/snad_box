import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class ItemCounter extends StatelessWidget {
  final Function() onAdd;
  final Function() onRemove;

  const ItemCounter({
    super.key,
    required this.currentNumber,
    required this.onAdd,
    required this.onRemove,
  });

  final int currentNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(56)),
      padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 8),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: onRemove,
              icon: const Icon(
                Ionicons.remove_outline,
                size: 18,
                color: Colors.black,
              )),
          const SizedBox(width: 5),
          Text(
            currentNumber.toString(),
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(width: 5),
          IconButton(
              onPressed: onAdd,
              icon: const Icon(
                Ionicons.add_outline,
                size: 18,
                color: Colors.black,
              )),
        ],
      ),
    );
  }
}
