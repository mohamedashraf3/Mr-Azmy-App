import 'package:easy_localization/easy_localization.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:mr_azmi/view/screens/onboarding/onboarding.dart';
import 'package:mr_azmi/view/screens/splash/splash.dart';
import 'package:mr_azmi/view_model/bloc/auth_cubit/auth_cubit.dart';
import 'package:mr_azmi/view_model/bloc/course_cubit/course_cubit.dart';
import 'package:mr_azmi/view_model/bloc/drawer_cubit/drawer_cubit.dart';
import 'package:mr_azmi/view_model/data/local/shared_prefrence/shared_keys.dart';
import 'package:mr_azmi/view_model/data/local/shared_prefrence/shared_prefrence.dart';
import 'package:mr_azmi/view_model/data/network/dio_helper.dart';
import 'package:mr_azmi/view_model/utils/dark_theme.dart';
import 'package:mr_azmi/view_model/utils/light_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await DioHelper.init();
  await LocalData.init();
  await FastCachedImageConfig.init();
  bool isFirstTime = LocalData.get(SharedKeys.firstTime) ?? true;
  runApp(EasyLocalization(
    supportedLocales: [Locale('ar'), Locale('en')],
    path: 'assets/translations',
    fallbackLocale: Locale('ar'),
    child: MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => CourseCubit(),
        ),
        BlocProvider(
          create: (context) => DrawerCubit(),
        )
      ],
      child: Phoenix(
          child: MyApp(
        isFirstTime: isFirstTime,
      )),
    ),
  ));
}

class MyApp extends StatelessWidget {
  final bool isFirstTime;

  const MyApp({super.key, required this.isFirstTime});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DrawerCubit, DrawerState>(
      builder: (context, state) {
        return MaterialApp(
          title: "Mr Azmi App",
          debugShowCheckedModeBanner: false,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          theme: LocalData.get(SharedKeys.isSwitched) == true
              ? darkTheme
              : lightTheme,
          home: isFirstTime ? OnBoardingScreen() : SplashScreen(),
        );
      },
    );
  }
}
