import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/core/widgets/custom_button.dart';
import 'package:fruit_hub_dashboard/core/widgets/custom_text_form_field.dart';
import 'package:fruit_hub_dashboard/features/add_product/domain/entities/product_entity.dart';
import 'package:fruit_hub_dashboard/features/add_product/presentation/manager/add_product_cubit/add_product_cubit.dart';
import 'package:fruit_hub_dashboard/features/add_product/presentation/views/add_product_view.dart';
import 'package:fruit_hub_dashboard/features/add_product/presentation/views/widgets/custom_checkbox.dart';
import 'package:fruit_hub_dashboard/features/add_product/presentation/views/widgets/featured_or_not.dart';
import 'package:fruit_hub_dashboard/features/add_product/presentation/views/widgets/image_field.dart';
import 'package:fruit_hub_dashboard/features/add_product/presentation/views/widgets/organic_or_not.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  late String name, code, description;
  late num price;
  late int expireMonths, numOfCalouris, unitAmount;
  bool isFeatured = false;
  bool isOrganic = false;
  File? image;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
          key: _formKey,
          autovalidateMode: autoValidateMode,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                CustomTextFormField(
                  hint: 'Product Name',
                  textInputType: TextInputType.text,
                  onSaved: (value) {
                    name = value!;
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                CustomTextFormField(
                  hint: 'Product Price',
                  textInputType: TextInputType.number,
                  onSaved: (value) {
                    price = num.parse(value!);
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                CustomTextFormField(
                  hint: 'Product Code',
                  textInputType: TextInputType.text,
                  onSaved: (value) {
                    code = value!;
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                CustomTextFormField(
                  hint: 'Product Description',
                  textInputType: TextInputType.text,
                  maxLines: 5,
                  onSaved: (value) {
                    description = value!;
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                CustomTextFormField(
                  hint: 'Expire Months',
                  textInputType: TextInputType.number,
                  onSaved: (value) {
                    expireMonths = int.parse(value!);
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                CustomTextFormField(
                  hint: 'Num Of Calouris',
                  textInputType: TextInputType.number,
                  onSaved: (value) {
                    numOfCalouris = int.parse(value!);
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                CustomTextFormField(
                  hint: 'Unit Amount For Calouris',
                  textInputType: TextInputType.number,
                  onSaved: (value) {
                    unitAmount = int.parse(value!);
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                FeaturedOrNot(onChanged: (value) {
                  isFeatured = value;
                }),
                SizedBox(
                  height: 16,
                ),
                OrganicOrNot(onChanged: (value) {
                  isOrganic = value;
                }),
                SizedBox(
                  height: 16,
                ),
                ImageField(
                  onChange: (value) {
                    image = value;
                  },
                ),
                SizedBox(
                  height: 24,
                ),
                CustomButton(
                    onPressed: () {
                      if (image != null) {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          ProductEntity inputEntity = ProductEntity(
                            code: code,
                            name: name,
                            description: description,
                            price: price,
                            image: image!,
                            numOfCalories: numOfCalouris,
                            unitAmount: unitAmount,
                            isFeatured: isFeatured,
                            expireMonths: expireMonths,
                            isOrganic: isOrganic,
                            reviews: [],
                          );

                          context
                              .read<AddProductCubit>()
                              .addProduct(inputEntity);
                        } else {
                          autoValidateMode = AutovalidateMode.always;
                        }
                      } else {
                        showError(context);
                      }
                    },
                    title: 'Add Product'),
              ],
            ),
          )),
    );
  }

  void showError(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Please select an image'),
      ),
    );
  }
}
