import 'package:flutter/material.dart';

import '../../../view_model/utils/app_colors.dart';
class CustomCard extends StatelessWidget {
  const CustomCard({super.key,required this.child, this.color, this.margin});
final Widget child;
final Color? color;
final double? margin ;


  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(margin??12),
      color:color?? AppColors.cardColor,
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
          padding: const EdgeInsets.all(8),
          child: child),
    );
  }
}
