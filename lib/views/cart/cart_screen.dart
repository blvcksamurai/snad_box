import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ionicons/ionicons.dart';
import 'package:snad_box/utils/constants.dart';
import 'package:snad_box/widgets/custom_btn.dart';
import 'package:snad_box/widgets/input_widgets/custom_input_field.dart';
import 'package:snad_box/widgets/item_counter.dart';

import '../../widgets/cart_widgets/cart_item_card.dart';
import '../../widgets/cart_widgets/cart_total_fab.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int currentNumber = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // floatingActionButton: const CartTotalFAB(),
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Your Cart',
              style: kPageHeader,
            ),
            CartItemCounter(),
          ],
        ),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: kBgcolor,
      body: SafeArea(
        child: _buildEmptyState(),

        // child: buildActiveState(),
      ),
    );
  }

  SingleChildScrollView buildActiveState() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CustomInputField(
              hintText: 'Search your cart',
              searchInput: true,
              prefixIcon: const Icon(
                Iconsax.search_normal_1,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20),
            CartItemCard(
              currentNumber: currentNumber,
              onAdd: () {
                setState(() {
                  currentNumber++;
                });
              },
              onRemove: () {
                if (currentNumber != 1) {
                  setState(() {
                    currentNumber--;
                  });
                }
              },
            ),
            const SizedBox(
              height: 150,
            )
          ],
        ),
      ),
    );
  }

//Empty State Builder
  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
                width: 245.98,
                height: 179,
                child: SvgPicture.asset('assets/images/shopping_bags.svg')),
            const SizedBox(height: 20),
            const Text(
              'No Items Saved',
              style: kProductDescHeader,
            ),
            const SizedBox(height: 15),
            const SizedBox(
              width: 334,
              child: Text(
                'You currently do not have items in your card. Start shopping, or are you feeling adventurous?',
                textAlign: TextAlign.center,
                style: kPageSubHeader,
              ),
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: 'Explore Categories',
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: 'Surprise Me',
              button2: true,
            ),
          ],
        ),
      ),
    );
  }
}
