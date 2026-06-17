import 'package:mobile/data/models/create_account_response.dart';
import 'package:mobile/data/models/user_auth_response.dart';
import 'package:mobile/data/network/gql_client.dart';
import 'package:mobile/ui/feature/verification/data/models/confirm_otp_input.dart';
import 'package:mobile/ui/feature/verification/data/models/resend_otp_input.dart';
import 'package:mobile/ui/feature/verification/data/repository/verification_repository.dart';

class VerificationGqlRepository implements VerificationRepository {
  final GqlClient _client;

  VerificationGqlRepository(this._client);

  @override
  Future<UserAuthResponse> confirmOtp(ConfirmOtpInput request) async {
    const query = '''
      mutation pubConfirmOtp(\$request: ConfirmUserOtpVerificationInput!) {
        pubConfirmOtp(request: \$request) {
          token
          name
          email
          type
          status
          logo
          expiredAt
        }
      }
    ''';

    final response = await _client.mutate(query, variables: {'request': request.toJson()});

    final data = response.data!['pubConfirmOtp'] as Map<String, dynamic>;
    return UserAuthResponse.fromJson(data);
  }

  @override
  Future<CreateAccountResponse> resendOtp(ResendOtpInput request) async {
    const query = '''
      mutation pubResendOtp(\$request: ResendUserOtpVerificationInput!) {
        pubResendOtp(request: \$request) {
          otpId
          userId
          token
          otpExpiredAt
          status
          expiredAt
        }
      }
    ''';

    final response = await _client.mutate(query, variables: {'request': request.toJson()});

    final data = response.data!['pubResendOtp'] as Map<String, dynamic>;
    return CreateAccountResponse.fromJson(data);
  }
}
