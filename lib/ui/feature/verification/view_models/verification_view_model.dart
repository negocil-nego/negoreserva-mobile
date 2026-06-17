import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mobile/_import.dart';

class VerificationViewModel extends ChangeNotifier {
  final List<TextEditingController> controllers =
      List.generate(4, (_) => TextEditingController());
  final List<FocusNode> focusNodes =
      List.generate(4, (_) => FocusNode());

  final String? otpId;
  final String? userId;

  final _service = VerificationService(VerificationGqlRepository(GqlClient()));

  int _seconds = 299;
  Timer? _timer;
  bool _isLoading = false;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  int get seconds => _seconds;
  bool get canResend => _seconds == 0;

  String get timerLabel {
    final m = _seconds ~/ 60;
    final s = _seconds % 60;
    return '${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
  }

  String get otpCode => controllers.map((c) => c.text).join();

  VerificationViewModel({this.otpId, this.userId}) {
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (_seconds == 0) {
        t.cancel();
      } else {
        _seconds--;
        notifyListeners();
      }
    });
  }

  void resend() {
    _seconds = 299;
    _startTimer();
    notifyListeners();

    if (otpId != null && userId != null) {
      _service.resendOtp(ResendOtpInput(otpId: otpId!, userId: userId!));
    }
  }

  Future<bool> verify() async {
    if (otpId == null) return false;

    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      await _service.confirmOtp(ConfirmOtpInput(otpId: otpId!, code: otpCode));
      _isLoading = false;
      notifyListeners();
      return true;
    } on GqlException catch (e) {
      _isLoading = false;
      _errorMessage = e.message;
      notifyListeners();
      return false;
    } catch (e) {
      _isLoading = false;
      _errorMessage = 'Erro inesperado: $e';
      notifyListeners();
      return false;
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    for (final c in controllers) { c.dispose(); }
    for (final f in focusNodes) { f.dispose(); }
    super.dispose();
  }
}
