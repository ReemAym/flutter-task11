import 'package:e_commerce_app/constant.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/best_seller_grid.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/best_seller_title.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/featured_item.dart';
import 'package:e_commerce_app/core/widgets/search_text_field.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/Custom_home_app_bar.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/featured_list.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/fruit_item.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

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
        BestSellerGrid(),
      ],
    );
  }
}
