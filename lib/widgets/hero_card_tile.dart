import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/constants.dart';

class HeroCardTile extends StatelessWidget {
  const HeroCardTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Container(
              width: double.infinity,
              height: 214,
              decoration: BoxDecoration(
                  color: kIconButtonColor,
                  borderRadius: BorderRadius.circular(16)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15, left: 15),
                    child: Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              height: 16,
                              width: 15,
                              child:
                                  SvgPicture.asset('assets/images/logo.svg')),
                          const SizedBox(height: 10),
                          const SizedBox(
                            width: 221,
                            height: 64,
                            child: Text(
                              'Own your own online store 😁',
                              style: kHeroMessage,
                            ),
                          ),
                          const SizedBox(height: 5),
                          const SizedBox(
                            width: 171,
                            height: 36,
                            child: Text(
                              'Create your store easily with our easy to use tools',
                              style: kHeroText,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Container(
                            width: 120,
                            height: 34,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(56)),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Get Started',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    height: 1.50,
                                  ),
                                ),
                                SizedBox(width: 3),
                                Icon(
                                  Icons.arrow_forward,
                                  size: 16,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),

                  //SVG

                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(16),
                            topRight: Radius.circular(12)),
                        child: SvgPicture.asset(
                          'assets/images/card_illus.svg',
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}


// Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         SizedBox(
//                             height: 16,
//                             width: 15,
//                             child: SvgPicture.asset('assets/images/logo.svg')),
//                         const SizedBox(height: 10),
//                         const SizedBox(
//                           width: 221,
//                           height: 64,
//                           child: Text(
//                             'Own your own online store 😁',
//                             style: kHeroMessage,
//                           ),
//                         ),
//                         const SizedBox(height: 5),
//                         const SizedBox(
//                           width: 171,
//                           height: 36,
//                           child: Text(
//                             'Create your store easily with our easy to use tools',
//                             style: kHeroText,
//                           ),
//                         ),
//                         const SizedBox(height: 15),
//                         Container(
//                           width: 120,
//                           height: 34,
//                           decoration: BoxDecoration(
//                               color: Colors.black,
//                               borderRadius: BorderRadius.circular(56)),
//                           child: const Row(
//                             mainAxisSize: MainAxisSize.min,
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Text(
//                                 'Get Started',
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 12,
//                                   fontWeight: FontWeight.w500,
//                                   height: 1.50,
//                                 ),
//                               ),
//                               SizedBox(width: 3),
//                               Icon(
//                                 Icons.arrow_forward,
//                                 size: 16,
//                                 color: Colors.white,
//                               ),
//                             ],
//                           ),
//                         )
//                       ],
//                     ),