import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../utils/constants.dart';

class kFilterAndSearchIconWidget extends StatelessWidget {
  const kFilterAndSearchIconWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 32,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          constraints: const BoxConstraints(
            minWidth: 0,
          ),
          decoration: ShapeDecoration(
            // color: Color(0xFFFFF7EA),
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1, color: kGrey),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Row(
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
                style: kOrderHistorySmallText,
              )
            ],
          ),
        ),
        const SizedBox(width: 10),
        Container(
          height: 32,
          width: 32,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1, color: kGrey),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Icon(
            Iconsax.search_normal_1,
            size: 16,
          ),
        )
      ],
    );
  }
}
