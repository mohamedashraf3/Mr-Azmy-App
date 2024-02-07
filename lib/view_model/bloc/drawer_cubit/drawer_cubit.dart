import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mr_azmi/view/screens/contactus/contactus.dart';
import 'package:mr_azmi/view/screens/courses/courses.dart';
import 'package:mr_azmi/view/screens/home/home.dart';
import 'package:mr_azmi/view/screens/my_learning/my_learning.dart';
import 'package:mr_azmi/view_model/data/local/shared_prefrence/shared_keys.dart';
import 'package:mr_azmi/view_model/data/local/shared_prefrence/shared_prefrence.dart';
import 'package:mr_azmi/view_model/utils/light_theme.dart';
import 'package:mr_azmi/view_model/utils/translate_keys.g.dart';

import '../../utils/dark_theme.dart';

part 'drawer_state.dart';

class DrawerCubit extends Cubit<DrawerState> {
  DrawerCubit() : super(HomeInitial());

  static DrawerCubit get(context) => BlocProvider.of<DrawerCubit>(context);

  List<String> items = [
    LocaleKeys.Home,
    LocaleKeys.My_learning,
    LocaleKeys.Courses,
    LocaleKeys.Contactus
  ];
  List<Widget> itemScreen = [
    const HomeScreen(),
    const MyLearningScreen(),
    const CoursesScreen(),
    const ContactUsScreen()
  ];
  int selectedItemIndex = 0;

  void selectedItem(int index) {
    selectedItemIndex = index;
    emit(SelectedItemState());
  }

  Future<void> toggleLanguage(BuildContext context) async {
    if (context.locale == Locale('ar')) {
      context.setLocale(Locale('en'));
    } else {
      context.setLocale(Locale('ar'));
    }

    emit(LanguageChangedState());
  }

  bool isSwitched = false;
  ThemeData? themeData = lightTheme;
  bool isDarkTheme = LocalData.get(SharedKeys.isSwitched) ?? false;

  void toggleSwitch() {
    isSwitched = !isSwitched;
    themeData = isSwitched ? darkTheme : lightTheme;
    LocalData.set(key: SharedKeys.isSwitched, value: isSwitched);
    emit(SwitchChangedState());
  }
}
