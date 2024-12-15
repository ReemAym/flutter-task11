import 'package:e_commerce_app/constant.dart';
import 'package:e_commerce_app/core/services/firebase_auth_service.dart';
import 'package:e_commerce_app/core/services/shared_preferences_singleton.dart';
import 'package:e_commerce_app/core/utils/app_images.dart';
import 'package:e_commerce_app/features/auth/presentation/views/login_view.dart';
import 'package:e_commerce_app/features/home/presentation/views/main_view.dart';
import 'package:e_commerce_app/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    executeNavigation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SvgPicture.asset(Assets.splash_plant),
          ],
        ),
        SvgPicture.asset(Assets.splash_logo),
        SvgPicture.asset(
          Assets.splash_bottom,
          fit: BoxFit.fill,
        ),
      ],
    );
  }

  void executeNavigation() {
    bool IsBoardingViewSeen =
        SharedPreferencesSingleton.getBool(isOnBoardingViewSeen);
    Future.delayed(const Duration(seconds: 3), () {
      if (IsBoardingViewSeen) {
        var isLogged = FirebaseAuthService().isLoggedIn();
        if (isLogged) {
          Navigator.pushReplacementNamed(context, LoginView.route);
        } else {
          Navigator.pushReplacementNamed(context, LoginView.route);
        }
      } else {
        Navigator.pushReplacementNamed(context, OnBoardingView.route);
      }
    });
  }
}
