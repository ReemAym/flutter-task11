import 'package:fruit_hub_dashboard/features/add_product/domain/entities/review_entity.dart';

class ReviewModel {
  final String name;
  final String image;
  final String date;
  final String reviewDis;
  final num rating;

  ReviewModel({
    required this.name,
    required this.image,
    required this.date,
    required this.reviewDis,
    required this.rating,
  });

  factory ReviewModel.fromEntity(ReviewEntity entity) {
    return ReviewModel(
      name: entity.name,
      image: entity.image,
      date: entity.date,
      reviewDis: entity.reviewDis,
      rating: entity.rating,
    );
  }

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      name: json['name'],
      image: json['image'],
      date: json['date'],
      reviewDis: json['reviewDis'],
      rating: json['rating'],
    );
  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'date': date,
      'reviewDis': reviewDis,
      'rating': rating,
    };
  }
}
