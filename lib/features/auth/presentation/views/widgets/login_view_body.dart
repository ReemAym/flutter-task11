import 'dart:io';

import 'package:e_commerce_app/constant.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_images.dart';
import 'package:e_commerce_app/core/widgets/custom_button.dart';
import 'package:e_commerce_app/core/widgets/custom_text_form_field.dart';
import 'package:e_commerce_app/features/auth/presentation/cubits/signin_cubit/signin_cubit.dart';
import 'package:e_commerce_app/features/auth/presentation/views/widgets/custom_password_field.dart';
import 'package:e_commerce_app/features/auth/presentation/views/widgets/donot_have_acc.dart';
import 'package:e_commerce_app/features/auth/presentation/views/widgets/social_login.dart';
import 'package:e_commerce_app/features/auth/presentation/views/widgets/or_divider.dart';
import 'package:e_commerce_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_text_styles.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  late String email, password;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: KHorizontalPadding,
      ),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 24,
              ),
              CustomTextFormField(
                onSaved: (value) {
                  email = value!;
                },
                hint: 'البريد الالكتروني',
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomPasswordField(
                onSaved: (value) {
                  password = value!;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                'هل نسيت كلمة المرور؟',
                textAlign: TextAlign.end,
                style: TextStyles.bold13.copyWith(
                  color: AppColor.lightPrimaryColor,
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              CustomButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    context.read<SigninCubit>().signInWithEmailAndPassword(
                        email: email, password: password);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
                title: 'تسجيل دخول',
              ),
              const SizedBox(
                height: 32,
              ),
              const DonotHaveAcc(),
              const SizedBox(
                height: 32,
              ),
              const OrDivider(
                text: 'أو',
              ),
              const SizedBox(
                height: 16,
              ),
              SocialLogin(
                label: 'تسجيل بواسطة جوجل',
                onPressed: () {
                  context.read<SigninCubit>().signInWithGoogle();
                },
                icon: Assets.google_icon,
              ),
              Platform.isIOS
                  ? Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: KHorizontalPadding,
                      ),
                      child: SocialLogin(
                        label: 'تسجيل بواسطة أبل',
                        onPressed: () {
                          context.read<SigninCubit>().signInWithApple();
                        },
                        icon: Assets.apple_icon,
                      ),
                    )
                  : const SizedBox(
                      height: 16,
                    ),
              SocialLogin(
                label: 'تسجيل بواسطة فيسبوك',
                onPressed: () {
                  context.read<SigninCubit>().signInWithFacebook();
                },
                icon: Assets.facebook_icon,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
