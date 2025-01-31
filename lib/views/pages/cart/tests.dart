import 'package:confetti/confetti.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:snad_box/utils/constants.dart';

import '../../../widgets/custom_btn.dart';

class ScreenTests extends StatefulWidget {
  const ScreenTests({super.key});

  @override
  _ScreenTestsState createState() => _ScreenTestsState();
}

class _ScreenTestsState extends State<ScreenTests> {
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _confettiController =
        ConfettiController(duration: const Duration(seconds: 1));
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  void _triggerConfetti() {
    _confettiController.play(); // Start confetti animation
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Confetti Animation 🎉")),
      body: Container(
        height: 100,
        color: Colors.red,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Center(
              child: ElevatedButton(
                onPressed: _triggerConfetti,
                child: const Text("Celebrate! 🎊"),
              ),
            ),

            /// Confetti Widget
            Align(
              alignment: Alignment.topCenter, // Confetti falls from the top
              child: ConfettiWidget(
                blastDirectionality: BlastDirectionality.explosive,
                confettiController: _confettiController,
                blastDirection: -3.14 / 2,
                emissionFrequency: 0.8, // Amount of confetti per second
                numberOfParticles: 40, // Number of particles
                gravity: 0.8, // How fast it falls
                minimumSize: const Size(8, 8), // Smallest confetti
                maximumSize: const Size(10, 10), // Largest confetti
              ),
            ),
          ],
        ),
      ),
    );
  }
}
