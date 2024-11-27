import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class AddButton extends StatelessWidget {
  const AddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: AppColor.primaryColor,
      child: Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }
}
