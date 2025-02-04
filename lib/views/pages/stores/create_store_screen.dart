import 'package:flutter/material.dart';
import 'package:snad_box/models/create_store_model.dart';
import 'package:snad_box/utils/constants.dart';

class CreateStoreScreen extends StatefulWidget {
  const CreateStoreScreen({super.key});

  @override
  State<CreateStoreScreen> createState() => _CreateStoreScreenState();
}

class _CreateStoreScreenState extends State<CreateStoreScreen> {
  final PageController _pageController = PageController();
  final CreateStoreBrain _createStoreBrain = CreateStoreBrain();
  int _currentPage = 0;

  void _navigateToNextPage() {
    if (_currentPage < _createStoreBrain.createstoresData.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // Handle final action (e.g., navigate to another screen)
      print('Final Submit Action');
    }
  }

  Widget _getStepWidget() {
    switch (_currentPage) {
      case 0:
        return const Text('Step1');
      case 1:
        return const Text('Step2');
      case 2:
        return const Text('Step3');
      case 3:
        return const Text('Step4');
      default:
        return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: _createStoreBrain.createstoresData.length,
        onPageChanged: (index) {
          setState(() => _currentPage = index);
        },
        itemBuilder: (context, index) {
          final content = _createStoreBrain.createstoresData[index];
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      content.title,
                      style: kPageHeader,
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class CreateStoreBtn extends StatelessWidget {
  final VoidCallback ontap;
  final String step;
  const CreateStoreBtn({
    super.key,
    required this.ontap,
    required this.step,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 30,
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
        constraints: const BoxConstraints(
          minWidth: 1,
          maxWidth: double.infinity,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: kGrey,
        ),
        alignment: Alignment.center,
        child: Text(
          step,
          style: kFormLabelText,
        ),
      ),
    );
  }
}
