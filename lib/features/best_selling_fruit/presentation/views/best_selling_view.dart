import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:e_commerce_app/core/widgets/notification_widget.dart';
import 'package:e_commerce_app/features/best_selling_fruit/presentation/views/widgets/best_selling_view_body.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/build_custom_appbar.dart';

class BestSellingView extends StatelessWidget {
  const BestSellingView({super.key});

  static const String route = 'best_selling_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppbar(title: 'الأكثر مبيعًا'),
      body: BestSellingViewBody(),
    );
  }
}
