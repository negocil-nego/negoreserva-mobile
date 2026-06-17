import 'package:flutter_test/flutter_test.dart';
import 'package:faker/faker.dart';
import 'package:mobile/_import.dart';

void main() {
  group('ResendOtpInput', () {
    final faker = Faker();

    test('toJson returns correct map', () {
      final otpId = faker.guid.guid();
      final userId = faker.guid.guid();
      final input = ResendOtpInput(otpId: otpId, userId: userId);
      final json = input.toJson();

      expect(json['otpId'], otpId);
      expect(json['userId'], userId);
    });
  });
}
