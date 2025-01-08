import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProductAppBar extends StatelessWidget {
  const ProductAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ProductNaviIcon(
            icon: Icons.arrow_back,
            onTap: () {},
          ),
          Row(
            children: [
              ProductNaviIcon(
                icon: Iconsax.search_normal_1,
                onTap: () {},
              ),
              const SizedBox(width: 10),
              ProductNaviIcon(
                icon: Iconsax.send_2,
                onTap: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ProductNaviIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const ProductNaviIcon({
    super.key,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      width: 36,
      child: IconButton(
          onPressed: onTap,
          style: IconButton.styleFrom(
            backgroundColor: Colors.white,
          ),
          icon: Icon(
            icon,
            size: 20,
          )),
    );
  }
}
