import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobile/_import.dart';

class VerificationScreen extends StatefulWidget {
  final String email;
  const VerificationScreen({super.key, this.email = 'brajaoma*****@gmail.com'});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final _controllers = List.generate(4, (_) => TextEditingController());
  final _focusNodes = List.generate(4, (_) => FocusNode());
  int _seconds = 299; // 4:59
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (_seconds == 0) {
        t.cancel();
      } else {
        setState(() => _seconds--);
      }
    });
  }

  void _resend() {
    setState(() => _seconds = 299);
    _startTimer();
  }

  String get _timerLabel {
    final m = _seconds ~/ 60;
    final s = _seconds % 60;
    return '${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    _timer?.cancel();
    for (final c in _controllers) c.dispose();
    for (final f in _focusNodes) f.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.text),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Verification', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.text)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 32),
            const Text(
              'Enter your\nVerification Code',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: AppColors.text, height: 1.25),
            ),
            const SizedBox(height: 36),
            // OTP Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(4, (i) => OtpInputField(
                controller: _controllers[i],
                focusNode: _focusNodes[i],
                nextFocus: i < 3 ? _focusNodes[i + 1] : null,
                prevFocus: i > 0 ? _focusNodes[i - 1] : null,
              )),
            ),
            const SizedBox(height: 20),
            // Timer
            Text(
              _timerLabel,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: AppColors.primary),
            ),
            const SizedBox(height: 16),
            // Info text
            RichText(
              text: TextSpan(
                style: const TextStyle(fontSize: 13, color: AppColors.textSecondary, height: 1.5),
                children: [
                  const TextSpan(text: 'We send verification code to your\nemail '),
                  TextSpan(
                    text: widget.email,
                    style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.w500),
                  ),
                  const TextSpan(text: '. You can\ncheck your inbox.'),
                ],
              ),
            ),
            const SizedBox(height: 12),
            GestureDetector(
              onTap: _seconds == 0 ? _resend : null,
              child: Text(
                "I didn't received the code? Send again",
                style: TextStyle(
                  fontSize: 13,
                  color: _seconds == 0 ? AppColors.primary : AppColors.textSecondary,
                  decoration: TextDecoration.underline,
                  decorationColor: _seconds == 0 ? AppColors.primary : AppColors.textSecondary,
                ),
              ),
            ),
            const Spacer(),
            PrimaryButton(label: 'Verify', onPressed: () {}),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
