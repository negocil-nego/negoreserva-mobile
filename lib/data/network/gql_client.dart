import 'package:dio/dio.dart';
import 'package:mobile/data/network/api_config.dart';

class GqlResponse<T> {
  final T? data;
  final List<GqlError>? errors;

  GqlResponse({this.data, this.errors});

  factory GqlResponse.fromJson(Map<String, dynamic> json, T Function(dynamic)? fromJson) {
    return GqlResponse(
      data: json['data'] != null && fromJson != null ? fromJson(json['data']) : null,
      errors: json['errors'] != null
          ? (json['errors'] as List).map((e) => GqlError.fromJson(e)).toList()
          : null,
    );
  }
}

class GqlError {
  final String message;
  final Map<String, dynamic>? extensions;

  GqlError({required this.message, this.extensions});

  factory GqlError.fromJson(Map<String, dynamic> json) {
    return GqlError(
      message: json['message'] ?? '',
      extensions: json['extensions'] as Map<String, dynamic>?,
    );
  }
}

class GqlClient {
  final Dio _dio;

  GqlClient({Dio? dio})
      : _dio = dio ??
            Dio(BaseOptions(
              baseUrl: ApiConfig.graphqlEndpoint,
              contentType: 'application/json',
              connectTimeout: const Duration(seconds: 15),
              receiveTimeout: const Duration(seconds: 15),
            ));

  void setToken(String? token) {
    if (token != null) {
      _dio.options.headers['Authorization'] = 'Bearer $token';
    } else {
      _dio.options.headers.remove('Authorization');
    }
  }

  Future<GqlResponse<Map<String, dynamic>>> mutate(
    String query, {
    Map<String, dynamic>? variables,
  }) async {
    try {
      final response = await _dio.post('', data: {
        'query': query,
        'variables': variables ?? {},
      });

      if (response.statusCode == 200) {
        final body = response.data as Map<String, dynamic>;
        final gqlResponse = GqlResponse<Map<String, dynamic>>.fromJson(body, (data) => data as Map<String, dynamic>);

        if (gqlResponse.errors != null && gqlResponse.errors!.isNotEmpty) {
          throw GqlException(gqlResponse.errors!.map((e) => e.message).join('\n'));
        }

        return gqlResponse;
      }

      throw GqlException('HTTP ${response.statusCode}: ${response.statusMessage}');
    } on DioException catch (e) {
      throw GqlException('Network error: ${e.message}');
    }
  }
}

class GqlException implements Exception {
  final String message;
  GqlException(this.message);

  @override
  String toString() => message;
}
