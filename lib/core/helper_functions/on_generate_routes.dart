import 'package:e_commerce_app/features/home/presentation/views/home_view.dart';
import 'package:e_commerce_app/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';

import '../../features/auth/presentation/views/login_view.dart';
import '../../features/auth/presentation/views/signup_view.dart';
import '../../features/on_boarding/presentation/views/on_boarding_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.route:
      return MaterialPageRoute(builder: (context) => const SplashView());

    case OnBoardingView.route:
      return MaterialPageRoute(builder: (context) => const OnBoardingView());

    case LoginView.route:
      return MaterialPageRoute(builder: (context) => const LoginView());

    case SignupView.route:
      return MaterialPageRoute(builder: (context) => const SignupView());

    case HomeView.route:
      return MaterialPageRoute(builder: (context) => const HomeView());

    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
