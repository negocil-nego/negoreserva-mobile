import 'package:flutter/material.dart';
import 'package:mobile/_import.dart';

class HomeOrganizationPaginateWidget extends StatefulWidget {
  const HomeOrganizationPaginateWidget({super.key});

  @override
  State<HomeOrganizationPaginateWidget> createState() =>
      _HomeOrganizationPaginateWidgetState();
}

class _HomeOrganizationPaginateWidgetState
    extends State<HomeOrganizationPaginateWidget> {
  late final HomeOrganizationPaginateViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = HomeOrganizationPaginateViewModel();
    _viewModel.fetchOrganizations();
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
          return const AppLoader(height: 320);
        }

        if (_viewModel.errorMessage != null) {
          return AppErrorState(
            message: _viewModel.errorMessage!,
            onRetry: _viewModel.fetchOrganizations,
            height: 320,
          );
        }

        final items = _viewModel.organizations;
        if (items.isEmpty) {
          return const AppEmptyState(
            message: 'Nenhuma organização encontrada.',
            height: 320,
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
                'Descubra os melhores lugares',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: AppColors.text,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Encontre as melhores opções de hospedagem, restaurantes e pontos turísticos para explorar Angola.',
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 250,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return GetOrganizationResponseCard(
                      item: item,
                      onTap: () {
                        // Action for profile details
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
