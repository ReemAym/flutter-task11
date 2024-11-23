import 'package:e_commerce_app/constant.dart';
import 'package:e_commerce_app/core/services/shared_preferences_singleton.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_images.dart';
import 'package:e_commerce_app/features/auth/presentation/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/app_text_styles.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem(
      {super.key,
      required this.image,
      required this.backgroundImage,
      required this.subTitle,
      required this.title,
      required this.isVibile});

  final String image, backgroundImage, subTitle;
  final Widget title;
  final bool isVibile;
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.5,
        child: Stack(children: [
          Positioned.fill(
            child: SvgPicture.asset(
              backgroundImage,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SvgPicture.asset(
              image,
            ),
          ),
          Visibility(
            visible: isVibile,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: GestureDetector(
                onTap: () {
                  SharedPreferencesSingleton.setBool(
                      isOnBoardingViewSeen, true);
                  Navigator.pushReplacementNamed(context, LoginView.route);
                },
                child: Text(
                  'تخطي',
                  style: TextStyles.regular13.copyWith(
                    color: Color(0xFF949D9E),
                  ),
                ),
              ),
            ),
          )
        ]),
      ),
      SizedBox(
        height: 60,
      ),
      title,
      SizedBox(
        height: 24,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 37),
        child: Text(
          subTitle,
          style: TextStyles.semiBold13.copyWith(
            color: AppColor.subTitleColor,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    ]);
  }
}
