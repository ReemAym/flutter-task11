import 'package:e_commerce_app/core/entities/review_entity.dart';

num getAvgRating(List<ReviewEntity> reviews) {
  num sum = 0;
  for (var i in reviews) {
    sum += i.rating;
  }

  return sum / reviews.length;
}
