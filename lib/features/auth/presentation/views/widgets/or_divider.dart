import 'package:e_commerce_app/constant.dart';
import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key, required this.text});

  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            color: Color(0xffDCDEDE),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: KHorizontalPadding,
          ),
          child: Text(
            text,
            style: TextStyles.semiBold16,
          ),
        ),
        const Expanded(
          child: Divider(),
        ),
      ],
    );
  }
}
