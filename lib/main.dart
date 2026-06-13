import 'package:flutter/material.dart';
import 'package:mobile/_import.dart';

void main() {
  runApp(const NegoreservaApp());
}
class NegoreservaApp extends StatelessWidget {
  const NegoreservaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
    );
  }
}
