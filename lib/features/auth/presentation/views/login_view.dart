import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:e_commerce_app/features/auth/domain/repo/auth_repo.dart';
import 'package:e_commerce_app/features/auth/presentation/cubits/signin_cubit/signin_cubit.dart';
import 'package:e_commerce_app/features/auth/presentation/views/widgets/login_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/get_it_service.dart';
import '../../../../core/widgets/custom_appBar.dart';
import 'widgets/singin_view_bloc_consumer.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  static const route = 'Login';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SigninCubit(getIt.get<AuthRepo>()),
      child: Scaffold(
        appBar: buildAppBar(context, 'تسجيل دخول'),
        body: SigninViewBlocConsumer(),
      ),
    );
  }
}
