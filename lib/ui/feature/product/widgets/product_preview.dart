import 'package:flutter/material.dart';
import 'package:mobile/_import.dart';

class ProductPreview extends StatelessWidget {
  final ProductResponse product;

  const ProductPreview({
    super.key,
    required this.product,
  });

  void _showPreviewSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.background,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.fromLTRB(
            16,
            16,
            16,
            MediaQuery.of(context).viewInsets.bottom + 24,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Drag Handle
              Center(
                child: Container(
                  width: 36,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),

              // Product Preview detail
              ProductPreviewDetail(product: product),
              const SizedBox(height: 24),

              // Base Price tag and Confirm button row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Preço Base',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textSecondary,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        _formatAOA(product.price),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                          color: Color(0xFF10B981),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ProductPaymentDrawer(product: product),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  String _formatAOA(double value) {
    final String basic = value.toStringAsFixed(2);
    final parts = basic.split('.');
    final cleanValue = parts[0];
    final cents = parts[1];

    final regExp = RegExp(r'\B(?=(\d{3})+(?!\d))');
    final formattedInteger = cleanValue.replaceAll(regExp, '.');

    return '$formattedInteger,$cents AOA';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showPreviewSheet(context),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text(
              'Solicitar',
              style: TextStyle(
                color: Colors.white,
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 2),
            Icon(
              Icons.arrow_forward,
              color: Colors.white,
              size: 12,
            ),
          ],
        ),
      ),
    );
  }
}
