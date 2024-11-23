import 'dart:developer';

import 'package:e_commerce_app/constant.dart';
import 'package:e_commerce_app/core/helper_functions/build_error_bar.dart';
import 'package:e_commerce_app/core/widgets/custom_appBar.dart';
import 'package:e_commerce_app/core/widgets/custom_button.dart';
import 'package:e_commerce_app/core/widgets/custom_text_form_field.dart';
import 'package:e_commerce_app/features/auth/presentation/cubits/signup_cubit/signup_cubit.dart';
import 'package:e_commerce_app/features/auth/presentation/views/signup_view.dart';
import 'package:e_commerce_app/features/auth/presentation/views/widgets/have_account.dart';
import 'package:e_commerce_app/features/auth/presentation/views/widgets/terms_conditions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_password_field.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

final GlobalKey<FormState> formKey = GlobalKey<FormState>();
AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

late String email, name, password;
late bool isTermsAccepted = false;

class _SignupViewBodyState extends State<SignupViewBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: KHorizontalPadding),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          autovalidateMode: autoValidateMode,
          child: Column(
            children: [
              const SizedBox(
                height: 24,
              ),
              CustomTextFormField(
                hint: 'الاسم كامل',
                textInputType: TextInputType.text,
                onSaved: (value) {
                  name = value!;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                hint: 'البريد الالكتروني',
                textInputType: TextInputType.emailAddress,
                onSaved: (value) {
                  email = value!;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              CustomPasswordField(onSaved: (value) {
                password = value!;
              }),
              const SizedBox(
                height: 16,
              ),
              TermsConditions(
                onChanged: (value) {
                  isTermsAccepted = value;
                },
              ),
              const SizedBox(height: 30),
              CustomButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      if (isTermsAccepted) {
                        formKey.currentState!.save();
                        context
                            .read<SignupCubit>()
                            .createUserWithEmailAndPassword(
                                email, password, name);
                      } else {
                        buildErrorBar(context,
                            'يجب الموافقة علي الشروط و الاحكام الخاصة بنا');
                      }
                    } else {
                      setState(() {
                        autoValidateMode = AutovalidateMode.always;
                      });
                    }
                  },
                  title: "إنشاء حساب جديد"),
              SizedBox(
                height: 26,
              ),
              HaveAccount(),
            ],
          ),
        ),
      ),
    );
  }
}
