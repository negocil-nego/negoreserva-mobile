import 'package:flutter_test/flutter_test.dart';
import 'package:faker/faker.dart';
import 'package:mobile/_import.dart';

void main() {
  group('ResetPasswordRequest', () {
    final faker = Faker();

    test('toJson returns correct map', () {
      final code = faker.randomGenerator.integer(999999).toString().padLeft(6, '0');
      final password = faker.internet.password();
      final confirm = password;

      final request = ResetPasswordRequest(code: code, password: password, confirm: confirm);
      final json = request.toJson();

      expect(json['code'], code);
      expect(json['password'], password);
      expect(json['confirm'], confirm);
    });
  });
}
