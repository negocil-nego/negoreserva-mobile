import 'package:flutter/material.dart';
import '../data/_import.dart';

class HomeOrganizationHighlightViewModel extends ChangeNotifier {
  final HomeService _service = HomeService(HomeDioRepository());

  bool _isLoading = false;
  String? _errorMessage;
  OrganizationPaginate? _paginateData;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  OrganizationPaginate? get paginateData => _paginateData;
  List<OrganizationResponse> get organizations => _paginateData?.content ?? [];

  Future<void> fetchHighlights() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final filter = {
        'isHighlight': true,
      };
      final request = PaginateRequest(pageNumber: 0, pageSize: 10);
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
