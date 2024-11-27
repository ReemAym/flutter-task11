import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_images.dart';
import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:e_commerce_app/core/widgets/add_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        color: const Color(0xFFF3F5F7),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite_border_outlined,
              ),
            ),
          ),
          Positioned.fill(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Image.asset(
                  Assets.watermelon_test,
                ),
                SizedBox(
                  height: 24,
                ),
                ListTile(
                  title: Text('بطيخ', style: TextStyles.semiBold13),
                  subtitle: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                            text: '20 جنيه',
                            style: TextStyles.bold13.copyWith(
                              color: AppColor.secondaryColor,
                            )),
                        TextSpan(
                            text: ' / ',
                            style: TextStyles.bold13.copyWith(
                              color: AppColor.secondaryColor,
                            )),
                        TextSpan(
                            text: 'الكيلو',
                            style: TextStyles.semiBold13.copyWith(
                              color: AppColor.secondaryColor,
                            )),
                      ],
                    ),
                  ),
                  trailing: AddButton(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
