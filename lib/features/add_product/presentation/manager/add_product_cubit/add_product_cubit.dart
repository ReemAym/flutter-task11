import 'package:bloc/bloc.dart';
import 'package:fruit_hub_dashboard/core/repos/image_repo/image_repo.dart';
import 'package:fruit_hub_dashboard/core/repos/product_repo/product_repo.dart';
import 'package:fruit_hub_dashboard/features/add_product/domain/entities/product_entity.dart';
import 'package:meta/meta.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit({required this.imageRepo, required this.productRepo})
      : super(AddProductInitial());
  final ImageRepo imageRepo;
  final ProductRepo productRepo;

  Future<void> addProduct(ProductEntity input) async {
    emit(AddProductLoading());
    var response = await imageRepo.uploadImage(input.image);

    response.fold((failure) {
      emit(
        AddProductFailure(message: failure.message),
      );
    }, (url) async {
      input.imageUrl = url;
      var productResponse = await productRepo.addProduct(input);
      productResponse.fold((failure) {
        emit(
          AddProductFailure(message: failure.toString()),
        );
      }, (right) {
        emit(AddProductSuccess());
      });
    });
  }
}
