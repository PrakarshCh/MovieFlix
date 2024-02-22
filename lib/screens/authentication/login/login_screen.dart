import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ttn_flix/DI/injector.dart';
import 'package:ttn_flix/constants/app_shared_prefrence.dart';
import 'package:ttn_flix/route/app_route.gr.dart';
import '../../../helper/app_button.dart';
import '../../../constants/app_constant.dart';
import '../../../constants/app_string_constant.dart';
import '../../../helper/app_text_field.dart';
import '../../../utilities/app_validator.dart';
import '../bloc/Cubit/login_cubit.dart';
import '../bloc/state/login_state.dart';

@RoutePage()
class Login extends StatelessWidget {
  Login({super.key});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  final LoginCubit _loginCubit = LoginCubit();
  var sharedInstance = AppInjector.getIt<AppSharedPref>();

  void formValidation() async {
    if (_formKey.currentState?.validate() == true) {
      var params = {
        LoginApiKeys.email: _emailController.text,
        LoginApiKeys.password: _passwordController.text
      };
      _loginCubit.loginIn(params);
    }
  }

  Widget _loginButton() {
    return BlocConsumer<LoginCubit, LoginState>(listener: (context, state) {
      if (state is LoginError) {
        SnackBar snackBar = SnackBar(content: Text(state.message ?? ''));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else if (state is LoginSuccessState) {
        sharedInstance.setInt(
            key: AppSharedPrefEnums.timeStamp,
            value: DateTime.now().millisecondsSinceEpoch);
        context.router.push(const AppBottomBarRoute());
      }
    }, builder: (context, state) {
      return AppButton(
        title: AppStrings.login,
        onPressed: () {
          formValidation();
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
                        height: 150,
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
