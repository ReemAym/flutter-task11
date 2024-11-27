import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ActiveIcon extends StatelessWidget {
  const ActiveIcon({super.key, required this.icon, required this.name});

  final String icon, name;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.only(left: 16),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          color: Color(0xffEEEEEE),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 30,
              height: 30,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                color: AppColor.primaryColor,
              ),
              child: Center(
                child: SvgPicture.asset(icon),
              ),
            ),
            SizedBox(
              width: 4,
            ),
            Text(
              name,
              style: TextStyles.semiBold11.copyWith(
                color: AppColor.primaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
