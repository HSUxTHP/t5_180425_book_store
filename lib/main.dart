import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:t4_110425_shoes_store/providers/cart_provider.dart';
import 'package:t4_110425_shoes_store/pages/reponsive_layout.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CartProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout();
  }
}
