import 'package:flutter/material.dart';
import 'package:stylish/features/dashboard/modules/cart/view/components/cart_widget.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: CartWidget(),
    );
  }
}
