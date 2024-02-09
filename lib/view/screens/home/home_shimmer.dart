import 'package:flutter/material.dart';
import 'package:mr_azmi/view/components/widgets/shimmer_widget.dart';
import 'package:mr_azmi/view_model/utils/app_colors.dart';

import '../../components/customs/custom_divider.dart';

class HomeShimmer extends StatelessWidget {
  const HomeShimmer({Key? key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(
          4,
          (index) => Column(
            children: [
              ShimmerWidget(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: AppColors.red,
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  height: 55,
                ),
              ),
              CustomDivider(),
            ],
          ),
        ),
      ),
    );
  }
}
