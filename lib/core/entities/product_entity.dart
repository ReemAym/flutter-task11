import 'dart:io';

import 'review_entity.dart';

class ProductEntity {
  final String name, description, code;
  final num price;
  String? imageUrl;
  final bool? isFeatured;
  final int expireMonths;
  final bool isOrganic;
  final int numOfCalories;
  final int unitAmount;
  final num avgRating = 0;
  final num ratingCount = 0;
  final List<ReviewEntity> reviews;

  ProductEntity({
    required this.code,
    required this.name,
    required this.description,
    required this.price,
    this.imageUrl,
    this.isFeatured,
    this.isOrganic = false,
    required this.expireMonths,
    required this.numOfCalories,
    required this.unitAmount,
    required this.reviews,
  });
}
