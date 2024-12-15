import 'dart:io';

import 'package:fruit_hub_dashboard/features/add_product/domain/entities/review_entity.dart';

class ProductEntity {
  final String name, description, code;
  final num price;
  final File image;
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
    required this.image,
    this.imageUrl,
    this.isFeatured,
    this.isOrganic = false,
    required this.expireMonths,
    required this.numOfCalories,
    required this.unitAmount,
    required this.reviews,
  });
}
