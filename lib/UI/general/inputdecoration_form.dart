import 'package:batman_spash_screen/UI/general/general.dart';
import 'package:flutter/material.dart';

InputDecoration decorationinputtext(String hintText, String? labeltext) {
  return InputDecoration(
    enabledBorder: outlineInputBorder(),
    focusedBorder: outlineInputBorder(),
    errorBorder: outlineInputBorder(),
    border: outlineInputBorder(),
    disabledBorder: outlineInputBorder(),
    focusedErrorBorder: outlineInputBorder(),
    hintText: hintText,
    labelText: labeltext,
    labelStyle:  TextStyle(
      fontSize: 12,
      color: Colors.black.withOpacity(.6)
    ),
    hintStyle: TextStyle(
      fontSize: 12,
      color: kfontPrimaryColor.withOpacity(.5),
    ),
  );
}

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide:
        BorderSide(color: kfontSecondaryColor.withOpacity(.5), width: .5),
  );
}
