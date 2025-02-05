import 'package:flutter/material.dart';
import 'package:snad_box/models/create_store_model.dart';
import 'package:snad_box/utils/constants.dart';
import 'package:snad_box/views/pages/stores/store_steps/store_details.dart';
import 'package:snad_box/views/pages/stores/store_steps/store_name.dart';
import 'package:snad_box/widgets/custom_btn.dart';
import 'package:snad_box/widgets/hero_card_tile.dart';

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
    final isLastPage =
        _currentPage >= _createStoreBrain.createstoresData.length - 1;

    if (!isLastPage) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // Handle the final action, like navigation or completion
      print('Final Submit Action');
      // Example: Navigate to another screen
      // Navigator.pushReplacementNamed(context, '/nextScreen');
    }
  }

  void _navigateToPreviousPage() {
    final isFirstPage = _currentPage <= 0;

    if (!isFirstPage) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      setState(() {
        _currentPage--; // Synchronize the state with the PageView
      });
    } else {
      print('Already on the first page');
    }
  }

  Widget _getStepWidget() {
    switch (_currentPage) {
      case 0:
        return const CreateStoreName();
      case 1:
        return const CreateStoreDetails();
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
      appBar: AppBar(
        leading: _currentPage > 0
            ? IconButton(
                onPressed: _navigateToPreviousPage,
                icon: const Icon(Icons.arrow_back),
              )
            : IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back)),
      ),
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
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
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
                    StepCounterBtn(
                      ontap: () {},
                      step: "Step ${content.step} of 4",
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  content.subtext,
                  style: kTranHeaderTitle,
                ),
                const SizedBox(height: 24),
                Expanded(child: _getStepWidget()),
                const SizedBox(height: 24),
                CustomButton(
                  text: _createStoreBrain
                      .createstoresData[_currentPage].btnContent,
                  onPressed: _navigateToNextPage,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class StepCounterBtn extends StatelessWidget {
  final VoidCallback ontap;
  final String step;
  const StepCounterBtn({
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
          style: kCartCount,
        ),
      ),
    );
  }
}
