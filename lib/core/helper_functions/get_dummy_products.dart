import 'dart:io';

import 'package:e_commerce_app/core/entities/product_entity.dart';

ProductEntity getDummyProduct() {
  return ProductEntity(
    name: "Product 1",
    price: 10.99,
    description: "This is a product",
    code: '123',
    expireMonths: 5,
    numOfCalories: 100,
    unitAmount: 1,
    reviews: [],
    isOrganic: true,
    isFeatured: false,
    imageUrl: '',
  );
}

List<ProductEntity> getDummyProducts() {
  return [
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
  ];
}
