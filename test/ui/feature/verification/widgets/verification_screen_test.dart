import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/_import.dart';
import '../../../../helpers/widget_test_helper.dart';

void main() {
  group('VerificationScreen', () {
    testWidgets('renders key elements with provided email', (tester) async {
      await tester.pumpWidget(
        wrapWithGoRouter(
          const VerificationScreen(
            email: 'user@email.com',
            otpId: 'otp-id',
            userId: 'user-id',
          ),
        ),
      );
      await tester.pump();

      expect(find.text('Enter your\nVerification Code'), findsOneWidget);
      expect(find.text('Verify'), findsOneWidget);
    });

    testWidgets('renders 4 OTP input fields', (tester) async {
      await tester.pumpWidget(
        wrapWithGoRouter(
          const VerificationScreen(
            email: 'user@email.com',
            otpId: 'otp-id',
            userId: 'user-id',
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(OtpInputField), findsNWidgets(4));
    });

    testWidgets('renders resend link', (tester) async {
      await tester.pumpWidget(
        wrapWithGoRouter(
          const VerificationScreen(
            email: 'test@email.com',
            otpId: 'otp-id',
            userId: 'user-id',
          ),
        ),
      );
      await tester.pump();

      expect(
        find.text("I didn't received the code? Send again"),
        findsOneWidget,
      );
    });
  });
}
