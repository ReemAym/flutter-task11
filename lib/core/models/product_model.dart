import 'dart:io';

import 'package:e_commerce_app/core/helper_functions/get_avg_rating.dart';

import '../entities/product_entity.dart';
import 'review_model.dart';

class ProductModel {
  final String name, description, code;
  final num price;
  String? imageUrl;
  final bool? isFeatured;
  final int expireMonths;
  bool isOrganic;
  final int numOfCalories;
  final int unitAmount;
  final num sellingCount;
  final num avgRating;
  final num ratingCount = 0;
  final List<ReviewModel> reviews;

  ProductModel({
    required this.code,
    required this.name,
    required this.description,
    required this.price,
    required this.avgRating,
    this.imageUrl,
    this.isFeatured,
    this.isOrganic = false,
    required this.sellingCount,
    required this.expireMonths,
    required this.numOfCalories,
    required this.unitAmount,
    required this.reviews,
  });

  // factory ProductModel.fromEntity(ProductEntity entity) {
  //   return ProductModel(
  //     code: entity.code,
  //     name: entity.name,
  //     description: entity.description,
  //     price: entity.price,
  //     image: entity.image,
  //     imageUrl: entity.imageUrl,
  //     isFeatured: entity.isFeatured,
  //     expireMonths: entity.expireMonths,
  //     numOfCalories: entity.numOfCalories,
  //     unitAmount: entity.unitAmount,
  //     isOrganic: entity.isOrganic,
  //     reviews: entity.reviews.map((e) => ReviewModel.fromEntity(e)).toList(),
  //   );
  // }

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      avgRating: getAvgRating(json['reviews']),

      ///********** */
      code: json['code'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      imageUrl: json['imageUrl'],
      isFeatured: json['isFeatured'],
      isOrganic: json['isOrganic'],
      sellingCount: json['sellingCount'],
      expireMonths: json['expireMonths'],
      numOfCalories: json['numOfCalories'],
      unitAmount: json['unitAmount'],
      reviews: List<ReviewModel>.from(json['reviews'].map((x) => ReviewModel)),
    );
  }

  ProductEntity toEntity() {
    return ProductEntity(
      code: code,
      name: name,
      description: description,
      price: price,
      expireMonths: expireMonths,
      numOfCalories: numOfCalories,
      unitAmount: unitAmount,
      isFeatured: isFeatured,
      isOrganic: isOrganic,
      reviews: reviews.map((e) => e.toEntity()).toList(),
      imageUrl: imageUrl,
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
