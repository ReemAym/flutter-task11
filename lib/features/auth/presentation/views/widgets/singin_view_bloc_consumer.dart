import 'package:e_commerce_app/core/helper_functions/build_error_bar.dart';
import 'package:e_commerce_app/features/auth/presentation/views/widgets/custom_progress_hud.dart';
import 'package:e_commerce_app/features/home/presentation/views/main_view.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../cubits/signin_cubit/signin_cubit.dart';
import 'login_view_body.dart';

class SigninViewBlocConsumer extends StatelessWidget {
  const SigninViewBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigninCubit, SigninState>(
      listener: (context, state) {
        if (state is SigninSuccess) {
          Navigator.pushNamed(context, MainView.route);
        }
        if (state is SigninFailure) {
          buildErrorBar(context, state.errorMsg);
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
          isLoading: state is SigninLoading,
          child: const LoginViewBody(),
        );
      },
    );
  }
}
