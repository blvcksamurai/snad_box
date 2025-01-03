import 'package:flutter/material.dart';

import '../constants.dart';
import 'custom_icon_button.dart';

class ForYouItems extends StatelessWidget {
  const ForYouItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 143,
      height: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: 143,
                height: 171,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(16)),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: CustomIconButton(
                  onPressed: () {},
                  icon: Icons.favorite_outline,
                  bgColor: Colors.white,
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          const SizedBox(
            width: 143,
            child: Text(
              'Mockup Water Bottle',
              style: kItemTextStyle,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            '₦ 4,130',
            style: kPriceTextStyle,
          )
        ],
      ),
    );
  }
}
