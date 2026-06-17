import 'package:flutter/material.dart';
import 'package:mobile/_import.dart';

class HomeOrganizationHighlightWidget extends StatefulWidget {
  const HomeOrganizationHighlightWidget({super.key});

  @override
  State<HomeOrganizationHighlightWidget> createState() =>
      _HomeOrganizationHighlightWidgetState();
}

class _HomeOrganizationHighlightWidgetState
    extends State<HomeOrganizationHighlightWidget> {
  late final HomeOrganizationHighlightViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = HomeOrganizationHighlightViewModel();
    _viewModel.fetchHighlights();
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
          return const AppLoader(height: 180);
        }

        if (_viewModel.errorMessage != null) {
          return AppErrorState(
            message: _viewModel.errorMessage!,
            onRetry: _viewModel.fetchHighlights,
            height: 180,
          );
        }

        final items = _viewModel.organizations;
        if (items.isEmpty) {
          return const AppEmptyState(
            message: 'Nenhuma empresa em destaque.',
            height: 180,
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
                'Empresas em Destaque',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: AppColors.text,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'Conheça as empresas que se destacam no mercado.',
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return OrganizationHighlightCard(
                      item: item,
                      onTap: () {
                        // Action for organization details
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
