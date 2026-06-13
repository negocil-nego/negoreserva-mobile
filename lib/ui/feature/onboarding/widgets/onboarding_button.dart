import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/_import.dart';

class OnboardingButton extends StatelessWidget {

  const OnboardingButton({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return MaterialButton(
      onPressed: () {
        context.go(Routes.login);
      },
      color: Colors.green,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40),
      ),
      padding: const EdgeInsets.only(
        right: 5,
        left: 30,
        top: 5,
        bottom: 5,
      ),
      child: SizedBox(
        height: 40,
        width: size.width * 0.4,
        child: Row(
          children: [
            Text(
              'Começar',
              style: TextStyle(
                fontSize: 16,
                color: Colors.green.shade50,
              ),
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.green.shade300,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Icon(
                Icons.arrow_right,
                color: Colors.green.shade100,
              ),
            ),
          ],
        ),
      ),
    );
  }
  
}