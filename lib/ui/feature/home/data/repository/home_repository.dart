import '../models/_import.dart';

abstract class HomeRepository {
  Future<OrganizationPaginate> searchOrganizationFilter({
    required Map<String, dynamic> filter,
    required PaginateRequest request,
  });

  Future<ProductPaginate> searchProductFilter({
    required Map<String, dynamic> filter,
    required PaginateRequest request,
  });
}
