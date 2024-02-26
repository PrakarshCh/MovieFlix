import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ttn_flix/Extension/loader.dart';
import 'package:ttn_flix/Helper/App_radio_button.dart';
import 'package:ttn_flix/Helper/app_text_field.dart';
import 'package:ttn_flix/constants/app_constant.dart';
import 'package:ttn_flix/helper/app_button.dart';
import 'package:ttn_flix/constants/app_string_constant.dart';
import 'package:ttn_flix/screens/authentication/bloc/Cubit/signup_cubit.dart';
import 'package:ttn_flix/screens/authentication/bloc/state/signup_state.dart';
import 'package:ttn_flix/screens/authentication/signup/profile_image.dart';
import 'package:ttn_flix/utilities/app_validator.dart';
import 'package:ttn_flix/utilities/date_picker.dart';

@RoutePage()
class SignupPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  final SignupCubit signupCubit = SignupCubit();
  final ValueNotifier<String> gender = ValueNotifier<String>("");

  File? _pickedImage;
  SignupPage({super.key});

  void formValidation() async {
    if (formKey.currentState?.validate() == true) {
      signupCubit.registerUsingEmailPassword(
          name: nameController.text,
          email: emailController.text,
          password: passwordController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignupCubit>(
      create: (context) => signupCubit,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(title: const Text(AppStrings.signUp)),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: AppPaddings.regular, right: AppPaddings.regular),
              child: Form(
                key: formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      ValueListenableBuilder(
                          valueListenable: gender,
                          builder: (context, value, _) {
                            return ProfileImage(
                                pickerImage: (image) {
                                  _pickedImage = image;
                                },
                                gender: gender.value);
                          }),
                      const SizedBox(height: AppSpacing.regular),
                      AppTextField(
                          label: AppStrings.name,
                          controller: nameController,
                          validator: (value) {
                            if (value != null) {
                              if (Validator.isValidName(context, name: value) !=
                                  null) {
                                return Validator.isValidName(context,
                                    name: value);
                              }
                            }
                            return null;
                          },
                          inputType: TextInputType.name),
                      const SizedBox(height: AppSpacing.regular),
                      AppTextField(
                          label: AppStrings.dob,
                          readOnly: true,
                          onTap: () {
                            DatePicker(context, date: (date) {
                              dobController.text = date;
                            }).show();
                          },
                          controller: dobController,
                          validator: (value) {
                            if (value != null) {
                              if (Validator.isEmpty(value)) {
                                return AppStrings.dobMessage;
                              }
                            }
                            return null;
                          },
                          inputType: TextInputType.emailAddress),
                      const SizedBox(height: AppSpacing.regular),
                      AppTextField(
                          label: AppStrings.emailAddress,
                          controller: emailController,
                          validator: (value) {
                            if (value != null) {
                              if (Validator.isEmailValid(context,
                                      email: value) !=
                                  null) {
                                return Validator.isEmailValid(context,
                                    email: value);
                              }
                            }
                            return null;
                          },
                          inputType: TextInputType.emailAddress),
                      const SizedBox(height: AppSpacing.regular),
                      AppTextField(
                          label: AppStrings.password,
                          controller: passwordController,
                          isPassword: true,
                          validator: (value) {
                            if (value != null) {
                              if (Validator.isValidPassword(context,
                                      password: value) !=
                                  null) {
                                return Validator.isValidPassword(context,
                                    password: value);
                              }
                            }
                            return null;
                          },
                          inputType: TextInputType.visiblePassword),
                      const SizedBox(height: AppSpacing.regular),
                      AppTextField(
                          label: AppStrings.confirmPassword,
                          controller: confirmPasswordController,
                          isPassword: true,
                          validator: (value) {
                            if (value != null) {
                              if (Validator.isValidPassword(context,
                                      password: value) !=
                                  null) {
                                return Validator.isValidPassword(context,
                                    password: value);
                              } else if (passwordController.text != value) {
                                return AppStrings.passwordNotMatch;
                              }
                            }
                            return null;
                          },
                          inputType: TextInputType.visiblePassword),
                      const SizedBox(height: AppSpacing.regular),
                      AppRadioButton(
                          label: AppStrings.gender,
                          items: const [
                            AppStrings.male,
                            AppStrings.female,
                            AppStrings.other
                          ],
                          onChange: (value) {
                            gender.value = value;
                          }),
                      const SizedBox(height: AppSpacing.regular),
                      BlocConsumer<SignupCubit, SignupState>(
                          listener: (context, state) {
                        if (state is SignupError) {
                          Navigator.pop(context);
                          SnackBar snackBar =
                              SnackBar(content: Text(state.message ?? ''));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        } else if (state is SignupSuccessState) {
                          Map<String, dynamic> params = {
                            LoginApiKeys.email: emailController.text,
                            LoginApiKeys.password: passwordController.text,
                            LoginApiKeys.name: nameController.text,
                            LoginApiKeys.dob: dobController.text,
                            LoginApiKeys.gender: gender.value
                          };
                          if (_pickedImage != null) {
                            params[LoginApiKeys.image] = _pickedImage;
                          }
                          signupCubit.signup(params);
                          Navigator.pop(context);
                          context.router.pop();
                        } else if (state is SignupLoadingState) {
                          context.showLoader();
                        }
                      }, builder: (context, state) {
                        return AppButton(
                          title: AppStrings.signUp,
                          onPressed: () {
                            formValidation();
                          },
                          foreground: AppColors.white,
                          background: AppColors.buttonColor,
                        );
                      }),
                      const SizedBox(height: AppSpacing.regular),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(AppStrings.alreadyHaveAccount,
                                style: TextStyle(
                                    fontSize: AppFontSize.regular,
                                    fontWeight: FontWeight.w400)),
                            InkWell(
                              onTap: () {
                                context.router.pop();
                              },
                              child: const Text(AppStrings.login,
                                  style: TextStyle(
                                      fontSize: AppFontSize.regular,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.primaryColor)),
                            )
                          ]),
                      const SizedBox(height: AppSpacing.regular),
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
