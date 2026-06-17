import 'package:flutter/material.dart';
import 'package:mobile/_import.dart';

class ProductPaymentDrawer extends StatelessWidget {
  final ProductResponse product;

  const ProductPaymentDrawer({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
      label: 'Confirmar Solicitação',
      onPressed: () {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Solicitação de ${product.name} enviada!'),
            backgroundColor: AppColors.primary,
          ),
        );
      },
    );
  }
}
