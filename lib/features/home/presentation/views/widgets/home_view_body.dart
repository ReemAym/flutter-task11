import 'package:e_commerce_app/core/cubits/products_cubit/products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constant.dart';
import '../../../../../core/widgets/search_text_field.dart';
import 'Custom_home_app_bar.dart';
import 'best_seller_grid_bloc_builder.dart';
import 'best_seller_title.dart';
import 'featured_list.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    context.read<ProductsCubit>().getBestSellingProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      // physics: NeverScrollableScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              CustomHomeAppBar(),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: KHorizontalPadding,
                ),
                child: SearchTextField(),
              ),
              SizedBox(
                height: 12,
              ),
              FeaturedList(),
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: KHorizontalPadding,
                ),
                child: BestSellerTitle(),
              ),
              SizedBox(
                height: 8,
              ),
            ],
          ),
        ),
        BestSellerGridBlocBuilder(),
      ],
    );
  }
}
