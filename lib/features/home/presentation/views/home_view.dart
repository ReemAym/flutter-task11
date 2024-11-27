import 'package:e_commerce_app/features/home/presentation/views/widgets/custom_bottom_navigationbar.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const route = 'homeView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: HomeViewBody(),
      ),
      bottomNavigationBar: CustomBottomNavigationbar(),
    );
  }
}
