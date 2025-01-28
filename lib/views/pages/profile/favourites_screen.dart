import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:snad_box/utils/constants.dart';
import 'package:snad_box/widgets/custom_icon_button.dart';
import 'package:snad_box/widgets/filter_and_search_widget.dart';

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({super.key});

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgcolor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 20,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Favourites',
                  style: kPageHeader,
                ),
                kFilterAndSearchIconWidget(),
              ],
            ),
          ),
          Flexible(
              child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Maximum of 2 items per row
                  mainAxisSpacing: 10.0, // Spacing between rows
                  crossAxisSpacing: 16.0, // Spacing between columns
                  childAspectRatio: 0.5,
                  mainAxisExtent: 300),
              itemBuilder: (context, index) {
                return _buildFavouritesItemCard();
              },
              itemCount: 8, // Replace with the actual number of items
            ),
          ))
        ],
      ),
    );
  }

  SizedBox _buildFavouritesItemCard() {
    return SizedBox(
      height: 278,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              width: double.infinity,
              height: 218,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/p_mockup.png'),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              padding: const EdgeInsets.all(10),
              alignment: Alignment.topLeft,
              child: CustomIconButton(
                icon: Iconsax.heart,
                bgColor: Colors.white,
                iconColor: Colors.red,
                onPressed: () {},
              )),
          const Text(
            'Mockup Water Bottless',
            style: kItemTextStyle,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 10),
          const Text.rich(TextSpan(children: [
            TextSpan(
                text: '₦ ',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'General',
                  color: Color(0xFF353535),
                  fontWeight: FontWeight.w500,
                )),
            TextSpan(text: '4130', style: kPriceTextStyle)
          ])),
        ],
      ),
    );
  }
}
