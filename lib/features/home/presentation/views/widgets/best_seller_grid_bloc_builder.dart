import 'package:e_commerce_app/core/cubits/products_cubit/products_cubit.dart';
import 'package:e_commerce_app/core/helper_functions/get_dummy_products.dart';
import 'package:e_commerce_app/core/widgets/custom_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'best_seller_grid.dart';

class BestSellerGridBlocBuilder extends StatelessWidget {
  const BestSellerGridBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsSuccess) {
          return BestSellerGrid(
            products: state.products,
          );
        } else if (state is ProductsFailure) {
          return SliverToBoxAdapter(
              child: CustomErrorWidget(text: state.errorMsg));
        } else {
          return Skeletonizer.sliver(
              enabled: true,
              child: BestSellerGrid(
                products: getDummyProducts(),
              ));
        }
      },
    );
  }
}
