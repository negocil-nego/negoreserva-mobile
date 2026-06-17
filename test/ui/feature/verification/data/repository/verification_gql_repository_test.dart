import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/_import.dart';
import '../../../../../helpers/faker_data.dart';
import '../../../../../helpers/mock_gql_client.dart';

void main() {
  group('VerificationGqlRepository', () {
    late MockGqlClient mockClient;
    late VerificationGqlRepository repository;

    setUp(() {
      mockClient = MockGqlClient();
      repository = VerificationGqlRepository(mockClient);
    });

    group('confirmOtp', () {
      test('returns UserAuthResponse on success', () async {
        final fakeData = fakeUserAuthJson();
        mockClient.mockMutateResponse({'pubConfirmOtp': fakeData});

        final request = ConfirmOtpInput(otpId: 'otp-id', code: '1234');
        final result = await repository.confirmOtp(request);

        expect(result.token, fakeData['token']);
        expect(result.name, fakeData['name']);
        expect(result.email, fakeData['email']);
      });

      test('throws GqlException on error', () async {
        mockClient.mockMutateError('Código inválido');

        final request = ConfirmOtpInput(otpId: 'otp-id', code: '0000');

        expect(
          () => repository.confirmOtp(request),
          throwsA(isA<GqlException>()),
        );
      });
    });

    group('resendOtp', () {
      test('returns CreateAccountResponse on success', () async {
        final fakeData = fakeCreateAccountJson();
        mockClient.mockMutateResponse({'pubResendOtp': fakeData});

        final request = ResendOtpInput(otpId: 'otp-id', userId: 'user-id');
        final result = await repository.resendOtp(request);

        expect(result.otpId, fakeData['otpId']);
        expect(result.userId, fakeData['userId']);
      });

      test('throws GqlException on error', () async {
        mockClient.mockMutateError('Erro ao reenviar');

        final request = ResendOtpInput(otpId: 'otp-id', userId: 'user-id');

        expect(
          () => repository.resendOtp(request),
          throwsA(isA<GqlException>()),
        );
      });
    });
  });
}
