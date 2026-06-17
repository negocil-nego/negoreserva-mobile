import 'package:flutter_test/flutter_test.dart';
import 'package:faker/faker.dart';
import 'package:mobile/_import.dart';

void main() {
  group('ForgetPasswordRequest', () {
    test('toJson returns correct map', () {
      final input = Faker().internet.email();
      final request = ForgetPasswordRequest(input: input);
      final json = request.toJson();

      expect(json['input'], input);
    });
  });
}
