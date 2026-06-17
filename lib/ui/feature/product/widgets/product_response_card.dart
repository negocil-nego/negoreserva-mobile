import 'package:flutter/material.dart';
import 'package:mobile/_import.dart';

class ProductResponseCard extends StatelessWidget {
  final ProductResponse product;

  const ProductResponseCard({
    super.key,
    required this.product,
  });

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
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Product image or placeholder
            if (product.image != null && product.image!.isNotEmpty)
              Image.network(
                product.image!,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: Colors.teal.shade50,
                  child: Center(
                    child: Text(
                      product.name.isNotEmpty
                          ? product.name.substring(0, 1).toUpperCase()
                          : 'P',
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal.shade200,
                      ),
                    ),
                  ),
                ),
              )
            else
              Container(
                color: Colors.teal.shade50,
                child: Center(
                  child: Text(
                    product.name.isNotEmpty
                        ? product.name.substring(0, 1).toUpperCase()
                        : 'P',
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal.shade200,
                    ),
                  ),
                ),
              ),

            // Top gradient overlay
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: 60,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withValues(alpha: 0.85),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),

            // Bottom gradient overlay
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              height: 80,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withValues(alpha: 0.95),
                      Colors.black.withValues(alpha: 0.4),
                      Colors.transparent,
                    ],
                    stops: const [0.0, 0.5, 1.0],
                  ),
                ),
              ),
            ),

            // Top bar: Organization info & Solicitar (ProductPreview) Button
            Positioned(
              top: 8,
              left: 8,
              right: 8,
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Container(
                      width: 20,
                      height: 20,
                      color: Colors.white,
                      child: product.organization.logo != null &&
                              product.organization.logo!.isNotEmpty
                          ? Image.network(
                              product.organization.logo!,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  const Icon(Icons.business, size: 12),
                            )
                          : const Icon(Icons.business, size: 12),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.organization.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 9,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        if (product.organization.rating != null)
                          Row(
                            children: [
                              const Text(
                                '★ ',
                                style: TextStyle(
                                  color: Colors.amber,
                                  fontSize: 8,
                                ),
                              ),
                              Text(
                                '${product.organization.rating}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 8,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 4),
                  // Solicitar button
                  ProductPreview(product: product),
                ],
              ),
            ),

            // Bottom bar: Product Name & Price
            Positioned(
              bottom: 8,
              left: 8,
              right: 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.5),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      _formatAOA(product.price),
                      style: const TextStyle(
                        color: Colors.tealAccent,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
