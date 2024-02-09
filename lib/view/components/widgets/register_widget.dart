import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mr_azmi/view/components/customs/custom_card.dart';
import 'package:mr_azmi/view/screens/home/home.dart';
import 'package:mr_azmi/view/screens/login/login.dart';
import 'package:mr_azmi/view_model/utils/connection_alert.dart';
import 'package:mr_azmi/view_model/utils/translate_keys.g.dart';

import '../../../view_model/bloc/auth_cubit/auth_cubit.dart';
import '../../../view_model/utils/app_colors.dart';
import '../../../view_model/utils/imgs.dart';
import '../customs/button_custom.dart';
import '../customs/text_custom.dart';
import '../customs/text_feild_custom.dart';

class RegisterWidget extends StatelessWidget {
  const RegisterWidget({super.key});

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
              key: cubit.registerFormKey,
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
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: TextCustom(
                            text: LocaleKeys.register.tr(),
                            fontSize: 35,
                            color: AppColors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextFieldCustom(
                          onTap: () {
                            cubit.restError();
                          },
                          controller: cubit.nameController,
                          labelText: LocaleKeys.Full_Name.tr(),
                          autoValidateMode: AutovalidateMode.onUserInteraction,
                          prefixIcon: const Icon(Icons.person),
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return LocaleKeys.name_validation.tr();
                            }
                            if (state is RegisterErrorState) {
                              return cubit.nameError;
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 15),
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
                            if (state is RegisterErrorState) {
                              return cubit.phoneError;
                            }
                            return null;
                          },
                          textInputAction: TextInputAction.next,
                          autoValidateMode: AutovalidateMode.onUserInteraction,
                        ),
                        const SizedBox(height: 15),
                        TextFieldCustom(
                          textInputAction: TextInputAction.next,
                          obscureText: true,
                          prefixIcon: const Icon(Icons.security),
                          labelText: LocaleKeys.password.tr(),
                          controller: cubit.passwordController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return LocaleKeys.password_validation.tr();
                            } else if (value !=
                                cubit.confirmPassController.text) {
                              return LocaleKeys.confPassword_validation.tr();
                            } else {
                              return null;
                            }
                          },
                          autoValidateMode: AutovalidateMode.onUserInteraction,
                        ),
                        const SizedBox(height: 15),
                        TextFieldCustom(
                          labelText: LocaleKeys.confirmPassword.tr(),
                          obscureText: true,
                          prefixIcon: const Icon(Icons.security),
                          controller: cubit.confirmPassController,
                          textInputAction: TextInputAction.done,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return LocaleKeys.password_validation.tr();
                            } else if (value != cubit.passwordController.text) {
                              return LocaleKeys.confPassword_validation.tr();
                            } else {
                              return null;
                            }
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
                                onPressed: state is! RegisterLoadingState
                                    ? () {
                                        ConnectionAlert.internetConnection(
                                            context);
                                        ConnectionAlert.checkConnectivity(
                                            context);
                                        if (cubit.registerFormKey.currentState!
                                            .validate()) {
                                          cubit
                                              .registerWithApi(context: context)
                                              .then((value) {
                                            Navigator.pushAndRemoveUntil(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const HomeScreen(),
                                                ),
                                                (route) => false);
                                          });
                                        }
                                      }
                                    : null,
                                child: Visibility(
                                  visible: state is! RegisterLoadingState,
                                  replacement: Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                  child: TextCustom(
                                    text: LocaleKeys.register.tr(),
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.white,
                                  ),
                                ),
                              ),
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () async {
                                await cubit.restControllers().then((value) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginScreen()));
                                });
                              },
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: TextCustom(
                                  text: LocaleKeys.alreadyHaveAcc.tr(),
                                  color: AppColors.darkGray,
                                  decorationColor: AppColors.darkGray,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
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
