import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:snad_box/utils/constants.dart';

import '../../widgets/custom_btn.dart';

class kTests extends StatelessWidget {
  const kTests({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgcolor,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        color: Colors.red,
        height: 150,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total'),
                Text('N4130'),
              ],
            ),
            const SizedBox(height: 15),
            CustomButton(text: 'Continue to Shopping')
          ],
        ),
      ),
    );
  }
}
