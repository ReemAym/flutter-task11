import 'package:e_commerce_app/features/auth/presentation/views/signup_view.dart';
import 'package:flutter/widgets.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class DonotHaveAcc extends StatelessWidget {
  const DonotHaveAcc({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'لا تمتلك حساب؟',
          style: TextStyles.semiBold16.copyWith(
            color: Color(0xff949D9E),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, SignupView.route);
          },
          child: Text(
            'قم بإنشاء حساب ',
            style: TextStyles.semiBold16.copyWith(
              color: AppColor.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
