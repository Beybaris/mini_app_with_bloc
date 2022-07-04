import 'package:flutter/material.dart';
import 'package:innlab_bloc_test_example/core/textStyles_const.dart';

TextField textField(String text, String labelText) {
  TextEditingController controller = TextEditingController(text: text);
  return TextField(
    controller: controller,
    style: TextStyles.greyDarkRegularStyle,
    readOnly: true,
    decoration: InputDecoration(
      labelText: labelText,
      labelStyle: TextStyles.greyDarkMediumStyle.copyWith(fontSize: 20, color: Color(0xff7F78A7)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(color: Color(0xff7F78A7).withOpacity(0.16), width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(color: Color(0xff7F78A7).withOpacity(0.16), width: 1),
      ),
    )
  );
}