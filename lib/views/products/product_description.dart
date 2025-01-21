import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:snad_box/utils/constants.dart';
import 'package:snad_box/widgets/custom_btn.dart';
import 'package:snad_box/widgets/item_counter.dart';

import '../../widgets/product_app_bar.dart';

class ProductDescription extends StatefulWidget {
  const ProductDescription({super.key});

  @override
  State<ProductDescription> createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  int currentNumber = 1;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: kBgcolor,
        height: 100,
        elevation: 4,
        shadowColor: Colors.black,
        child: Row(
          children: [
            Expanded(
                child: CustomButton(
              button2: true,
              text: 'Add to Cart',
              onPressed: () {},
            )),
            const SizedBox(width: 20),
            Expanded(
                child: CustomButton(
              text: 'Buy Now',
              onPressed: () {},
            ))
          ],
        ),
      ),
      backgroundColor: kBgcolor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height * 0.335,
              width: double.infinity,
              child: Stack(
                children: [
                  Center(
                    child: SizedBox(
                      width: double.infinity,
                      child: Image.asset(
                        'assets/images/p_mockup.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const ProductAppBar(),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 36,
                        constraints: const BoxConstraints(
                          minWidth: 0,
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            color: kIconButtonColor,
                            borderRadius: BorderRadius.circular(56)),
                        child: const Center(
                          child: Text(
                            '🥄 Utensils',
                            overflow: TextOverflow.ellipsis,
                            style: kFormLabelText,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 36,
                        width: 36,
                        child: IconButton(
                            onPressed: () {},
                            style: IconButton.styleFrom(
                              backgroundColor: kIconButtonColor,
                            ),
                            icon: const Icon(
                              Iconsax.send_2,
                              size: 20,
                            )),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  const SizedBox(
                    height: 130,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Best green tea juice bottle mockup',
                          style: kProductName,
                        ),
                        SizedBox(height: 20),
                        Text.rich(TextSpan(children: [
                          TextSpan(
                              text: '₦ ',
                              style: TextStyle(
                                fontSize: 22,
                                fontFamily: 'General',
                                color: Color(0xFF353535),
                              )),
                          TextSpan(text: '4,130', style: kProductPrice)
                        ])),
                      ],
                    ),
                  ),
                  const Text(
                    'Select Item Quantity',
                    style: TextStyle(
                      color: Color(0xFF0A0A0A),
                      fontSize: 16,
                      fontFamily: 'Gsa',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ItemCounter(
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
                  const SizedBox(height: 15),
                  Container(
                    height: 30,
                    constraints: const BoxConstraints(
                      minWidth: 0,
                    ),
                    padding:
                        const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color(0xFFFCE0DE),
                    ),
                    child: const Text(
                      '2 Items Left in Stock',
                      style: TextStyle(
                        color: Color(0xFF353535),
                        fontSize: 12,
                        fontFamily: 'Gsa',
                        fontWeight: FontWeight.w500,
                        height: 1.50,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'PRODUCT DESCRIPTION',
                    style: kProductDescHeader,
                  ),
                  const SizedBox(height: 15),
                  const SizedBox(
                    width: double.infinity,
                    child: Text(
                      'Are you passionate about technology, innovation, and sharing your insights? The DevFest Lagos Call for Papers (CFP) form is your opportunity to contribute to DevFest Lagos 2024. Are you passionate about technology, innovation, and sharing your insights? The DevFest Lagos Call for Papers (CFP) form is your opportunity to contribute to DevFest Lagos 2024.',
                      style: kProductDesc,
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
