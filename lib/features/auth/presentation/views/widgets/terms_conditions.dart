import 'package:e_commerce_app/constant.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:e_commerce_app/features/auth/presentation/views/widgets/custom_checkbox.dart';
import 'package:flutter/material.dart';

class TermsConditions extends StatefulWidget {
  const TermsConditions({super.key, required this.onChanged});

  @override
  State<TermsConditions> createState() => _TermsConditionsState();
  final ValueChanged<bool> onChanged;
}

class _TermsConditionsState extends State<TermsConditions> {
  bool isAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckBox(
          isChecked: isAccepted,
          onChecked: (value) {
            isAccepted = value;
            widget.onChanged(value);
            setState(() {});
          },
        ),
        SizedBox(
          width: 16,
        ),
        Expanded(
          child: Wrap(
            children: [
              Text(
                ' من خلال إنشاء حساب ، فإنك توافق على',
                style: TextStyles.semiBold13.copyWith(
                  color: AppColor.subTitleColor,
                ),
              ),
              Text(
                ' الشروط والأحكام الخاصة بنا',
                style: TextStyles.semiBold13.copyWith(
                  color: AppColor.lightPrimaryColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
