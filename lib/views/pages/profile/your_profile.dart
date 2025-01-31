// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:snad_box/widgets/custom_btn.dart';
import 'package:snad_box/widgets/input_widgets/custom_input_field.dart';

import '../../../utils/constants.dart';
import '../../../widgets/custom_drag_handle.dart';
import '../../../widgets/input_widgets/custom_password_field.dart';

class YourProfileScreen extends StatefulWidget {
  const YourProfileScreen({super.key});

  @override
  State<YourProfileScreen> createState() => _YourProfileScreenState();
}

class _YourProfileScreenState extends State<YourProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgcolor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kBgcolor,
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
      body: Column(children: [
        // Static "Order History" row
        Container(
          // color: kBgcolor, // Background color for the header
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Your Profile',
                style: kPageHeader,
              ),
            ],
          ),
        ),
        Flexible(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 150,
                  width: double.infinity,
                  child: Column(
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: kIconButtonColor,
                            border: Border.all(
                              color: kButtonColor,
                              width: 2,
                            )),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        height: 30,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 5),
                        constraints: const BoxConstraints(
                          minWidth: 1,
                          maxWidth: double.infinity,
                        ),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(90)),
                          color: kIconButtonColor2,
                        ),
                        child: const Text(
                          'primachofterra',
                          style: kUsername,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                YourProfileItem(
                  label: 'Full Name',
                  text: 'Aiseosa Idahor',
                  enabled: false,
                  editbtn: () {},
                ),
                YourProfileItem(
                  label: 'Email Address',
                  text: 'aiseosa@gmail.com',
                  editbtn: () {
                    _showBottomSheet(context, 'Email Address');
                  },
                ),
                YourProfileItem(
                  label: 'Phone Number',
                  text: '+234 902 247 1342',
                  editbtn: () {
                    _showBottomSheet(context, 'Phone Number');
                  },
                ),
                YourProfileItem(
                    label: 'Address',
                    text: 'DA 82, Shagari Estate Ipaja, Alimosho Lagos',
                    editbtn: () {
                      _showBottomSheet(context, 'Address');
                    }),
                YourProfileItem(
                  label: 'Password',
                  text: '***********',
                  editbtn: () {
                    _showBottomSheet(context, 'Password');
                  },
                ),
              ],
            ),
          ),
        ))
      ]),
    );
  }
}

class YourProfileItem extends StatelessWidget {
  final String label;
  final String text;
  final bool? isPassword;
  final bool enabled;
  final VoidCallback? editbtn;
  const YourProfileItem({
    super.key,
    required this.label,
    required this.text,
    this.isPassword,
    required this.editbtn,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: kPageSubHeader,
              ),
              Opacity(
                opacity: enabled ? 1 : 0.5,
                child: GestureDetector(
                  onTap: editbtn,
                  child: Container(
                    width: 56,
                    height: 28,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(90)),
                        color: Color(0xffe1e1e1)),
                    alignment: Alignment.center,
                    child: const Text(
                      'EDIT',
                      style: kEditButtonText,
                    ),
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              text,
              style: kProfileDetails,
            ),
          ),
          const Divider(thickness: 1.0, color: Color(0xFFE3E3E3))
        ],
      ),
    );
  }
}

void _showBottomSheet(BuildContext context, String option) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    backgroundColor: kBgcolor,
    builder: (BuildContext context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context)
              .viewInsets
              .bottom, // Moves up on keyboard open
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            double screenHeight = constraints.maxHeight;
            double contentHeight = _calculateContentHeight(option);

            // Convert pixel height to fraction of screen height
            double initialSize = (contentHeight / screenHeight).clamp(0.3, 0.8);

            return DraggableScrollableSheet(
              initialChildSize: initialSize, // Dynamic based on content
              minChildSize: initialSize, // Same as initial to prevent shrinking
              maxChildSize: 0.9, // Maximum limit
              expand: false,
              builder: (context, scrollController) {
                return SingleChildScrollView(
                  controller: scrollController,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 24),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Drag Handle
                        const CustomDragHandle(),
                        const SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Edit $option',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(
                                  Iconsax.close_circle,
                                  size: 24,
                                ))
                          ],
                        ),
                        const SizedBox(height: 24),
                        _getContent(option), // Dynamic Content
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      );
    },
  );
}

/// Calculates the expected height of the content based on the option
double _calculateContentHeight(String option) {
  switch (option) {
    case 'Email Address':
      return 350; // Approx height of elements in pixels
    case 'Phone Number':
      return 350;
    case 'Address':
      return 450;
    case 'Password':
      return 350;
    default:
      return 150;
  }
}

/// Returns content based on the selected option
Widget _getContent(String option) {
  switch (option) {
    case 'Email Address':
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Enter Email Address', style: kFormLabelText),
          const SizedBox(height: 10),
          CustomInputField(hintText: 'Enter your new email address'),
          const SizedBox(height: 24),
          CustomButton(text: 'Save Changes', onPressed: () {}),
        ],
      );
    case 'Phone Number':
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Enter Phone Number', style: kFormLabelText),
          const SizedBox(height: 10),
          CustomInputField(hintText: 'Enter your phone number'),
          const SizedBox(height: 24),
          CustomButton(text: 'Save Changes', onPressed: () {}),
        ],
      );
    case 'Address':
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Enter Address', style: kFormLabelText),
          const SizedBox(height: 10),
          CustomInputField(hintText: 'Enter your address'),
          const SizedBox(height: 24),
          CustomButton(text: 'Save Changes', onPressed: () {}),
        ],
      );
    case 'Password':
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Enter New Password', style: kFormLabelText),
          const SizedBox(height: 10),
          CustomPasswordInputField(hintText: 'New Password'),
          const SizedBox(height: 24),
          CustomButton(text: 'Save Changes', onPressed: () {}),
        ],
      );
    default:
      return const Text('Invalid option selected.');
  }
}
