import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../utils/constants.dart';

class CustomFliterBtn extends StatelessWidget {
  const CustomFliterBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      constraints: const BoxConstraints(
        minWidth: 1,
        maxWidth: double.infinity,
      ),
      decoration: ShapeDecoration(
        // color: Color(0xFFFFF7EA),
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFFA3A3A3)),
          borderRadius: BorderRadius.circular(40),
        ),
      ),
      alignment: Alignment.center,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Iconsax.filter,
            size: 16,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            'Filter',
            style: kProductDesc,
          ),
        ],
      ),
    );
  }
}
