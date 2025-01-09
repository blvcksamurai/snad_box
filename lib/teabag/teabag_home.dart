import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:snad_box/services/api_service.dart';
import 'package:snad_box/utils/constants.dart';
import '../../widgets/custom_icon_button.dart';
import '../../widgets/for_you_items.dart';
import '../../widgets/hero_card_tile.dart';
import '../widgets/large_text_with_icon.dart';
import '../../widgets/stores_card_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgcolor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset('assets/images/o_logo.svg'),
                        SizedBox(
                          width: 90,
                          height: 40,
                          child: Row(
                            children: [
                              const SizedBox(width: 5),
                              CustomIconButton(
                                icon: Iconsax.search_normal_1,
                                onPressed: () {},
                              ),
                              const SizedBox(width: 5),
                              CustomIconButton(
                                icon: Iconsax.shopping_cart,
                                onPressed: () {},
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    //Welcome message
                    const SizedBox(
                      width: 382,
                      child: Text('🌤️ Good Morning, Aise', style: kGreeting),
                    ),
                    const SizedBox(height: 10),
                    const SizedBox(
                        width: 332,
                        child: Text(
                          'What are we getting you today?',
                          style: kWelcomeMessage,
                        )),
                    const SizedBox(height: 20),

                    //Hero Card
                    const HeroCardTile(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    //For You
                    LargeTextWithIcon(
                      headerTitle: 'For You',
                      onPressed: () {},
                    ),
                    const SizedBox(height: 15),
                    //For you Items
                    SizedBox(
                      height: 230, // Appropriate height for the list
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 4, // Item count
                        itemBuilder: (context, index) {
                          return const Padding(
                            padding: EdgeInsets.only(
                                right: 20.0), // Add spacing between items
                            child: ForYouItems(
                              title: 'Mockup Water Bottle',
                              price: 4130,
                            ), // Ensure this widget is properly implemented
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 30),
                    //Stores
                    const LargeTextWithIcon(headerTitle: 'Stores'),
                    const SizedBox(height: 15),

                    //Stores Card Item
                    FutureBuilder(
                        future: apiService.fetchData('store/brand'),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const SizedBox(
                              height: 180,
                              child: Center(
                                  child: CircularProgressIndicator(
                                color: kButtonColor,
                              )),
                            );
                          } else if (snapshot.hasError) {
                            return Center(
                                child: Text('Error: ${snapshot.error}'));
                          } else if (snapshot.hasData) {
                            final data = snapshot.data;
                            //Stores Items to be displayed
                            return SizedBox(
                              height:
                                  180, // Set an appropriate height for the list
                              child: ListView.builder(
                                scrollDirection: Axis
                                    .horizontal, // Ensure horizontal scrolling
                                itemCount: data[
                                    'length'], // Replace with your desired item count
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 15.0),
                                    child: StoresCardItem(
                                      name: data['data']['brandStores'][index]
                                          ['title'],
                                      rating: data['data']['brandStores'][index]
                                          ['rating'],
                                    ),
                                  );
                                },
                              ),
                            );
                          } else {
                            return const Center(
                              child: Text('No data available'),
                            );
                          }
                        }),

                    //Categories
                    const LargeTextWithIcon(headerTitle: 'Categories'),
                    const SizedBox(height: 10),

                    Container(
                      margin: const EdgeInsets.only(right: 15),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CategoriesItem(),
                              CategoriesItem(),
                              CategoriesItem(),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CategoriesItem(),
                              CategoriesItem(),
                              CategoriesItem(),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height *
                          0.15, // Responsive space
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CategoriesItem extends StatelessWidget {
  const CategoriesItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 125,
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      decoration: BoxDecoration(
          color: kIconButtonColor, borderRadius: BorderRadius.circular(72)),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '📺',
            style: kCategoriesTextStyle,
          ),
          Expanded(
            child: Text(
              ' Food Stuffs',
              style: kCategoriesTextStyle,
            ),
          )
        ],
      ),
    );
  }
}


// SizedBox(
//                                 height: 230, // Appropriate height for the list
//                                 child: ListView.builder(
//                                   scrollDirection: Axis.horizontal,
//                                   itemCount: 4, // Item count
//                                   itemBuilder: (context, index) {
//                                     return const Padding(
//                                       padding: EdgeInsets.only(
//                                           right:
//                                               20.0), // Add spacing between items
//                                       child: ForYouItems(
//                                         title: 'Mockup Water Bottle',
//                                         price: 4130,
//                                       ), // Ensure this widget is properly implemented
//                                     );
//                                   },
//                                 ),
//                               );