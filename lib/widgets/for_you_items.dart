import 'package:flutter/material.dart';

import '../utils/constants.dart';
import 'custom_icon_button.dart';

class ForYouItems extends StatelessWidget {
  final String title;
  final int price;
  const ForYouItems({
    super.key,
    required this.title,
    required this.price,
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
          SizedBox(
            width: 143,
            child: Text(
              title,
              style: kItemTextStyle,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            '₦${price.toString()}',
            style: kPriceTextStyle,
          )
        ],
      ),
    );
  }
}
