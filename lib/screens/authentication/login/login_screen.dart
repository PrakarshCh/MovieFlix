import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ttn_flix/DI/injector.dart';
import 'package:ttn_flix/Extension/loader.dart';
import 'package:ttn_flix/Helper/app_button.dart';
import 'package:ttn_flix/Helper/app_text_field.dart';
import 'package:ttn_flix/constants/app_constant.dart';
import 'package:ttn_flix/constants/app_shared_prefrence.dart';
import 'package:ttn_flix/constants/app_string_constant.dart';
import 'package:ttn_flix/route/app_route.gr.dart';
import 'package:ttn_flix/screens/authentication/bloc/Cubit/login_cubit.dart';
import 'package:ttn_flix/screens/authentication/bloc/state/login_state.dart';
import 'package:ttn_flix/utilities/app_validator.dart';

@RoutePage()
class Login extends StatelessWidget {
  Login({super.key});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  final LoginCubit _loginCubit = LoginCubit();
  var sharedInstance = AppInjector.getIt<AppSharedPref>();

  void formValidation(BuildContext context) async {
    if (_formKey.currentState?.validate() == true) {
      _loginCubit.signInUsingEmailPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
    }
  }

  Widget _loginButton() {
    return BlocConsumer<LoginCubit, LoginState>(listener: (context, state) {
      if (state is LoginError) {
        Navigator.pop(context);
        SnackBar snackBar = SnackBar(content: Text(state.message ?? ''));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else if (state is LoginSuccessState) {
        Navigator.pop(context);
        var params = {
          LoginApiKeys.email: _emailController.text,
          LoginApiKeys.password: _passwordController.text
        };
        _loginCubit.loginIn(params);
        context.router.push(const AppBottomBarRoute());
      } else if (state is LoginLoadingState) {
        context.showLoader();
      }
    }, builder: (context, state) {
      return AppButton(
        title: AppStrings.login,
        onPressed: () {
          formValidation(context);
        },
        foreground: AppColors.white,
        background: AppColors.buttonColor,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (context) => _loginCubit,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: AppPaddings.regular, right: AppPaddings.regular),
              child: Form(
                key: _formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Image(
                        image: AssetImage(AppImages.movie),
                        height: AppIconSize.movieImage,
                      ),
                      const SizedBox(height: AppSpacing.regular),
                      const Text(AppStrings.login,
                          style: TextStyle(
                              fontSize: AppFontSize.extraLarge,
                              fontWeight: FontWeight.w600)),
                      const SizedBox(height: AppSpacing.regular),
                      const Text(AppStrings.signInMessage,
                          style: TextStyle(
                              fontSize: AppFontSize.regular,
                              fontWeight: FontWeight.w400)),
                      const SizedBox(height: AppSpacing.large),
                      AppTextField(
                        label: AppStrings.emailAddress,
                        controller: _emailController,
                        validator: (value) {
                          if (value != null) {
                            if (Validator.isEmailValid(context, email: value) !=
                                null) {
                              return Validator.isEmailValid(context,
                                  email: value);
                            }
                          }
                          return null;
                        },
                        inputType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: AppSpacing.regular),
                      AppTextField(
                          label: AppStrings.password,
                          controller: _passwordController,
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
                      _loginButton(),
                      const SizedBox(height: AppSpacing.regular),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(AppStrings.dontHaveAccount,
                                style: TextStyle(
                                    fontSize: AppFontSize.regular,
                                    fontWeight: FontWeight.w400)),
                            InkWell(
                              onTap: () {
                                context.router.push(SignupPageRoute());
                              },
                              child: const Text(AppStrings.signUp,
                                  style: TextStyle(
                                      fontSize: AppFontSize.regular,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.primaryColor)),
                            )
                          ])
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
