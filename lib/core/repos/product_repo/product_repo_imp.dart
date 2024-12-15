import 'package:dartz/dartz.dart';

import 'package:e_commerce_app/core/entities/product_entity.dart';

import 'package:e_commerce_app/core/error/failure.dart';
import 'package:e_commerce_app/core/models/product_model.dart';
import 'package:e_commerce_app/core/services/database_service.dart';
import 'package:e_commerce_app/core/utils/backend_endpoint.dart';

import 'product_repo.dart';

class ProductRepoImp extends ProductRepo {
  final DatabaseService databaseService;

  ProductRepoImp({required this.databaseService});

  @override
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProduct() async {
    try {
      var data = await databaseService
          .getData(path: BackendEndPoint.getProducts, query: {
        'limit': 10,
        'orderBy': 'sellingCount',
        'descending': true,
      }) as List<Map<String, dynamic>>;
      List<ProductModel> products =
          data.map((e) => ProductModel.fromJson(e)).toList();
      List<ProductEntity> productEntities =
          products.map((e) => e.toEntity()).toList();
      return right(productEntities);
    } on Exception catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProduct() async {
    try {
      var data = await databaseService.getData(
          path: BackendEndPoint.getProducts) as List<Map<String, dynamic>>;
      List<ProductModel> products =
          data.map((e) => ProductModel.fromJson(e)).toList();
      List<ProductEntity> productEntities =
          products.map((e) => e.toEntity()).toList();
      return right(productEntities);
    } on Exception catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }
}
