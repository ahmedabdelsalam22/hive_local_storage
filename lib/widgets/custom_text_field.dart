import 'package:flutter/material.dart';

import '../shared/constance.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.hint,
    this.maxLine = 1,
    this.onSave,
  }) : super(key: key);

  final String hint;
  final int maxLine;
  final Function(String?)? onSave;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppConsts.kPrimaryColor,
      maxLines: maxLine,
      onSaved: onSave,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return "Field is required";
        }
        return null;
      },
      decoration: InputDecoration(
          border: buildBorder(),
          enabledBorder: buildBorder(),
          focusedBorder: buildBorder(AppConsts.kPrimaryColor),
          hintText: hint,
          hintStyle: const TextStyle(color: AppConsts.kPrimaryColor)),
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: color ?? Colors.white,
      ),
    );
  }
}
