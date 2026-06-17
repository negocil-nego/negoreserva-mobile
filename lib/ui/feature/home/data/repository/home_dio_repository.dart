import 'package:dio/dio.dart';
import 'package:mobile/data/network/api_config.dart';
import '../models/_import.dart';
import 'home_repository.dart';

class HomeDioRepository implements HomeRepository {
  final Dio _dio;

  HomeDioRepository({Dio? dio})
      : _dio = dio ??
            Dio(BaseOptions(
              baseUrl: ApiConfig.graphqlEndpoint,
              contentType: 'application/json',
              connectTimeout: const Duration(seconds: 15),
              receiveTimeout: const Duration(seconds: 15),
            ));

  static const String _searchOrganizationQuery = r'''
    query pubSearchOrganizationFilter($filter: OrganizationSearchFilterParamInput!, $paginateRequest: PaginateRequest) {
      pubSearchOrganizationFilter(filter: $filter, paginateRequest: $paginateRequest) {
        content {
          uuid
          name
          slug
          email
          phone
          address
          province
          municipality        
          rating
          image
          logo
          video
          categories {
            uuid
            name
            icon
          }
        }
        empty
        first
        last
        number
        numberOfElements
        size
        totalElements
        totalPages
      }
    }
  ''';

  static const String _searchProductQuery = r'''
    query pubSearchProductFilter($filter: ProductSearchFilterParamInput!, $paginateRequest: PaginateRequest) {
      pubSearchProductFilter(filter: $filter, paginateRequest: $paginateRequest) {
        content {
          uuid
          name
          slug
          description
          image
          price
          organization {
            uuid
            name
            slug
            email
            description
            phone
            address
            rating
            image
            logo
            video
          }
        }
        empty
        first
        last
        number
        numberOfElements
        size
        totalElements
        totalPages
      }
    }
  ''';

  @override
  Future<OrganizationPaginate> searchOrganizationFilter({
    required Map<String, dynamic> filter,
    required PaginateRequest request,
  }) async {
    try {
      final response = await _dio.post('', data: {
        'query': _searchOrganizationQuery,
        'variables': {
          'filter': filter,
          'paginateRequest': request.toJson(),
        },
      });

      if (response.statusCode == 200) {
        final body = response.data as Map<String, dynamic>;
        
        if (body['errors'] != null) {
          final errorsList = body['errors'] as List;
          final errorMsg = errorsList.map((e) => e['message'] ?? '').join('\n');
          throw Exception(errorMsg);
        }

        final data = body['data'] as Map<String, dynamic>?;
        if (data == null) {
          throw Exception('Nenhum dado retornado do servidor.');
        }

        final orgData = data['pubSearchOrganizationFilter'] as Map<String, dynamic>?;
        if (orgData == null) {
          throw Exception('Dados de organização ausentes.');
        }

        return OrganizationPaginate.fromJson(orgData);
      } else {
        throw Exception('Erro de servidor: HTTP ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Falha na conexão de rede: ${e.message}');
    } catch (e) {
      throw Exception('Erro ao carregar organizações: $e');
    }
  }

  @override
  Future<ProductPaginate> searchProductFilter({
    required Map<String, dynamic> filter,
    required PaginateRequest request,
  }) async {
    try {
      final response = await _dio.post('', data: {
        'query': _searchProductQuery,
        'variables': {
          'filter': filter,
          'paginateRequest': request.toJson(),
        },
      });

      if (response.statusCode == 200) {
        final body = response.data as Map<String, dynamic>;

        if (body['errors'] != null) {
          final errorsList = body['errors'] as List;
          final errorMsg = errorsList.map((e) => e['message'] ?? '').join('\n');
          throw Exception(errorMsg);
        }

        final data = body['data'] as Map<String, dynamic>?;
        if (data == null) {
          throw Exception('Nenhum dado retornado do servidor.');
        }

        final productData = data['pubSearchProductFilter'] as Map<String, dynamic>?;
        if (productData == null) {
          throw Exception('Dados de produto ausentes.');
        }

        return ProductPaginate.fromJson(productData);
      } else {
        throw Exception('Erro de servidor: HTTP ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Falha na conexão de rede: ${e.message}');
    } catch (e) {
      throw Exception('Erro ao carregar produtos: $e');
    }
  }
}
