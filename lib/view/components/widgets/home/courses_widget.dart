import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mr_azmi/view/components/customs/custom_divider.dart';
import 'package:mr_azmi/view/screens/home/home_shimmer.dart';
import 'package:mr_azmi/view_model/bloc/course_cubit/course_cubit.dart';
import '../../../../model/home_courses_model.dart';
import 'home_expnation_widget.dart';

class CoursesWidget extends StatelessWidget {
  const CoursesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = CourseCubit.get(context);
    return BlocProvider.value(
      value: CourseCubit.get(context)..getHomeCourse(),
      child: BlocConsumer<CourseCubit, CourseState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Visibility(
              visible: cubit.homeCourseModel != null &&
                  cubit.homeCourseModel?.data?.isNotEmpty == true,
              replacement: const HomeShimmer(),
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return ExpansionTileCustom(
                    levelName: cubit.homeCourseModel!.data![index].name ?? "",
                    onExpansionChanged: (isExpanded) {
                      if (isExpanded) {
                        cubit.homeCourseModel?.data?[index].courses;
                        cubit.updateOpenIndex(index);
                      } else {
                        cubit.updateOpenIndex(null);
                      }
                    },
                    isExpanded: cubit.openIndex == index,
                    homeCourses:
                        cubit.homeCourseModel!.data?[index] ?? HomeCourse(),
                  );
                },
                separatorBuilder: (context, index) => const CustomDivider(),
                itemCount: cubit.homeCourseModel?.data?.length ?? 0,
              ),
            ),
          );
        },

      ),
    );
  }
}
