import 'package:faker/faker.dart';
import 'package:mobile/_import.dart';

final _faker = Faker();

Map<String, dynamic> fakeUserAuthJson() => {
      'token': _faker.guid.guid(),
      'name': _faker.person.name(),
      'email': _faker.internet.email(),
      'type': 'CLIENT',
      'status': 'VERIFIED',
      'logo': _faker.internet.httpsUrl(),
      'expiredAt': _faker.date.dateTime().toIso8601String(),
    };

Map<String, dynamic> fakeCreateAccountJson() => {
      'otpId': _faker.guid.guid(),
      'userId': _faker.guid.guid(),
      'token': _faker.guid.guid(),
      'otpExpiredAt': _faker.date.dateTime().toIso8601String(),
      'status': true,
      'expiredAt': _faker.date.dateTime().toIso8601String(),
    };

UserAuthResponse fakeUserAuthResponse() =>
    UserAuthResponse.fromJson(fakeUserAuthJson());

CreateAccountResponse fakeCreateAccountResponse() =>
    CreateAccountResponse.fromJson(fakeCreateAccountJson());
