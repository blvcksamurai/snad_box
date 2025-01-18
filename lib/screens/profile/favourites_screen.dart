import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:snad_box/utils/constants.dart';
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
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
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
                kFilterAndSearchIconWidget()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
