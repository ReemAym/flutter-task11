import 'package:dots_indicator/dots_indicator.dart';
import 'package:e_commerce_app/constant.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/widgets/custom_button.dart';
import 'package:e_commerce_app/features/on_boarding/presentation/views/widgets/on_boarding_page_view.dart';
import 'package:flutter/material.dart';

import '../../../../../core/services/shared_preferences_singleton.dart';
import '../../../../auth/presentation/views/login_view.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  late PageController pageController;
  var currentPage = 0;

  @override
  void initState() {
    pageController = PageController();

    pageController.addListener(() {
      currentPage = pageController.page!.round();
      setState(() {});
    });
    super.initState();
  }

  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: OnBoardingPageView(
            pageController: pageController,
          ),
        ),
        DotsIndicator(
          dotsCount: 2,
          decorator: DotsDecorator(
            activeColor: AppColor.primaryColor,
            color: currentPage == 1
                ? AppColor.primaryColor
                : AppColor.primaryColor.withOpacity(0.5),
            // size: Size.square(1),
          ),
        ),
        SizedBox(
          height: 25,
        ),
        Visibility(
          visible: currentPage == 1,
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: KHorizontalPadding,
            ),
            child: CustomButton(
              title: 'ابدأ الان',
              onPressed: () {
                SharedPreferencesSingleton.setBool(isOnBoardingViewSeen, true);
                Navigator.pushReplacementNamed(context, LoginView.route);
              },
            ),
          ),
        ),
        SizedBox(
          height: 40,
        )
      ],
    );
  }
}
