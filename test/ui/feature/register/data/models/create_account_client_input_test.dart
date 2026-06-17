import 'package:flutter_test/flutter_test.dart';
import 'package:faker/faker.dart';
import 'package:mobile/_import.dart';

void main() {
  group('CreateAccountClientInput', () {
    final faker = Faker();

    test('toJson returns correct map', () {
      final name = faker.person.name();
      final email = faker.internet.email();
      final phone = faker.phoneNumber.us();
      final password = faker.internet.password();
      final confirm = password;

      final input = CreateAccountClientInput(
        name: name,
        email: email,
        phone: phone,
        password: password,
        confirm: confirm,
      );
      final json = input.toJson();

      expect(json['name'], name);
      expect(json['email'], email);
      expect(json['phone'], phone);
      expect(json['password'], password);
      expect(json['confirm'], confirm);
    });
  });
}
