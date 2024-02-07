import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mr_azmi/view/components/customs/custom_appbar.dart';
import 'package:mr_azmi/view/components/widgets/courses/coursesdetail_widget.dart';
import 'package:mr_azmi/view/components/widgets/drawer_widget.dart';
import 'package:mr_azmi/view/components/widgets/footer_widget.dart';
import 'package:mr_azmi/view/screens/courses/courses_shimmer.dart';
import 'package:mr_azmi/view_model/bloc/course_cubit/course_cubit.dart';
import 'package:mr_azmi/view_model/utils/connection_alert.dart';
import '../../../model/all_courses_model.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = CourseCubit.get(context);
    return BlocProvider.value(
      value: cubit..getAllCourse(),
      child: BlocConsumer<CourseCubit, CourseState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            appBar: const AppBarCustom(),
            drawer: const DrawerWidget(),
            backgroundColor: Theme.of(context).colorScheme.background,
            body: cubit.allCoursesModel?.data == null?
                 const CoursesShimmer()
                : RefreshIndicator(
                  onRefresh: ()async {
                    ConnectionAlert.checkConnectivity(context);
                    cubit.allCoursesModel=null;
                   await cubit.getAllCourse();
                  },
                  child: ListView(
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: cubit.allCoursesModel?.data?.length,
                          itemBuilder: (context, index) => CoursesDetailsWidget(
                            color: Theme.of(context).colorScheme.primary,
                            data: cubit.allCoursesModel?.data?[index] ?? Data(),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const FooterWidget(),
                      ],
                    ),
                ),
          );
        },
      ),
    );
  }
}
