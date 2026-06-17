import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mobile/_import.dart';

class MockResetPasswordRepository extends Mock
    implements ResetPasswordRepository {}

void main() {
  group('ResetPasswordService', () {
    late MockResetPasswordRepository mockRepo;
    late ResetPasswordService service;

    setUpAll(() {
      registerFallbackValue(ResetPasswordRequest(code: '', password: '', confirm: ''));
    });

    setUp(() {
      mockRepo = MockResetPasswordRepository();
      service = ResetPasswordService(mockRepo);
    });

    test('forgetResetPassword returns true', () async {
      when(() => mockRepo.forgetResetPassword(any()))
          .thenAnswer((_) async => true);

      final request = ResetPasswordRequest(code: '123456', password: 'newpass', confirm: 'newpass');
      final result = await service.forgetResetPassword(request);

      expect(result, true);
    });

    test('forgetResetPassword propagates exception', () async {
      when(() => mockRepo.forgetResetPassword(any()))
          .thenThrow(GqlException('Erro'));

      final request = ResetPasswordRequest(code: '000000', password: 'newpass', confirm: 'newpass');

      expect(
        () => service.forgetResetPassword(request),
        throwsA(isA<GqlException>()),
      );
    });
  });
}
