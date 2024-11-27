import 'package:e_commerce_app/core/widgets/active_icon.dart';
import 'package:e_commerce_app/core/widgets/inactive_icon.dart';
import 'package:e_commerce_app/features/home/domain/entities/bottom_navigation_bar_entity.dart';
import 'package:flutter/material.dart';

import '../utils/app_images.dart';

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem(
      {super.key,
      required this.isSelected,
      required this.bottomNavigationBarEntity});

  final bool isSelected;
  final BottomNavigationBarEntity bottomNavigationBarEntity;
  @override
  Widget build(BuildContext context) {
    return isSelected
        ? ActiveIcon(
            icon: bottomNavigationBarEntity.activeImage,
            name: bottomNavigationBarEntity.name,
          )
        : InactiveIcon(
            icon: bottomNavigationBarEntity.inActiveImage,
          );
  }
}
