import 'package:flutter/material.dart';
import '../data/_import.dart';

class HomeProductPaginateViewModel extends ChangeNotifier {
  final HomeService _service = HomeService(HomeDioRepository());

  bool _isLoading = false;
  String? _errorMessage;
  ProductPaginate? _paginateData;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  ProductPaginate? get paginateData => _paginateData;
  List<ProductResponse> get products => _paginateData?.content ?? [];

  Future<void> fetchProducts() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final filter = <String, dynamic>{
        'q': null,
        'priceMin': null,
        'priceMax': null,
      };
      final request = PaginateRequest(pageNumber: 0, pageSize: 12);
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
