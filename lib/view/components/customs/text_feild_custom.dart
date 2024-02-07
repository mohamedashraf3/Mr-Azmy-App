import 'package:flutter/material.dart';

import '../../../view_model/utils/app_colors.dart';
class TextFieldCustom extends StatelessWidget {
  final AutovalidateMode? autoValidateMode;
 final String? Function(String?)? validator;
 final Widget? prefixIcon;
  final int maxLines;
 final bool obscureText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final void Function()? onTap;
  final bool readOnly;
  final String? labelText;
  final Widget? suffixIcon;
  final Color? focusedBorderColor;

   const TextFieldCustom({
    super.key,
    this.maxLines = 1,
    this.controller,
    this.keyboardType,
    this.textInputAction,
    this.onTap,
    this.labelText,
    this.readOnly = false,
    this.validator, this.autoValidateMode,
     this.obscureText=false, this.prefixIcon, this.suffixIcon, this.focusedBorderColor,
  });

  @override
  Widget build(BuildContext context){
    return AutofillGroup(
      onDisposeAction: AutofillContextAction.commit,
      child: TextFormField(
        controller: controller,
        autofillHints: const [AutofillHints.telephoneNumber],
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        onTap: onTap,
        obscureText:obscureText,
        validator:validator,
        readOnly: readOnly,
        style: TextStyle(color: AppColors.black),
        autovalidateMode:autoValidateMode,
        cursorColor: AppColors.blue,
        decoration: InputDecoration(
          errorMaxLines: 2,
          suffixIcon:suffixIcon ,
          prefixIcon:prefixIcon ,
          prefixIconColor: AppColors.darkGray,
          labelText: labelText,
          labelStyle: const TextStyle(color: AppColors.darkGray),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.black, width: 3),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color:focusedBorderColor?? AppColors.blue, width: 3),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide:  const BorderSide(color: AppColors.gray, width: 3),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.red, width: 3),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.red, width: 3),
          ),
        ),
        maxLines: maxLines,

      ),
    );
  }
}
