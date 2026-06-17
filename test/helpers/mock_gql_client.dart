import 'package:mobile/data/network/gql_client.dart';
import 'package:mocktail/mocktail.dart';

class MockGqlClient extends Mock implements GqlClient {
  void mockMutateResponse(Map<String, dynamic> data) {
    registerFallbackValue('');
    registerFallbackValue(<String, dynamic>{});
    when(() => mutate(
          any(),
          variables: any(named: 'variables'),
        )).thenAnswer((_) async => GqlResponse<Map<String, dynamic>>(
              data: data,
            ));
  }

  void mockMutateError(String message) {
    registerFallbackValue('');
    registerFallbackValue(<String, dynamic>{});
    when(() => mutate(
          any(),
          variables: any(named: 'variables'),
        )).thenThrow(GqlException(message));
  }
}
