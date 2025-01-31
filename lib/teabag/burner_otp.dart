import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:snad_box/utils/constants.dart';

class BurnerOTP extends StatefulWidget {
  const BurnerOTP({super.key});

  @override
  _BurnerOTPState createState() => _BurnerOTPState();
}

class _BurnerOTPState extends State<BurnerOTP> {
  final TextEditingController _otpController = TextEditingController();
  Timer? _timer;
  int _start = 30; // Cooldown duration (in seconds)
  bool _canResend = false; // Disable "Resend" button initially

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  /// Starts the cooldown timer
  void _startTimer() {
    setState(() => _canResend = false);
    _start = 30; // Reset timer
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_start == 0) {
        setState(() {
          _canResend = true; // Enable "Resend OTP" button
          _timer?.cancel();
        });
      } else {
        setState(() => _start--);
      }
    });
  }

  /// Simulates sending OTP and restarts cooldown
  void _resendOtp() {
    print("OTP Resent!");
    _startTimer(); // Restart cooldown
  }

  void _submitOtp(String otp) {
    if (otp.length == 6) {
      print("Entered OTP: $otp");
      // Handle OTP verification
    } else {
      print("Incomplete OTP");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Enter OTP"),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Enter the 6-digit OTP sent to your phone",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),

              /// OTP Input Field
              Pinput(
                keyboardType: TextInputType.number,
                length: 6,
                controller: _otpController,
                defaultPinTheme: PinTheme(
                  width: 57,
                  height: 70,
                  textStyle: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.red, width: 1.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                focusedPinTheme: PinTheme(
                  width: 57,
                  height: 70,
                  textStyle: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: kButtonColor, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onCompleted: _submitOtp,
              ),
              const SizedBox(height: 30),

              /// Verify Button
              ElevatedButton(
                onPressed: () => _submitOtp(_otpController.text),
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  textStyle: const TextStyle(fontSize: 18),
                ),
                child: const Text("Verify OTP"),
              ),
              const SizedBox(height: 20),

              /// Resend OTP Button + Timer
              TextButton(
                onPressed: _canResend
                    ? _resendOtp
                    : null, // Disable if cooldown is active
                child: Text(
                  _canResend ? "Resend OTP" : "Resend OTP in $_start sec",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: _canResend
                        ? Colors.blue
                        : Colors.grey, // Grey when disabled
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel(); // Stop the timer when leaving screen
    super.dispose();
  }
}
