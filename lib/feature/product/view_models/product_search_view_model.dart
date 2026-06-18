import 'package:flutter/material.dart';
import 'package:mobile/_import.dart';

class ProductSearchViewModel extends ChangeNotifier {
  final HomeService _service = HomeService(HomeDioRepository());

  bool _isLoading = false;
  String? _errorMessage;
  ProductPaginate? _paginateData;
  String _queryText = '';

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  List<ProductResponse> get products => _paginateData?.content ?? [];
  String get queryText => _queryText;

  Future<void> search(String q) async {
    _queryText = q;
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final filter = <String, dynamic>{
        'q': q.isEmpty ? null : q,
        'priceMin': null,
        'priceMax': null,
      };
      final request = PaginateRequest(pageNumber: 0, pageSize: 20);
      _paginateData = await _service.searchProductFilter(
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
