import 'package:e_commerce_app/core/services/get_it_service.dart';
import 'package:e_commerce_app/core/widgets/custom_appBar.dart';
import 'package:e_commerce_app/features/auth/presentation/cubits/signup_cubit/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repo/auth_repo.dart';
import 'widgets/Signup_view_bloc_consumer.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  static const String route = 'SignupView';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(
        getIt<AuthRepo>(),
      ),
      child: Scaffold(
        appBar: buildAppBar(context, 'حساب جديد'),
        body: SignupViewBlocConsumer(),
      ),
    );
  }
}
