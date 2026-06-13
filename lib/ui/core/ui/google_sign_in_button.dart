import 'package:flutter/material.dart';
import 'package:mobile/_import.dart';

class GoogleSignInButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;

  const GoogleSignInButton({
    super.key,
    this.label = 'Sign Up with Google',
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.text,
          side: const BorderSide(color: AppColors.inputBorder, width: 1.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _GoogleLogo(),
            const SizedBox(width: 10),
            Text(
              label,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: AppColors.text,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GoogleLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 22,
      height: 22,
      child: CustomPaint(painter: _GoogleLogoPainter()),
    );
  }
}

class _GoogleLogoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final r = size.width / 2;
    final cx = size.width / 2;
    final cy = size.height / 2;

    // Blue
    canvas.drawArc(
      Rect.fromCircle(center: Offset(cx, cy), radius: r),
      -1.57, 1.57, true,
      Paint()..color = const Color(0xFF4285F4),
    );
    // Green
    canvas.drawArc(
      Rect.fromCircle(center: Offset(cx, cy), radius: r),
      0, 1.57, true,
      Paint()..color = const Color(0xFF34A853),
    );
    // Yellow
    canvas.drawArc(
      Rect.fromCircle(center: Offset(cx, cy), radius: r),
      1.57, 1.0, true,
      Paint()..color = const Color(0xFFFBBC05),
    );
    // Red
    canvas.drawArc(
      Rect.fromCircle(center: Offset(cx, cy), radius: r),
      2.57, 0.57, true,
      Paint()..color = const Color(0xFFEA4335),
    );

    // White center
    canvas.drawCircle(
      Offset(cx, cy),
      r * 0.58,
      Paint()..color = Colors.white,
    );
  }

  @override
  bool shouldRepaint(_) => false;
}
