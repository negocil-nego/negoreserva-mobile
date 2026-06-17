import 'package:flutter/material.dart';
import 'package:mobile/_import.dart';

class ProductPreviewDetail extends StatelessWidget {
  final ProductResponse product;

  const ProductPreviewDetail({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Product image
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            height: 200,
            color: Colors.grey.shade100,
            child: product.image != null && product.image!.isNotEmpty
                ? Image.network(
                    product.image!,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => const Icon(
                      Icons.image_not_supported_outlined,
                      size: 48,
                      color: Colors.grey,
                    ),
                  )
                : const Icon(
                    Icons.image_not_supported_outlined,
                    size: 48,
                    color: Colors.grey,
                  ),
          ),
        ),
        const SizedBox(height: 16),

        // Product Name
        Text(
          product.name,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.text,
          ),
        ),
        const SizedBox(height: 8),

        // Organization Row
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Container(
                width: 24,
                height: 24,
                color: Colors.grey.shade200,
                child: product.organization.logo != null &&
                        product.organization.logo!.isNotEmpty
                    ? Image.network(
                        product.organization.logo!,
                        fit: BoxFit.cover,
                      )
                    : const Icon(Icons.business, size: 12),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                product.organization.name,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textSecondary,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),

        // Product Description
        const Text(
          'Descrição',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: AppColors.text,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          product.description.isNotEmpty
              ? product.description
              : 'Sem descrição disponível.',
          style: const TextStyle(
            fontSize: 13,
            color: AppColors.textSecondary,
            height: 1.4,
          ),
        ),
      ],
    );
  }
}
