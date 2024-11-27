import 'package:e_commerce_app/core/utils/app_images.dart';
import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: Container(
        padding: EdgeInsets.all(8),
        decoration: const ShapeDecoration(
          shape: OvalBorder(),
          color: Color(
            0xffEEF8ED,
          ),
        ),
        child: SvgPicture.asset(
          Assets.notification_icon,
        ),
      ),
      leading: Image.asset(Assets.profile_image),
      title: Text(
        'صباح الخير !..',
        style: TextStyles.regular16.copyWith(
          color: Color(
            0xFF949D9E,
          ),
        ),
      ),
      subtitle: Text(
        'أحمد مصطفي',
        style: TextStyles.bold16,
        textAlign: TextAlign.right,
      ),
    );
  }
}
