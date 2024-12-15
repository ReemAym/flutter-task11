import 'dart:io';

import 'package:fruit_hub_dashboard/features/add_product/data/models/review_model.dart';
import 'package:fruit_hub_dashboard/features/add_product/domain/entities/product_entity.dart';

class ProductModel {
  final String name, description, code;
  final num price;
  final File image;
  String? imageUrl;
  final bool? isFeatured;
  final int expireMonths;
  bool isOrganic;
  final int numOfCalories;
  final int unitAmount;
  final num avgRating = 0;
  final num ratingCount = 0;
  final List<ReviewModel> reviews;

  ProductModel({
    required this.code,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    this.imageUrl,
    this.isFeatured,
    this.isOrganic = false,
    required this.expireMonths,
    required this.numOfCalories,
    required this.unitAmount,
    required this.reviews,
  });

  factory ProductModel.fromEntity(ProductEntity entity) {
    return ProductModel(
      code: entity.code,
      name: entity.name,
      description: entity.description,
      price: entity.price,
      image: entity.image,
      imageUrl: entity.imageUrl,
      isFeatured: entity.isFeatured,
      expireMonths: entity.expireMonths,
      numOfCalories: entity.numOfCalories,
      unitAmount: entity.unitAmount,
      isOrganic: entity.isOrganic,
      reviews: entity.reviews.map((e) => ReviewModel.fromEntity(e)).toList(),
    );
  }

  toJson() {
    return {
      'code': code,
      'name': name,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
      'isFeatured': isFeatured,
      'expireMonths': expireMonths,
      'numOfCalories': numOfCalories,
      'unitAmount': unitAmount,
      'isOrganic': isOrganic,
      'reviews': reviews.map((e) => e.toJson()).toList(),
    };
  }
}
