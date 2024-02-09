import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mr_azmi/model/show_course_model.dart';
import 'package:mr_azmi/view/components/customs/custom_appbar.dart';
import 'package:mr_azmi/view/components/widgets/drawer_widget.dart';
import 'package:mr_azmi/view/components/widgets/footer_widget.dart';
import 'package:mr_azmi/view/components/widgets/my_learning/my_learning_widget.dart';
import 'package:mr_azmi/view/screens/my_learning/my_learning_shimmer.dart';
import 'package:mr_azmi/view/screens/show_course/show_course.dart';
import 'package:mr_azmi/view_model/bloc/course_cubit/course_cubit.dart';
import '../../../model/my_course_model.dart';
import '../../../view_model/utils/connection_alert.dart';

class MyLearningScreen extends StatelessWidget {
  const MyLearningScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var cubit = CourseCubit.get(context);
    return BlocProvider.value(
      value: cubit..getEnrolledCourses(),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: const AppBarCustom(),
        drawer: const DrawerWidget(),
        body: RefreshIndicator(
          onRefresh: () async {
            cubit.myCoursesModel = null;
            await cubit.getEnrolledCourses();
          },
          child: BlocConsumer<CourseCubit, CourseState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              return cubit.myCoursesModel?.courses == null
                  ? const MyLearningShimmer()
                  : Container(
                      child: Column(
                        children: [
                          Expanded(
                            child: ListView.builder(
                              padding: const EdgeInsets.all(8),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return MyLearningWidget(
                                  color: Theme.of(context).colorScheme.primary,
                                  courses:
                                      cubit.myCoursesModel?.courses?[index] ??
                                          MyCourses(),
                                  onTap: () async {
                                    ConnectionAlert.internetConnection(context);
                                    ConnectionAlert.checkConnectivity(context);
                                    await cubit
                                        .showCourseById(
                                            id: cubit.myCoursesModel
                                                    ?.courses?[index].id ??
                                                0)
                                        .then((value) {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return ShowCourseDetails(
                                          showData:
                                              cubit.courseByIdModel?.data ??
                                                  Data(),
                                        );
                                      }));
                                    });
                                  },
                                );
                              },
                              itemCount:
                                  cubit.myCoursesModel?.courses?.length ?? 0,
                            ),
                          ),
                          const FooterWidget(),
                        ],
                      ),
                    );
            },
          ),
        ),
      ),
    );
  }
}
