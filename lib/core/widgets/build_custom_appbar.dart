import 'package:e_commerce_app/constant.dart';
import 'package:e_commerce_app/core/widgets/notification_widget.dart';
import 'package:flutter/material.dart';

import '../utils/app_text_styles.dart';

AppBar buildCustomAppbar({required String title}) {
  return AppBar(
    title: Text(
      title,
      style: TextStyles.bold19,
    ),
    centerTitle: true,
    backgroundColor: Colors.transparent,
    elevation: 0,
    actions: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: KHorizontalPadding),
        child: NotificationWidget(),
      )
    ],
  );
}
