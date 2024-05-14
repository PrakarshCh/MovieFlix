import 'dart:convert';
import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ttn_flix/DI/injector.dart';
import 'package:ttn_flix/Extension/context_extention.dart';
import 'package:ttn_flix/Helper/App_radio_button.dart';
import 'package:ttn_flix/Helper/app_button.dart';
import 'package:ttn_flix/Helper/app_text_field.dart';
import 'package:ttn_flix/constants/app_constant.dart';
import 'package:ttn_flix/constants/app_shared_prefrence.dart';
import 'package:ttn_flix/constants/app_string_constant.dart';
import 'package:ttn_flix/screens/account/edit_account/cubit/edit_acount_cubit.dart';
import 'package:ttn_flix/screens/account/edit_account/cubit/state/edit_acount_state.dart';
import 'package:ttn_flix/screens/authentication/signup/profile_image.dart';
import 'package:ttn_flix/utilities/app_validator.dart';
import 'package:ttn_flix/utilities/date_picker.dart';

@RoutePage()
class EditAccount extends StatelessWidget {
  final TextEditingController _dobEditingController = TextEditingController();
  final TextEditingController _nameEditingController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  final EditAccountCubit _accountCubit = EditAccountCubit();
  final ValueNotifier<String> _gender = ValueNotifier<String>("");
  final Function isUpdated;
  Uint8List? _pickedImage;

  EditAccount({super.key, required this.isUpdated}) {
    AppSharedPref sharedInstance = AppInjector.getIt<AppSharedPref>();
    var value = base64Decode(
        sharedInstance.getString(key: AppSharedPrefEnums.profileImage));
    _pickedImage = value;
    _gender.value = "";

    _dobEditingController.text =
        sharedInstance.getString(key: AppSharedPrefEnums.dob);
    _nameEditingController.text =
        sharedInstance.getString(key: AppSharedPrefEnums.fullName);
    _gender.value = sharedInstance.getString(key: AppSharedPrefEnums.gender);
  }

  void _validateForm() async {
    if (_formKey.currentState?.validate() == true) {
      SystemChannels.textInput.invokeMethod("TextInput.hide");
      Map<String, dynamic> params = {
        LoginApiKeys.name: _nameEditingController.text,
        LoginApiKeys.dob: _dobEditingController.text,
        LoginApiKeys.gender: _gender.value
      };
      if (_pickedImage != null) {
        params[LoginApiKeys.image] = _pickedImage;
      }
      _accountCubit.update(params);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EditAccountCubit>(
        create: (context) => _accountCubit,
        child: Scaffold(
            appBar: AppBar(
              title: const Text(AppStrings.editProfile),
              centerTitle: true,
              backgroundColor: AppColors.primaryColor,
            ),
            body: SafeArea(
                child: SingleChildScrollView(
                    child: Padding(
                        padding: const EdgeInsets.only(
                            left: AppPaddings.regular,
                            right: AppPaddings.regular),
                        child: Form(
                            key: _formKey,
                            child: Center(
                              child: SizedBox(
                                width: context.isSmallScreen
                                    ? context.width
                                    : context.width / 2,
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Container(
                                        margin: const EdgeInsets.only(
                                            top: AppPaddings.small),
                                        child: ValueListenableBuilder(
                                            valueListenable: _gender,
                                            builder: (context, value, _) {
                                              return ProfileImage(
                                                pickerImage: (image) {
                                                  _pickedImage = image;
                                                },
                                                gender: _gender.value,
                                                pickedImage: _pickedImage,
                                              );
                                            }),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(
                                            top: AppPaddings.small),
                                        child: AppTextField(
                                            label: AppStrings.name,
                                            controller: _nameEditingController,
                                            validator: (value) {
                                              if (value != null) {
                                                if (Validator.isValidName(
                                                        context,
                                                        name: value) !=
                                                    null) {
                                                  return Validator.isValidName(
                                                      context,
                                                      name: value);
                                                }
                                              }
                                              return null;
                                            },
                                            inputType: TextInputType.name),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(
                                            top: AppPaddings.small),
                                        child: AppTextField(
                                            label: AppStrings.dob,
                                            readOnly: true,
                                            onTap: () {
                                              DatePicker(context, date: (date) {
                                                _dobEditingController.text =
                                                    date;
                                              }).show();
                                            },
                                            controller: _dobEditingController,
                                            validator: (value) {
                                              if (value != null) {
                                                if (Validator.isEmpty(value)) {
                                                  return AppStrings.dobMessage;
                                                }
                                              }
                                              return null;
                                            },
                                            inputType:
                                                TextInputType.emailAddress),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(
                                            top: AppPaddings.small),
                                        child: AppRadioButton(
                                            label: AppStrings.gender,
                                            items: const [
                                              AppStrings.male,
                                              AppStrings.female,
                                              AppStrings.other
                                            ],
                                            selectedItem: _gender.value,
                                            onChange: (value) {
                                              _gender.value = value;
                                            }),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(
                                            top: AppPaddings.small),
                                        child: BlocConsumer<EditAccountCubit,
                                                EditAccountState>(
                                            listener: (context, state) {
                                          if (state is SuccessState) {
                                            context.router.pop();
                                            isUpdated.call();
                                          }
                                        }, builder: (context, state) {
                                          return AppButton(
                                            title: AppStrings.update,
                                            onPressed: () {
                                              _validateForm();
                                            },
                                            foreground: AppColors.white,
                                            background: AppColors.buttonColor,
                                          );
                                        }),
                                      )
                                    ]),
                              ),
                            )))))));
  }
}
