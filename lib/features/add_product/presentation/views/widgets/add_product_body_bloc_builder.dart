import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/core/widgets/custom_progress_hud.dart';
import 'package:fruit_hub_dashboard/features/add_product/presentation/manager/add_product_cubit/add_product_cubit.dart';
import '../../../../../core/helper_functions/build_bar.dart';
import 'add_product_view_body.dart';

class AddProductBodyBlocBuilder extends StatelessWidget {
  const AddProductBodyBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductCubit, AddProductState>(
      builder: (context, state) {
        return CustomProgressHud(
            isLoading: state is AddProductLoading,
            child: const AddProductViewBody());
      },
      listener: (context, state) {
        if (state is AddProductSuccess) {
          buildBar(context, 'Product Added Successfully');
        }
        if (state is AddProductFailure) {
          buildBar(context, state.message);
        }
      },
    );
  }
}
