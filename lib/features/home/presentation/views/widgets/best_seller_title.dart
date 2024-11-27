import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class BestSellerTitle extends StatelessWidget {
  const BestSellerTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'الأكثر مبيعًا',
          style: TextStyles.bold16,
        ),
        Text(
          'المزيد',
          style: TextStyles.regular13.copyWith(
            color: Color(0xFF949D9E),
          ),
        )
      ],
    );
  }
}
