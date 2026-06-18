import 'package:flutter/material.dart';
import 'package:mobile/_import.dart';

class OrganizationSearchViewModel extends ChangeNotifier {
  final HomeService _service = HomeService(HomeDioRepository());

  bool _isLoading = false;
  String? _errorMessage;
  OrganizationPaginate? _paginateData;
  String _queryText = '';

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  List<OrganizationResponse> get organizations => _paginateData?.content ?? [];
  String get queryText => _queryText;

  Future<void> search(String q) async {
    _queryText = q;
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final filter = <String, dynamic>{
        'q': q.isEmpty ? null : q,
        'categoriesUuid': [],
        'isHighlight': null,
        'province': null,
        'municipality': null,
      };
      final request = PaginateRequest(pageNumber: 0, pageSize: 20);
      _paginateData = await _service.searchOrganizationFilter(
        filter: filter,
        request: request,
      );
    } catch (e) {
      _errorMessage = e.toString().replaceAll('Exception: ', '');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
