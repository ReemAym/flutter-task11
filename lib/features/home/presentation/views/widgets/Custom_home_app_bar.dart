import 'package:e_commerce_app/core/helper_functions/get_user.dart';
import 'package:e_commerce_app/core/utils/app_images.dart';
import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/notification_widget.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: NotificationWidget(),
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
        getUser().name,
        style: TextStyles.bold16,
        textAlign: TextAlign.right,
      ),
    );
  }
}
