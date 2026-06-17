import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/_import.dart';
import '../../helpers/faker_data.dart';

void main() {
  group('UserAuthResponse', () {
    test('fromJson creates instance with correct values', () {
      final json = fakeUserAuthJson();
      final model = UserAuthResponse.fromJson(json);

      expect(model.token, json['token']);
      expect(model.name, json['name']);
      expect(model.email, json['email']);
      expect(model.type, json['type']);
      expect(model.status, json['status']);
      expect(model.logo, json['logo']);
      expect(model.expiredAt, json['expiredAt']);
    });

    test('fromJson handles empty strings', () {
      final json = {
        'token': '',
        'name': '',
        'email': '',
        'type': '',
        'status': '',
        'logo': '',
        'expiredAt': '',
      };
      final model = UserAuthResponse.fromJson(json);

      expect(model.token, '');
      expect(model.name, '');
      expect(model.email, '');
      expect(model.type, '');
      expect(model.status, '');
      expect(model.logo, '');
      expect(model.expiredAt, '');
    });

    test('fromJson handles null values', () {
      final json = <String, dynamic>{};
      final model = UserAuthResponse.fromJson(json);

      expect(model.token, '');
      expect(model.name, '');
      expect(model.email, '');
      expect(model.type, '');
      expect(model.status, '');
      expect(model.logo, '');
      expect(model.expiredAt, '');
    });
  });
}
