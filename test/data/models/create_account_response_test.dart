import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/_import.dart';
import '../../helpers/faker_data.dart';

void main() {
  group('CreateAccountResponse', () {
    test('fromJson creates instance with correct values', () {
      final json = fakeCreateAccountJson();
      final model = CreateAccountResponse.fromJson(json);

      expect(model.otpId, json['otpId']);
      expect(model.userId, json['userId']);
      expect(model.token, json['token']);
      expect(model.otpExpiredAt, json['otpExpiredAt']);
      expect(model.status, json['status']);
      expect(model.expiredAt, json['expiredAt']);
    });

    test('fromJson handles empty strings', () {
      final json = {
        'otpId': '',
        'userId': '',
        'token': '',
        'otpExpiredAt': '',
        'status': false,
        'expiredAt': '',
      };
      final model = CreateAccountResponse.fromJson(json);

      expect(model.otpId, '');
      expect(model.userId, '');
      expect(model.token, '');
      expect(model.otpExpiredAt, '');
      expect(model.status, false);
      expect(model.expiredAt, '');
    });

    test('fromJson handles null values', () {
      final json = <String, dynamic>{};
      final model = CreateAccountResponse.fromJson(json);

      expect(model.otpId, '');
      expect(model.userId, '');
      expect(model.token, '');
      expect(model.otpExpiredAt, '');
      expect(model.status, false);
      expect(model.expiredAt, '');
    });
  });
}
