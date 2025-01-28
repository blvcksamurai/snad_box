// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../utils/constants.dart';

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
                  editbtn: () {},
                ),
                YourProfileItem(
                  label: 'Phone Number',
                  text: '+234 902 247 1342',
                  editbtn: () {},
                ),
                YourProfileItem(
                    label: 'Address',
                    text: 'DA 82, Shagari Estate Ipaja, Alimosho Lagos',
                    editbtn: () {}),
                YourProfileItem(
                    label: 'Password', text: '***********', editbtn: () {}),
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
