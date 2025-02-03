import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:snad_box/utils/constants.dart';
import 'package:snad_box/widgets/custom_icon_button.dart';
import 'package:snad_box/widgets/hero_card_tile.dart';
import 'package:snad_box/widgets/order_screen_widgets/animated_icon_heart.dart';
import 'package:snad_box/widgets/product_app_bar.dart';

import '../../../widgets/custom_filter_btn.dart';
import '../../../widgets/large_text_with_icon.dart';
import '../../../widgets/stores_card_item.dart';

class StoreDetailsScreen extends StatefulWidget {
  const StoreDetailsScreen({super.key});

  @override
  State<StoreDetailsScreen> createState() => _StoreDetailsScreenState();
}

class _StoreDetailsScreenState extends State<StoreDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: kBgcolor,
              expandedHeight: 260.0,
              pinned: true,
              stretch: true,
              flexibleSpace: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  // Calculating the collapse percentage
                  double collapsePercentage =
                      (constraints.maxHeight - kToolbarHeight) /
                          (260.0 - kToolbarHeight);

                  // Interpolating left padding and bottom padding based on collapse percentage
                  double leftPadding =
                      (20 + (80 - 20) * (1 - collapsePercentage))
                          .clamp(0, double.infinity);
                  double bottomPadding =
                      (10 + (0 - 0) * (1 - collapsePercentage))
                          .clamp(0, double.infinity);
                  return FlexibleSpaceBar(
                    collapseMode: CollapseMode.pin,
                    background: Stack(
                      children: [
                        // Cover Photo
                        SizedBox(
                          height: 150,
                          width: double.infinity,
                          child: Image.asset(
                            'assets/images/nike_cover.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                        // Profile Picture
                        Positioned(
                          top: 110.0,
                          left: 20.0,
                          child: Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 2, color: kIconButtonColor),
                                image: const DecorationImage(
                                    image:
                                        AssetImage('assets/images/nike.png')),
                                borderRadius: BorderRadius.circular(16)),
                          ),
                        ),
                      ],
                    ),
                    title: const Text(
                      "Nike Fashion Store",
                      style: kSubHeaderText2,
                    ),
                    titlePadding: EdgeInsets.only(
                        left: leftPadding, bottom: bottomPadding),
                  );
                },
              ),
              leading: Padding(
                padding: const EdgeInsets.all(12.0),
                child: ProductNaviIcon(
                    icon: Icons.arrow_back,
                    onTap: () {
                      Navigator.pop(context);
                    }),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ProductNaviIcon(icon: Iconsax.send_2, onTap: () {}),
                ),
              ],
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          StoreTagItem(
                            label: '4.3',
                            icon: Iconsax.star,
                          ),
                          StoreTagItem(
                            label: 'Lagos',
                            icon: Iconsax.location,
                          ),
                          StoreTagItem(
                            label: 'Fashion',
                            icon: Iconsax.cloud,
                          )
                        ],
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'STORE DESCRIPTION',
                        style: kProductDescHeader,
                      ),
                      const Text(
                        'Are you passionate about technology, innovation, and sharing your insights? The DevFest Lagos Call for Papers (CFP) form is your opportunity to contribute to DevFest Lagos 2024.',
                        style: kProductDesc,
                      ),
                      const SizedBox(height: 24),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Items on sale',
                            style: kProductDescHeader,
                          ),
                          CustomFliterBtn()
                        ],
                      ),
                      const SizedBox(height: 16),
                      GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 16.0,
                          crossAxisSpacing: 16.0,
                          childAspectRatio: 0.5,
                          mainAxisExtent: 275,
                        ),
                        shrinkWrap: true, // Allow GridView to wrap content
                        physics:
                            const NeverScrollableScrollPhysics(), // Disable scrolling
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  height: 218,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    image: const DecorationImage(
                                        image: AssetImage(
                                            'assets/images/p_mockup2.png'),
                                        fit: BoxFit.cover),
                                  ),
                                  padding: const EdgeInsets.all(10),
                                  alignment: Alignment.topLeft,
                                  child: const AnimatedCustomIconButton(
                                    filledIcon: Iconsax.heart5,
                                    outlineIcon: Iconsax.heart,
                                    iconSize: 20,
                                    filledColor: Colors.red,
                                    outlineColor: Colors.black,
                                    bgColor: Colors.white,
                                  )),
                              const Text(
                                'Mockup Water Bottles',
                                style: kItemTextStyle,
                                overflow: TextOverflow.ellipsis,
                              ),
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
                          );
                        },
                        itemCount: 8,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                _buildSimilarStoresSection(),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildSimilarStoresSection() {
  // ApiService apiService = ApiService();

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

class StoreTagItem extends StatelessWidget {
  final String label;
  final IconData icon;

  const StoreTagItem({
    super.key,
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Container(
        height: 36,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        constraints: const BoxConstraints(
          minWidth: 1,
          maxWidth: double.infinity,
        ),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(32)),
          color: Color(0xFFFFECCC),
        ),
        alignment: Alignment.center,
        child: Row(
          children: [
            Icon(icon, size: 16),
            const SizedBox(width: 5),
            Text(
              label,
              style: kFormLabelText,
            )
          ],
        ),
      ),
    );
  }
}
