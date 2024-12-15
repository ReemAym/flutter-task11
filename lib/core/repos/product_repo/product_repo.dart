import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/entities/product_entity.dart';
import 'package:e_commerce_app/core/error/failure.dart';

abstract class ProductRepo {
  Future<Either<Failure, List<ProductEntity>>> getProduct();
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProduct();
}
