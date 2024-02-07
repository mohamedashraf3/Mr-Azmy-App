import 'package:flutter/material.dart';
import 'package:mr_azmi/model/home_courses_model.dart';
import 'package:mr_azmi/view/components/customs/course_details.dart';
import 'package:mr_azmi/view/screens/show_course/show_course.dart';
import 'package:mr_azmi/view_model/bloc/auth_cubit/auth_cubit.dart';
import 'package:mr_azmi/view_model/bloc/course_cubit/course_cubit.dart';
import 'package:mr_azmi/view_model/utils/app_colors.dart';
import 'package:mr_azmi/view_model/utils/connection_alert.dart';

import '../../../../model/all_courses_model.dart';
import '../../customs/text_custom.dart';

class ExpansionTileCustom extends StatelessWidget {
  const ExpansionTileCustom({
    super.key,
    required this.levelName,
    this.onExpansionChanged,
    required this.isExpanded,
    required this.homeCourses,
  });

  final HomeCourse homeCourses;
  final String levelName;
  final bool isExpanded;

  final void Function(bool)? onExpansionChanged;

  @override
  Widget build(BuildContext context) {
    var cubit = CourseCubit.get(context);
    return ExpansionTile(
      trailing: Icon(
          isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
          size: 30),
      onExpansionChanged: onExpansionChanged,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      collapsedBackgroundColor: Theme.of(context).colorScheme.primary,
      iconColor: isExpanded ? AppColors.darkPink : AppColors.darkGray,
      backgroundColor: isExpanded
          ? Theme.of(context).colorScheme.secondary
          : Theme.of(context).colorScheme.primary,
      collapsedShape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      title: TextCustom(text: levelName, fontWeight: FontWeight.bold),
      leading: const Icon(Icons.video_collection_outlined),
      children: [
        if (isExpanded)
          Visibility(
              visible: cubit.homeCourseModel != null &&
                  cubit.homeCourseModel?.data?.isNotEmpty == true,
              replacement: const Padding(
                padding: EdgeInsets.all(20.0),
                child: Center(child: CircularProgressIndicator()),
              ),
              child: SizedBox(
                height: 310,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: homeCourses.courses?.length ?? 0,
                  itemBuilder: (context, index) {
                    return CourseDetails(
                      color: Theme.of(context).colorScheme.background,
                      courseImage: homeCourses.courses?[index].image ?? "",
                      courseTitle: homeCourses.courses?[index].title ?? "",
                      onPressedView: () async {
                        ConnectionAlert.checkConnectivity(context);
                        await cubit
                            .showCourseById(
                                id: homeCourses.courses?[index].id ?? 0)
                            .then((value) {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return ShowCourseDetails(
                              showData: cubit.courseByIdModel?.data ?? Data(),
                            );
                          }));
                        });
                      },
                      onPressedEnroll: () {
                        ConnectionAlert.checkConnectivity(context);
                        cubit.enrollNewCourse(
                            id: homeCourses.courses?[index].id ?? 0,
                            context: context);
                      },
                      visible: AuthCubit.get(context)
                          .isCourseEnrolled(homeCourses.courses?[index].id),
                    );
                  },
                ),
              ))
      ],
    );
  }
}
