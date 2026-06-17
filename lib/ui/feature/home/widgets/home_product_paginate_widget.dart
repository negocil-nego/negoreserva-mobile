import 'package:flutter/material.dart';
import 'package:mobile/_import.dart';

class HomeProductPaginateWidget extends StatefulWidget {
  const HomeProductPaginateWidget({super.key});

  @override
  State<HomeProductPaginateWidget> createState() =>
      _HomeProductPaginateWidgetState();
}

class _HomeProductPaginateWidgetState extends State<HomeProductPaginateWidget> {
  late final HomeProductPaginateViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = HomeProductPaginateViewModel();
    _viewModel.fetchProducts();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _viewModel,
      builder: (context, _) {
        if (_viewModel.isLoading) {
          return const AppLoader(height: 300);
        }

        if (_viewModel.errorMessage != null) {
          return AppErrorState(
            message: _viewModel.errorMessage!,
            onRetry: _viewModel.fetchProducts,
            height: 300,
          );
        }

        final items = _viewModel.products;
        if (items.isEmpty) {
          return const AppEmptyState(
            message: 'Nenhum produto encontrado.',
            height: 300,
          );
        }

        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Encontra os melhores produtos e serviços',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: AppColors.text,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Pesquisa os produtos que procura seja para melhor hospedagem, ou melhores comidas para experimentar.',
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 16),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: items.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemBuilder: (context, index) {
                  final product = items[index];
                  return ProductResponseCard(product: product);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
