import 'package:flutter/material.dart';

import '../constants.dart';
import 'custom_icon_with_rating.dart';

class StoresCardItem extends StatelessWidget {
  final String name;

  const StoresCardItem({
    super.key,
    required this.name,
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
                  icon: Icons.star_border_rounded,
                  bgColor: Colors.white,
                  rating: 4.3,
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          Text(
            name,
            style: kItemTextStyle,
          )
        ],
      ),
    );
  }
}
