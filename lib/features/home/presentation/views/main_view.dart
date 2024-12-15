import 'package:e_commerce_app/features/home/presentation/views/widgets/custom_bottom_navigationbar.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/home_view.dart';
import 'package:flutter/material.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  static const route = 'homeView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: HomeView(),
      ),
      bottomNavigationBar: CustomBottomNavigationbar(),
    );
  }
}
