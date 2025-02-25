import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nigerian_states_and_lga/nigerian_states_and_lga.dart';
import 'package:snad_box/services/api_service.dart';
import 'package:snad_box/utils/constants.dart';
import 'package:snad_box/widgets/custom_btn.dart';
import 'package:snad_box/widgets/hero_card_tile.dart';
import 'package:snad_box/widgets/input_widgets/custom_input_field.dart';
import 'package:snad_box/widgets/large_text_with_icon.dart';

import '../../../widgets/for_you_items.dart';
import '../../../widgets/stores_card_item.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  String selectedState = 'Lagos';
  List<String> states = NigerianStatesAndLGA.allStates; // Fetch states
  List<String> filteredStates = [];

  @override
  void initState() {
    super.initState();
    filteredStates = states; // Initially, all states are displayed
  }

  void _showStateSelectionModal(BuildContext context) {
    String tempSelectedState = selectedState; // Temporary state selection

    showModalBottomSheet(
      context: context,
      showDragHandle: false,
      backgroundColor: kBgcolor,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.6, // Default height: 60%
          minChildSize: 0.6, // Minimum height: 60%
          maxChildSize: 0.8, // Maximum height: 80%
          expand: false, // Allows snapping to sizes
          builder: (context, scrollController) {
            return StatefulBuilder(
              builder: (context, setModalState) {
                // Ensure selected state appears at the top
                List<String> sortedStates = [
                  tempSelectedState,
                  ...filteredStates.where((state) => state != tempSelectedState)
                ];

                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Select Location',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(Iconsax.close_circle))
                        ],
                      ),
                      const SizedBox(height: 16),
                      CustomInputField(
                        searchInput: true,
                        prefixIcon: const Icon(
                          Iconsax.search_normal_1,
                          color: Colors.grey,
                        ),
                        hintText: 'Search for a state',
                        onchanged: (value) {
                          setModalState(() {
                            filteredStates = states
                                .where((state) => state
                                    .toLowerCase()
                                    .contains(value.toLowerCase()))
                                .toList();
                          });
                        },
                      ),
                      const SizedBox(height: 10),
                      Expanded(
                        child: ListView.builder(
                          controller: scrollController,
                          itemCount: sortedStates.length,
                          itemBuilder: (context, index) {
                            final state = sortedStates[index];

                            return ListTile(
                              leading: Icon(
                                state == tempSelectedState
                                    ? Icons.radio_button_checked
                                    : Icons.radio_button_unchecked,
                                color: state == tempSelectedState
                                    ? kButtonColor
                                    : Colors.grey,
                              ),
                              title: Text(state, style: kFormLabelText),
                              onTap: () {
                                setModalState(() {
                                  tempSelectedState = state;
                                });
                              },
                            );
                          },
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Save Button
                      CustomButton(
                        text: 'Save',
                        onPressed: () {
                          setState(() {
                            selectedState = tempSelectedState;
                          });
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgcolor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Explore',
              style: kPageHeader,
            ),
            GestureDetector(
              onTap: () => _showStateSelectionModal(context),
              child: LocationSelector(selectedState: selectedState),
            )
          ],
        ),
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Column(
                children: [
                  const SizedBox(height: 10),
                  _buildForYouSection(),
                  const SizedBox(height: 20),
                  _buildStoresSection(),
                  const SizedBox(height: 10),
                  const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: HeroCardTile())
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LocationSelector extends StatelessWidget {
  const LocationSelector({
    super.key,
    required this.selectedState,
  });

  final String selectedState;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(56),
        border: Border.all(width: 1.5, color: Colors.grey.shade400),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(
                Iconsax.location,
                color: Colors.black,
                size: 16, // Reduce icon size
              ),
              const SizedBox(width: 4), // Minimize spacing
              Text(
                selectedState,
                style:
                    kFormLabelText.copyWith(fontSize: 14), // Adjust font size
                overflow: TextOverflow.ellipsis, // Truncate if too long
                maxLines: 1, // Ensure a single line
              ),
            ],
          ),
          const SizedBox(width: 4), // Minimize spacing
          const Icon(
            Iconsax.arrow_down_1,
            color: Colors.black,
            size: 16, // Reduce icon size
          ),
        ],
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
          height: 240,
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
        LargeTextWithIcon(
          headerTitle: 'Stores',
          onPressed: () {},
        ),
        const SizedBox(height: 15),

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
        )
      ],
    ),
  );
}
