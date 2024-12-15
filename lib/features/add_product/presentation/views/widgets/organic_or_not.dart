import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/features/add_product/presentation/views/widgets/custom_checkbox.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class OrganicOrNot extends StatefulWidget {
  const OrganicOrNot({super.key, required this.onChanged});

  @override
  State<OrganicOrNot> createState() => _FeaturedOrNotState();
  final ValueChanged<bool> onChanged;
}

class _FeaturedOrNotState extends State<OrganicOrNot> {
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
                'Organic Product',
                style: TextStyles.semiBold13.copyWith(
                  color: AppColor.subTitleColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
