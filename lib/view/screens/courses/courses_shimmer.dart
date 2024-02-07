import 'package:flutter/material.dart';
import 'package:mr_azmi/view/components/widgets/shimmer_widget.dart';
import 'package:mr_azmi/view_model/utils/app_colors.dart';


class CoursesShimmer extends StatelessWidget {
  const CoursesShimmer({Key? key});

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
                  margin: EdgeInsets.all(12),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: AppColors.red,
                      borderRadius: BorderRadius.all(Radius.circular(12))
                  ),
                  height: 350,
                ),
              ),
              SizedBox(height: 10,),
            ],
          ),
        ),
      ),
    );
  }
}
