// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:privilegecare/Utils/colors.dart';
import 'package:privilegecare/Utils/constant.dart';

class CustomInputField extends StatelessWidget {
  CustomInputField(
      {Key? key,
        required this.labelText,
        this.icon,
        this.onchange,
        this.controller,
        this.keyboardType,
        this.validator,
        this.isAutoValidate = true,
        this.onFieldSubmitted,
        this.onSaved,
        this.validated,
        this.obsecure = false,
        this.focusNode,
        this.textInputAction,
        required this.hasGreenBorder,
        required this.hasIntialValue,
        this.suffixText = " ",
        this.textAligning = TextAlign.right})
      : super(key: key);
  final String labelText;
  final icon;
  var  validated;
  final onchange;
  final TextEditingController? controller;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final void Function(String)? onFieldSubmitted;
  final bool isAutoValidate;
  final TextInputType? keyboardType;
  final bool obsecure;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final bool hasGreenBorder;
  final bool hasIntialValue;
  final String? suffixText;
  final TextAlign textAligning;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return hasIntialValue?TextFormField(
      textAlign: textAligning,
      enableSuggestions: false,
      autocorrect: false,
      style:  TextStyle(
          fontSize: 15.0,
          fontFamily: fontFamilyName,
          color: hasGreenBorder?kGreenColor:kBlueColor,
      ),
      focusNode: focusNode,
      keyboardType: keyboardType,
      cursorColor: hasGreenBorder?kGreenColor:kBlueColor,
      obscureText: obsecure,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(right: 10),
        helperText: "",
        fillColor: kLightGrayColor,
        filled: false,

        hintText: labelText,
        hintStyle:  const TextStyle(
          fontSize: 15.0,
          fontFamily: fontFamilyName,
          color: kGrayColor,
        ),
        suffixIcon: icon,
        suffixText: suffixText,
        suffixStyle: const TextStyle(
        fontSize: 15.0,
        fontFamily: fontFamilyName,
        color: kGrayColor,
      ),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(4)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(4)),
        enabledBorder:  OutlineInputBorder(
          borderSide: BorderSide(width: 3, color: hasGreenBorder?kGreenColor:kBlueColor,),
        ),
        focusedBorder: OutlineInputBorder(
            borderSide:   BorderSide(color: hasGreenBorder?kGreenColor:kBlueColor,width: 3.0),
            borderRadius: BorderRadius.circular(4)),
      ),
      onChanged: onchange,
      controller: controller,
      validator: validator,
      textInputAction: textInputAction,

      autovalidateMode: isAutoValidate
          ? AutovalidateMode.onUserInteraction
          : AutovalidateMode.disabled,
      onSaved: onSaved,
      onFieldSubmitted: onFieldSubmitted,
    ):TextFormField(

      enableSuggestions: false,
      autocorrect: false,

      style:  TextStyle(
        fontSize: 15.0,
        fontFamily: fontFamilyName,
        color: hasGreenBorder?kGreenColor:kBlueColor,
      ),
      focusNode: focusNode,
      keyboardType: keyboardType,
      cursorColor: hasGreenBorder?kGreenColor:kBlueColor,
      obscureText: obsecure,
      decoration: InputDecoration(
        labelText: labelText,
        contentPadding: const EdgeInsets.only(right: 10),
        helperText: "",
        fillColor: kLightGrayColor,
        filled: false,

        labelStyle: theme.textTheme.bodySmall!.apply(color: theme.hintColor),
        suffixIcon: icon,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(4)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(4)),
        enabledBorder:  OutlineInputBorder(
          borderSide: BorderSide(width: 3, color: hasGreenBorder?kGreenColor:kBlueColor,),
        ),
        focusedBorder: OutlineInputBorder(
            borderSide:   BorderSide(color: hasGreenBorder?kGreenColor:kBlueColor,width: 3.0),
            borderRadius: BorderRadius.circular(4)),
      ),
      onChanged: onchange,
      controller: controller,
      validator: validator,
      textInputAction: textInputAction,

      autovalidateMode: isAutoValidate
          ? AutovalidateMode.onUserInteraction
          : AutovalidateMode.disabled,
      onSaved: onSaved,
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}
