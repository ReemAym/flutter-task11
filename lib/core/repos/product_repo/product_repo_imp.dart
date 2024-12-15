import 'package:dartz/dartz.dart';
import 'package:fruit_hub_dashboard/core/repos/product_repo/product_repo.dart';
import 'package:fruit_hub_dashboard/core/services/database_service.dart';
import 'package:fruit_hub_dashboard/core/utils/backend_end_point.dart';
import 'package:fruit_hub_dashboard/features/add_product/data/models/product_model.dart';
import 'package:fruit_hub_dashboard/features/add_product/domain/entities/product_entity.dart';
import 'package:uuid/uuid.dart';

import '../../errors/failure.dart';

class ProductRepoImp extends ProductRepo {
  final DatabaseService databaseService;

  ProductRepoImp({required this.databaseService});
  @override
  Future<Either<Failure, void>> addProduct(ProductEntity product) async {
    try {
      databaseService.addData(
        path: BackendEndPoint.productsCollection,
        data: ProductModel.fromEntity(product).toJson(),
        documentid: Uuid().v4(),
      );
      return const Right(null);
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }
}
