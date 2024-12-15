import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/entities/product_entity.dart';
import 'package:e_commerce_app/core/repos/product_repo/product_repo.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit({required this.productRepo}) : super(ProductsInitial());

  final ProductRepo productRepo;

  Future<void> getProducts() async {
    emit(ProductsLoading());
    final result = await productRepo.getProduct();
    result.fold((failure) => emit(ProductsFailure(errorMsg: failure.message)),
        (products) {
      emit(ProductsSuccess(products: products));
    });
  }

  Future<void> getBestSellingProducts() async {
    emit(ProductsLoading());
    final result = await productRepo.getBestSellingProduct();
    result.fold((failure) => emit(ProductsFailure(errorMsg: failure.message)),
        (products) {
      emit(ProductsSuccess(products: products));
    });
  }
}
