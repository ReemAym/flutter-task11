import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_text_form_field.dart';

class CustomPasswordField extends StatefulWidget {
  const CustomPasswordField({
    super.key,
    this.onSaved,
  });

  final void Function(String?)? onSaved;

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool obsecure = true;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      isPassword: obsecure,
      hint: 'كلمة المرور',
      textInputType: TextInputType.visiblePassword,
      suffixIcon: GestureDetector(
        onTap: () {
          setState(() {
            obsecure = !obsecure;
          });
        },
        child: obsecure
            ? const Icon(
                Icons.remove_red_eye,
                color: Color(0xffC9CECF),
              )
            : Icon(
                Icons.visibility_off,
                color: Color(0xffC9CECF),
              ),
      ),
      onSaved: widget.onSaved,
    );
  }
}
