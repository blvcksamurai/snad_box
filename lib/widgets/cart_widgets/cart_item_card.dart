import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ionicons/ionicons.dart';

import '../../utils/constants.dart';

class CartItemCard extends StatelessWidget {
  final Function() onAdd;
  final Function() onRemove;
  final int currentNumber;

  const CartItemCard({
    super.key,
    required this.currentNumber,
    required this.onAdd,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: double.infinity,
      child: Row(
        children: [
          Container(
            height: 100,
            width: 93,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: const DecorationImage(
                    image: AssetImage('assets/images/p_mockup.png'),
                    fit: BoxFit.cover)),
          ),
          const SizedBox(width: 10),
          SizedBox(
            width: 268,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 268,
                  child: Text(
                    'Best green tea juice bottle mockup',
                    overflow: TextOverflow.ellipsis,
                    style: kCartItemTitle,
                  ),
                ),
                const SizedBox(height: 5),
                const Text.rich(TextSpan(children: [
                  TextSpan(
                      text: '₦ ',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'General',
                        color: Color(0xFF353535),
                        fontWeight: FontWeight.w500,
                      )),
                  TextSpan(text: '4,130', style: kPriceTextStyle)
                ])),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 40,
                      width: 169,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(56)),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: onRemove,
                              icon: const Icon(
                                Ionicons.remove_outline,
                                size: 16,
                                color: Colors.black,
                              )),
                          const SizedBox(width: 5),
                          Text(
                            currentNumber.toString(),
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          const SizedBox(width: 5),
                          IconButton(
                              onPressed: onAdd,
                              icon: const Icon(
                                Ionicons.add_outline,
                                size: 16,
                                color: Colors.black,
                              )),
                        ],
                      ),
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xfffce0de),
                      ),
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Iconsax.trash,
                            size: 20,
                          )),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CartItemCounter extends StatelessWidget {
  const CartItemCounter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 30,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        constraints: const BoxConstraints(
          minWidth: 1,
          maxWidth: double.infinity,
        ),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: Color(0xFFFDE39B),
        ),
        child: const Text(
          '9 items',
          style: kCartCount,
        ));
  }
}
