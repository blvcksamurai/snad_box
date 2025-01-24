import 'package:flutter/material.dart';

import '../createAccount/step1.dart';
import '../createAccount/step2.dart';
import '../createAccount/step3.dart';

class OnboardingFlow extends StatefulWidget {
  const OnboardingFlow({super.key});

  @override
  State<OnboardingFlow> createState() => _OnboardingFlowState();
}

class _OnboardingFlowState extends State<OnboardingFlow> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  void _goToNextPage() {
    if (_currentPage < 2) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _goToPreviousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: 3,
              onPageChanged: _onPageChanged,
              itemBuilder: (context, index) {
                switch (index) {
                  case 0:
                    return const StepOne();
                  case 1:
                    return const StepTwo();
                  case 2:
                    return const StepThree();
                  default:
                    return const SizedBox.shrink();
                }
              },
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(16.0),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       if (_currentPage > 0)
          //         ElevatedButton(
          //           onPressed: _goToPreviousPage,
          //           child: const Text("Back"),
          //         ),
          //       if (_currentPage < 2)
          //         ElevatedButton(
          //           onPressed: _goToNextPage,
          //           child: const Text("Next"),
          //         ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
