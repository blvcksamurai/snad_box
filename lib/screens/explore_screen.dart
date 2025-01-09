import 'package:flutter/material.dart';
import 'package:snad_box/services/api_service.dart';
import 'package:snad_box/utils/constants.dart';
import 'package:snad_box/widgets/hero_card_tile.dart';
import 'package:snad_box/widgets/large_text_with_icon.dart';

import '../widgets/for_you_items.dart';
import '../widgets/stores_card_item.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgcolor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 30),
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Text(
                          'Explore',
                          style: kHeaderText,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildForYouSection(),
                  const SizedBox(height: 20),
                  _buildStoresSection(),
                  const SizedBox(height: 20),
                  const HeroCardTile()
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Popular Items in your Area

Widget _buildForYouSection() {
  return Padding(
    padding: const EdgeInsets.only(left: 15),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LargeTextWithIcon(
          headerTitle: 'Popular Items in Your Area',
          onPressed: () {},
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: 230,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (context, index) => const Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: ForYouItems(
                title: 'Mockup Water Bottle',
                price: 4130,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

//Popular Stores in your Area

Widget _buildStoresSection() {
  ApiService apiService = ApiService();
  return Padding(
    padding: const EdgeInsets.only(left: 15),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const LargeTextWithIcon(headerTitle: 'Stores'),
        const SizedBox(height: 15),
        FutureBuilder(
          future: apiService.fetchData('store/brand'),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const SizedBox(
                height: 180,
                child: Center(
                    child: CircularProgressIndicator(color: kButtonColor)),
              );
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData) {
              final data = snapshot.data as Map<String, dynamic>;
              final brandStores = data['data']['brandStores'] as List<dynamic>;

              return SizedBox(
                height: 180,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: brandStores.length,
                  itemBuilder: (context, index) {
                    final store = brandStores[index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: StoresCardItem(
                        name: store['title'],
                        rating: store['rating'],
                      ),
                    );
                  },
                ),
              );
            } else {
              return const Center(child: Text('No data available'));
            }
          },
        ),
      ],
    ),
  );
}
