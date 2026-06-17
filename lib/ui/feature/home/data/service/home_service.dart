import '../models/_import.dart';
import '../repository/_import.dart';

class HomeService {
  final HomeRepository _repository;

  HomeService(this._repository);

  Future<OrganizationPaginate> searchOrganizationFilter({
    required Map<String, dynamic> filter,
    required PaginateRequest request,
  }) {
    return _repository.searchOrganizationFilter(filter: filter, request: request);
  }

  Future<ProductPaginate> searchProductFilter({
    required Map<String, dynamic> filter,
    required PaginateRequest request,
  }) {
    return _repository.searchProductFilter(filter: filter, request: request);
  }
}
