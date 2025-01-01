import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';
import '../widgets/custom_btn.dart';

class OnbardingScreen extends StatelessWidget {
  const OnbardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgcolor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset('assets/images/o_logo.svg'),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  const SizedBox(
                    width: 382,
                    child: Text('Your shopping needs all in one place.',
                        style: kHeaderText),
                  ),
                  const SizedBox(height: 15),
                  const SizedBox(
                      width: 382,
                      child: Text(
                        'We take away the hassle from shopping and managing your store! Interface with our verified vendors.',
                        style: kSubHeaderText,
                      )),
                  const SizedBox(height: 30),
                  const CustomButton(),
                ],
              ),
            ),
            const Spacer(),
            SvgPicture.asset('assets/images/illu_1.svg'),
            const SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}
