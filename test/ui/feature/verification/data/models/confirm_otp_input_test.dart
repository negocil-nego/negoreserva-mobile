import 'package:flutter_test/flutter_test.dart';
import 'package:faker/faker.dart';
import 'package:mobile/_import.dart';

void main() {
  group('ConfirmOtpInput', () {
    final faker = Faker();

    test('toJson returns correct map', () {
      final otpId = faker.guid.guid();
      final code = faker.randomGenerator.integer(9999).toString().padLeft(4, '0');
      final input = ConfirmOtpInput(otpId: otpId, code: code);
      final json = input.toJson();

      expect(json['otpId'], otpId);
      expect(json['code'], code);
    });
  });
}
