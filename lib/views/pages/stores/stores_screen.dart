import 'package:flutter/material.dart';
import 'package:snad_box/services/api_service.dart';
import 'package:snad_box/utils/constants.dart';
import 'package:snad_box/widgets/hero_card_tile.dart';

import '../../../widgets/large_text_with_icon.dart';
import '../../../widgets/stores_card_item.dart';

class StoresScreen extends StatefulWidget {
  const StoresScreen({super.key});

  @override
  State<StoresScreen> createState() => _StoresScreenState();
}

class _StoresScreenState extends State<StoresScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgcolor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Stores',
              style: kPageHeader,
            ),
            CreateStoreBtn(),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  flex: 7,
                  child: Container(
                    color: Colors.black,
                    height: 50,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    height: 50,
                    color: Colors.amber,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 16),
          Flexible(
              child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildStoresSection(),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: HeroCardTile(),
                ),
                const SizedBox(height: 16),
                _buildNewStores()
              ],
            ),
          ))
        ],
      ),
    );
  }
}

class CreateStoreBtn extends StatelessWidget {
  const CreateStoreBtn({
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
        borderRadius: BorderRadius.all(Radius.circular(900)),
        color: kButtonColor,
      ),
      alignment: Alignment.center,
      child: const Text(
        'Create Store',
        style: kFormLabelText,
      ),
    );
  }
}

Widget _buildStoresSection() {
  ApiService apiService = ApiService();

  return Padding(
    padding: const EdgeInsets.only(left: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LargeTextWithIcon(
          headerTitle: 'Popular Stores in Your Area',
          onPressed: () {},
        ),
        const SizedBox(height: 15),

        SizedBox(
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: StoresCardItem(
                  // name: store['title'],
                  // rating: store['rating'],

                  name: 'Store Name',
                  rating: 4,
                ),
              );
            },
          ),
        ),
        //Future BUilder Works (unfreeze when it time for testing)
        // FutureBuilder(
        //   future: apiService.fetchData('store/brand'),
        //   builder: (context, snapshot) {
        //     if (snapshot.connectionState == ConnectionState.waiting) {
        //       return const SizedBox(
        //         height: 180,
        //         child: Center(
        //             child: CircularProgressIndicator(color: kButtonColor)),
        //       );
        //     } else if (snapshot.hasError) {
        //       return Center(child: Text('Error: ${snapshot.error}'));
        //     } else if (snapshot.hasData) {
        //       final data = snapshot.data as Map<String, dynamic>;
        //       final brandStores = data['data']['brandStores'] as List<dynamic>;

        //       return SizedBox(
        //         height: 180,
        //         child: ListView.builder(
        //           scrollDirection: Axis.horizontal,
        //           itemCount: brandStores.length,
        //           itemBuilder: (context, index) {
        //             final store = brandStores[index];
        //             return Padding(
        //               padding: const EdgeInsets.only(right: 15.0),
        //               child: StoresCardItem(
        //                 name: store['title'],
        //                 rating: store['rating'],
        //               ),
        //             );
        //           },
        //         ),
        //       );
        //     } else {
        //       return const Center(child: Text('No data available'));
        //     }
        //   },
        // ),
      ],
    ),
  );
}

Widget _buildNewStores() {
  ApiService apiService = ApiService();

  return Padding(
    padding: const EdgeInsets.only(left: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LargeTextWithIcon(
          headerTitle: 'New Stores in Your Area',
          onPressed: () {},
        ),
        const SizedBox(height: 15),

        SizedBox(
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: StoresCardItem(
                  // name: store['title'],
                  // rating: store['rating'],

                  name: 'Store Name',
                  rating: 4,
                ),
              );
            },
          ),
        ),
        //Future BUilder Works (unfreeze when it time for testing)
        // FutureBuilder(
        //   future: apiService.fetchData('store/brand'),
        //   builder: (context, snapshot) {
        //     if (snapshot.connectionState == ConnectionState.waiting) {
        //       return const SizedBox(
        //         height: 180,
        //         child: Center(
        //             child: CircularProgressIndicator(color: kButtonColor)),
        //       );
        //     } else if (snapshot.hasError) {
        //       return Center(child: Text('Error: ${snapshot.error}'));
        //     } else if (snapshot.hasData) {
        //       final data = snapshot.data as Map<String, dynamic>;
        //       final brandStores = data['data']['brandStores'] as List<dynamic>;

        //       return SizedBox(
        //         height: 180,
        //         child: ListView.builder(
        //           scrollDirection: Axis.horizontal,
        //           itemCount: brandStores.length,
        //           itemBuilder: (context, index) {
        //             final store = brandStores[index];
        //             return Padding(
        //               padding: const EdgeInsets.only(right: 15.0),
        //               child: StoresCardItem(
        //                 name: store['title'],
        //                 rating: store['rating'],
        //               ),
        //             );
        //           },
        //         ),
        //       );
        //     } else {
        //       return const Center(child: Text('No data available'));
        //     }
        //   },
        // ),
      ],
    ),
  );
}
