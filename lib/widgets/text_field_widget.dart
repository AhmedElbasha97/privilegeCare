import 'package:flutter/material.dart';
import 'package:privilegecare/Utils/colors.dart';

class CustomInputField extends StatelessWidget {
  CustomInputField(
      {Key? key,
        this.labelText,
        this.icon,
        this.onchange,
        this.controller,
        this.keyboardType,
        this.validator,
        this.isAutoValidate = true,
        this.onFieldSubmitted,
        this.onSaved,
        this.validated,
        this.obsecure = false, this.focusNode, this.textInputAction, required this.hasGreenBorder})
      : super(key: key);
  final labelText;
  final icon;
  var validated;
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
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextFormField(

      enableSuggestions: false,
      autocorrect: false,
      style:  TextStyle(
          fontSize: 20.0,
          fontFamily: 'elmessiri',
          color: hasGreenBorder?kGreenColor:kBlueColor,
      ),
      focusNode: focusNode,
      keyboardType: keyboardType,
      cursorColor: hasGreenBorder?kGreenColor:kBlueColor,
      obscureText: obsecure,
      decoration: InputDecoration(
        helperText: "",
        fillColor: kLightGrayColor,
        filled: true,
        labelText: labelText,
        labelStyle: theme.textTheme.caption!.apply(color: theme.hintColor),
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
