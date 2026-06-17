import 'package:flutter_test/flutter_test.dart';
import 'package:faker/faker.dart';
import 'package:mobile/_import.dart';

void main() {
  group('LoginRequest', () {
    final faker = Faker();

    test('toJson returns correct map', () {
      final username = faker.internet.email();
      final password = faker.internet.password();
      final request = LoginRequest(username: username, password: password);
      final json = request.toJson();

      expect(json['username'], username);
      expect(json['password'], password);
    });

    test('toJson returns map with correct keys', () {
      final request = LoginRequest(username: 'test@email.com', password: '123456');
      final json = request.toJson();

      expect(json.keys, containsAll(['username', 'password']));
    });
  });
}
