import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mobile/_import.dart';
import '../../../../../helpers/faker_data.dart';

class MockVerificationRepository extends Mock
    implements VerificationRepository {}

void main() {
  group('VerificationService', () {
    late MockVerificationRepository mockRepo;
    late VerificationService service;

    setUpAll(() {
      registerFallbackValue(ConfirmOtpInput(otpId: '', code: ''));
      registerFallbackValue(ResendOtpInput(otpId: '', userId: ''));
    });

    setUp(() {
      mockRepo = MockVerificationRepository();
      service = VerificationService(mockRepo);
    });

    group('confirmOtp', () {
      test('returns UserAuthResponse', () async {
        final fakeResponse = fakeUserAuthResponse();
        when(() => mockRepo.confirmOtp(any()))
            .thenAnswer((_) async => fakeResponse);

        final request = ConfirmOtpInput(otpId: 'otp-id', code: '1234');
        final result = await service.confirmOtp(request);

        expect(result.token, fakeResponse.token);
      });

      test('propagates exception', () async {
        when(() => mockRepo.confirmOtp(any()))
            .thenThrow(GqlException('Erro'));

        final request = ConfirmOtpInput(otpId: 'otp-id', code: '0000');

        expect(
          () => service.confirmOtp(request),
          throwsA(isA<GqlException>()),
        );
      });
    });

    group('resendOtp', () {
      test('returns CreateAccountResponse', () async {
        final fakeResponse = fakeCreateAccountResponse();
        when(() => mockRepo.resendOtp(any()))
            .thenAnswer((_) async => fakeResponse);

        final request = ResendOtpInput(otpId: 'otp-id', userId: 'user-id');
        final result = await service.resendOtp(request);

        expect(result.otpId, fakeResponse.otpId);
      });

      test('propagates exception', () async {
        when(() => mockRepo.resendOtp(any()))
            .thenThrow(GqlException('Erro'));

        final request = ResendOtpInput(otpId: 'otp-id', userId: 'user-id');

        expect(
          () => service.resendOtp(request),
          throwsA(isA<GqlException>()),
        );
      });
    });
  });
}
