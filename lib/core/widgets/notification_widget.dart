import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/app_images.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
