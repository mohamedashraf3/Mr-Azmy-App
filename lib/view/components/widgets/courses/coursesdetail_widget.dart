import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mr_azmi/view_model/bloc/auth_cubit/auth_cubit.dart';
import 'package:mr_azmi/view_model/bloc/course_cubit/course_cubit.dart';
import '../../../../model/all_courses_model.dart';
import '../../../../view_model/utils/connection_alert.dart';
import '../../../screens/show_course/show_course.dart';
import '../../customs/course_details.dart';
import '../../customs/text_custom.dart';

class CoursesDetailsWidget extends StatelessWidget {
  final Data data;
  final Color? color;
   CoursesDetailsWidget({
    super.key,
    required this.data, this.color,
  });


  @override
  Widget build(BuildContext context) {

    var cubit = CourseCubit.get(context);

    return  Container(
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(12))),
      margin: const EdgeInsets.all(8),
      height: 362,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextCustom(
              textAlign: TextAlign.left,
              text: data.name ?? "",
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) {
                    // TODO: implement listener
                  },
                  builder: (context, state) {
                    return CourseDetails(
                      color: Theme.of(context).colorScheme.background,
                      courseImage: data.courses?[index].image ?? "",
                      courseTitle: data.courses?[index].title ?? "",
                      onPressedEnroll: () {
                        ConnectionAlert.internetConnection(context);
                        ConnectionAlert.checkConnectivity(context);
                        cubit.enrollNewCourse(
                            id: data.courses?[index].id ?? 0, context: context);
                      },
                      onPressedView: () async {
                        ConnectionAlert.internetConnection(context);
                        ConnectionAlert.checkConnectivity(context);
                        await cubit.showCourseById(id: data.courses?[index].id ?? 0)
                            .then((value) {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                                return ShowCourseDetails(
                                  showData:
                                  cubit.courseByIdModel?.data ??Data(),
                                );
                              }));
                        });
                      },

                      visible:AuthCubit.get(context).isCourseEnrolled(data.courses?[index].id),
                    );
                  },
                );
              },
              itemCount: data.courses?.length ?? 0,
            ),
          ),
        ],
      ),
    );
  }
}
