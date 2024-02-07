import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mr_azmi/view/components/customs/custom_card.dart';
import 'package:mr_azmi/view_model/utils/connection_alert.dart';
import 'package:mr_azmi/view_model/utils/translate_keys.g.dart';
import '../../../view_model/bloc/auth_cubit/auth_cubit.dart';
import '../../../view_model/utils/app_colors.dart';
import '../../../view_model/utils/imgs.dart';
import '../../screens/home/home.dart';
import '../../screens/register/register.dart';
import '../customs/button_custom.dart';
import '../customs/text_custom.dart';
import '../customs/text_feild_custom.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = AuthCubit.get(context);
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Column(
          children: [
            Form(
              key: cubit.loginFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    Images.authPhoto,
                    width: 230,
                    height: 220,
                  ),
                  CustomCard(
                    child: Column(children: [
                       Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextCustom(
                          text: LocaleKeys.login.tr(),
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: AppColors.black,
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFieldCustom(
                        onTap: () {
                          cubit.restError();
                        },
                        prefixIcon: const Icon(Icons.phone),
                        labelText: LocaleKeys.mobilePhone.tr(),
                        keyboardType: TextInputType.phone,
                        controller: cubit.mobilePhone,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return LocaleKeys.mobile_validation.tr();
                          }
                          if (state is LoginErrorState) {
                            return cubit.loginError;
                          }
                          return null;
                        },
                        textInputAction: TextInputAction.next,
                        autoValidateMode: AutovalidateMode.onUserInteraction,
                      ),
                      const SizedBox(height: 20),
                      TextFieldCustom(
                        onTap: () {
                          cubit.restError();
                        },
                        prefixIcon: const Icon(Icons.security),
                        obscureText: true,
                        labelText: LocaleKeys.password.tr(),
                        controller: cubit.passwordController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return LocaleKeys.password_validation.tr();
                          }

                          return null;
                        },
                        autoValidateMode: AutovalidateMode.onUserInteraction,
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomButton(
                              color: AppColors.darkPink,
                              onPressed: state is! LoginLoadingState
                                  ? () {
                                ConnectionAlert.checkConnectivity(context);                                      if (cubit.loginFormKey.currentState!
                                          .validate()) {
                                        cubit.loginWithApi(context: context).then((value) {
                                          Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                              return const HomeScreen();
                                            }),
                                            (route) => false,
                                          );
                                        });
                                      }
                                    }
                                  : null,
                              child: Visibility(
                                  visible: state is! LoginLoadingState,
                                  replacement:
                                      const CircularProgressIndicator(),
                                  child:  TextCustom(
                                    text: LocaleKeys.login.tr(),
                                    color: AppColors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    height: 1.5 ,
                                  )),
                            ),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              cubit.restControllers();
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return const RegisterScreen();
                              }));
                            },
                            child:Padding(
                              padding: EdgeInsets.all(8.0),
                              child: TextCustom(
                                text: LocaleKeys.noAccount.tr(),
                                color: AppColors.darkGray,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                decorationColor: AppColors.darkGray,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      )
                    ]),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
