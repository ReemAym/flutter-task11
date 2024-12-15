import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/core/repos/image_repo/image_repo.dart';
import 'package:fruit_hub_dashboard/core/repos/product_repo/product_repo.dart';
import 'package:fruit_hub_dashboard/core/services/get_it_service.dart';
import 'package:fruit_hub_dashboard/features/add_product/presentation/manager/add_product_cubit/add_product_cubit.dart';
import 'package:fruit_hub_dashboard/features/add_product/presentation/views/widgets/add_product_view_body.dart';

import 'widgets/add_product_body_bloc_builder.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});

  static const String route = 'AddProduct';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Product'),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => AddProductCubit(
          imageRepo: getIt.get<ImageRepo>(),
          productRepo: getIt.get<ProductRepo>(),
        ),
        child: AddProductBodyBlocBuilder(),
      ),
    );
  }
}
