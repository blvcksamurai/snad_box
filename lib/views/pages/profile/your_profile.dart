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
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
        ))
      ]),
    );
  }
}
