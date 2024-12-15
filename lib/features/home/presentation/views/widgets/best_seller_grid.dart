import 'package:e_commerce_app/core/entities/product_entity.dart';
import 'package:e_commerce_app/core/widgets/fruit_item.dart';
import 'package:flutter/material.dart';

class BestSellerGrid extends StatelessWidget {
  const BestSellerGrid({super.key, required this.products});
  final List<ProductEntity> products;
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 163 / 214,
          mainAxisSpacing: 8,
          crossAxisSpacing: 16,
        ),
        itemBuilder: (context, index) {
          return FruitItem(
            productEntity: products[index],
          );
        });
  }
}
