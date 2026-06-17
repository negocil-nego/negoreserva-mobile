import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/_import.dart';

class VerificationScreen extends StatefulWidget {
  final String? email;
  final String? otpId;
  final String? userId;

  const VerificationScreen({
    super.key,
    this.email,
    this.otpId,
    this.userId,
  });

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  late final VerificationViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = VerificationViewModel(
      otpId: widget.otpId,
      userId: widget.userId,
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  Future<void> _onVerify() async {
    final success = await _viewModel.verify();
    if (success && mounted) {
      context.go(Routes.home);
    }
  }

  @override
  Widget build(BuildContext context) {
    final email = widget.email ?? 'brajaoma*****@gmail.com';

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.text),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Verification',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.text)),
        centerTitle: true,
      ),
      body: ListenableBuilder(
        listenable: _viewModel,
        builder: (context, _) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 32),
                const Text(
                  'Enter your\nVerification Code',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppColors.text,
                    height: 1.25,
                  ),
                ),
                const SizedBox(height: 36),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    4,
                    (i) => OtpInputField(
                      controller: _viewModel.controllers[i],
                      focusNode: _viewModel.focusNodes[i],
                      nextFocus:
                          i < 3 ? _viewModel.focusNodes[i + 1] : null,
                      prevFocus: i > 0 ? _viewModel.focusNodes[i - 1] : null,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  _viewModel.timerLabel,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: 16),
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 13,
                      color: AppColors.textSecondary,
                      height: 1.5,
                    ),
                    children: [
                      const TextSpan(
                          text: 'We send verification code to your\nemail '),
                      TextSpan(
                        text: email,
                        style: const TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const TextSpan(text: '. You can\ncheck your inbox.'),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                GestureDetector(
                  onTap: _viewModel.canResend ? _viewModel.resend : null,
                  child: Text(
                    "I didn't received the code? Send again",
                    style: TextStyle(
                      fontSize: 13,
                      color: _viewModel.canResend
                          ? AppColors.primary
                          : AppColors.textSecondary,
                      decoration: TextDecoration.underline,
                      decorationColor: _viewModel.canResend
                          ? AppColors.primary
                          : AppColors.textSecondary,
                    ),
                  ),
                ),
                if (_viewModel.errorMessage != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      _viewModel.errorMessage!,
                      style: const TextStyle(
                          color: AppColors.error, fontSize: 13),
                    ),
                  ),
                const Spacer(),
                PrimaryButton(
                  label: 'Verify',
                  isLoading: _viewModel.isLoading,
                  onPressed: _viewModel.isLoading ? null : _onVerify,
                ),
                const SizedBox(height: 40),
              ],
            ),
          );
        },
      ),
    );
  }
}
