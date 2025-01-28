import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../utils/constants.dart';
import 'custom_icon_with_rating.dart';

class StoresCardItem extends StatelessWidget {
  final String name;
  final int rating;

  const StoresCardItem({
    super.key,
    required this.name,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 127,
      height: 180,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: 127,
                height: 126,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.grey,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: CustomIconRating(
                  onPressed: () {},
                  icon: Iconsax.star,
                  bgColor: Colors.white,
                  rating: rating.toDouble(),
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          Text(
            name,
            overflow: TextOverflow.ellipsis,
            style: kItemTextStyle,
          )
        ],
      ),
    );
  }
}
