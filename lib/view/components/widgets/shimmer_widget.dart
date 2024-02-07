import 'package:flutter/material.dart';
import 'package:mr_azmi/view_model/utils/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({Key? key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.withOpacity(0.2),
      highlightColor: AppColors.orange.withOpacity(0.2),
      child: child,
    );
  }
}