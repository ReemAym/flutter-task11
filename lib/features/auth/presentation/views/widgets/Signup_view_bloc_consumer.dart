import 'package:e_commerce_app/features/auth/presentation/views/widgets/signup_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../core/helper_functions/build_error_bar.dart';
import '../../cubits/signup_cubit/signup_cubit.dart';

class SignupViewBlocConsumer extends StatelessWidget {
  const SignupViewBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(listener: (context, state) {
      if (state is SignupSuccess) {
        Navigator.of(context).pop();
      } else if (state is SignupFailure) {
        buildErrorBar(context, state.errorMsg);
      }
    }, builder: (context, state) {
      return ModalProgressHUD(
        inAsyncCall: state is SignupLoading ? true : false,
        child: SignupViewBody(),
      );
    });
  }
}
