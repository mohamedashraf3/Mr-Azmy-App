import 'package:flutter/material.dart';

import '../../../view_model/utils/app_colors.dart';
class CustomDivider extends StatelessWidget {
 final double? thickness;
  const CustomDivider({super.key, this.thickness,});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: AppColors.gray,
      thickness:thickness?? 1,
      height: 20,
      indent: MediaQuery.of(context).size.width / 10,
      endIndent: MediaQuery.of(context).size.width / 10,
    );
  }
}
