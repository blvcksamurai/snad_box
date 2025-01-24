import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nigerian_states_and_lga/nigerian_states_and_lga.dart';

import '../../utils/constants.dart';
import '../../widgets/custom_btn.dart';
import '../../widgets/input_widgets/custom_input_field.dart';

class StepTwo extends StatefulWidget {
  const StepTwo({super.key});

  @override
  State<StepTwo> createState() => _StepTwoState();
}

class _StepTwoState extends State<StepTwo> {
  String? selectedState;
  String? selectedLGA;

  void _showSearchableBottomSheet({
    required BuildContext context,
    required List<String> items,
    required Function(String) onSelect,
    required String title,
    String? searchHint,
  }) {
    showModalBottomSheet(
      showDragHandle: true,
      context: context,
      isScrollControlled: true,
      backgroundColor: kBgcolor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (BuildContext context) {
        TextEditingController searchController = TextEditingController();
        List<String> filteredItems = List.from(items);

        return DraggableScrollableSheet(
          initialChildSize: 0.6,
          minChildSize: 0.6,
          maxChildSize: 0.8,
          expand: false,
          builder: (context, scrollController) {
            return StatefulBuilder(
              builder: (context, setState) {
                void filterItems(String query) {
                  setState(() {
                    filteredItems = items
                        .where((item) =>
                            item.toLowerCase().contains(query.toLowerCase()))
                        .toList();
                  });
                }

                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 0, 25, 16),
                      child: Column(
                        children: [
                          Text(
                            title,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          CustomInputField(
                            searchInput: true,
                            hintText: 'Search for your $searchHint',
                            controller: searchController,
                            onchanged: filterItems,
                            prefixIcon: const Icon(Iconsax.search_normal_1),
                          ),
                        ],
                      ),
                    ),
                    const Divider(color: Color(0xFFE3E3E3)),
                    Expanded(
                      child: filteredItems.isNotEmpty
                          ? ListView.builder(
                              controller: scrollController,
                              itemCount: filteredItems.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Center(
                                    child: Text(
                                      filteredItems[index],
                                      style: kItemListTextStyle,
                                    ),
                                  ),
                                  onTap: () {
                                    onSelect(filteredItems[index]);
                                    Navigator.pop(context);
                                  },
                                );
                              },
                            )
                          : const Center(
                              child: Text('No results found'),
                            ),
                    ),
                  ],
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
        backgroundColor: kBgcolor,
        title: _buildHeader(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: _buildStepIndicator(),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    _buildIntroText(),
                    const SizedBox(height: 20),
                    _buildForm(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height *
                          0.2, // Responsive space
                    ),
                    _buildNextButton(),
                    const SizedBox(height: 20),
                    _buildLoginPrompt(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset('assets/images/o_logo.svg'),
      ],
    );
  }

  Widget _buildStepIndicator() {
    return Container(
      width: 90,
      height: 36,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(32),
      ),
      child: const Center(
        child: Text('Step 2 of 3', style: kSmallBtnText),
      ),
    );
  }

  Widget _buildIntroText() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Location Information.', style: kHeaderText),
        SizedBox(height: 15),
        Text(
          'We want to recommend services based on \nyour location and also for your deliveries.',
          style: kSubHeaderText,
        ),
      ],
    );
  }

  Widget _buildForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInputField(label: 'Address', hintText: 'Enter your address'),
        const SizedBox(height: 10),
        _buildDropdown(
          label: 'State',
          value: selectedState,
          hint: 'Choose your state',
          items: NigerianStatesAndLGA.allStates,
          onSelect: (state) {
            setState(() {
              selectedState = state;
              selectedLGA = null;
            });
          },
        ),
        const SizedBox(height: 10),
        _buildDropdown(
          label: 'LGA',
          value: selectedLGA,
          hint: 'Choose your LGA',
          items: selectedState == null
              ? []
              : NigerianStatesAndLGA.getStateLGAs(selectedState!),
          onSelect: (lga) => setState(() => selectedLGA = lga),
        ),
      ],
    );
  }

  Widget _buildInputField({required String label, required String hintText}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: kFormLabelText),
        const SizedBox(height: 10),
        CustomInputField(hintText: hintText),
      ],
    );
  }

  Widget _buildDropdown({
    required String label,
    String? value,
    required String hint,
    required List<String> items,
    required Function(String) onSelect,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: kFormLabelText),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: () => _showSearchableBottomSheet(
            context: context,
            items: items,
            searchHint: label.toLowerCase(),
            title: 'Choose your $label',
            onSelect: onSelect,
          ),
          child: Container(
            height: 56,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFE3E3E3), width: 2),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  value ?? hint,
                  style: value == null
                      ? kHintText
                      : const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w300,
                          color: Colors.black,
                        ),
                ),
                const Icon(Iconsax.arrow_down_1, color: Colors.black),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNextButton() {
    return CustomButton(text: 'Next');
  }

  Widget _buildLoginPrompt() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Already have an account? ', style: kSubHeaderText),
        InkWell(
          onTap: () {},
          child: const Text('Log In', style: kSubHeaderText2),
        ),
      ],
    );
  }
}
