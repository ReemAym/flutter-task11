import 'package:e_commerce_app/core/cubits/products_cubit/products_cubit.dart';
import 'package:e_commerce_app/core/repos/product_repo/product_repo.dart';
import 'package:e_commerce_app/core/services/get_it_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            ProductsCubit(productRepo: getIt.get<ProductRepo>()),
        child: HomeViewBody());
  }
}
