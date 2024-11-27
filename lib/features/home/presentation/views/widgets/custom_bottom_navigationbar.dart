import 'package:e_commerce_app/core/widgets/inactive_icon.dart';
import 'package:e_commerce_app/core/widgets/navigation_bar_item.dart';
import 'package:e_commerce_app/features/home/domain/entities/bottom_navigation_bar_entity.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_images.dart';

class CustomBottomNavigationbar extends StatefulWidget {
  const CustomBottomNavigationbar({super.key});

  @override
  State<CustomBottomNavigationbar> createState() =>
      _CustomBottomNavigationbarState();
}

class _CustomBottomNavigationbarState extends State<CustomBottomNavigationbar> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 73,
      decoration: const ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          color: Colors.white,
          shadows: [
            BoxShadow(
              color: Color(0x19000000),
              blurRadius: 24,
              offset: Offset(0, -2),
              spreadRadius: 0,
            )
          ]),
      child: Row(
        children: bottomNavigationBarItems.asMap().entries.map((e) {
          var index = e.key;
          var entity = e.value;
          return Expanded(
            flex: index == selectedIndex ? 3 : 2,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: NavigationBarItem(
                  isSelected: selectedIndex == index,
                  bottomNavigationBarEntity: entity),
            ),
          );
        }).toList(),
      ),
    );
  }
}
