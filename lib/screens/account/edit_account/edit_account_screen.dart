import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ttn_flix/constants/app_string_constant.dart';
import 'package:ttn_flix/helper/app_button.dart';
import 'dart:io';
import '../../../DI/injector.dart';
import '../../../constants/app_constant.dart';
import '../../../constants/app_shared_prefrence.dart';
import '../../../helper/App_radio_button.dart';
import '../../../helper/app_text_field.dart';
import '../../../utilities/app_validator.dart';
import '../../../utilities/date_picker.dart';
import '../../../utilities/file_manager.dart';
import '../../authentication/signup/profile_image.dart';
import 'cubit/edit_acount_cubit.dart';
import 'cubit/state/edit_acount_state.dart';

@RoutePage()
class EditAccount extends StatelessWidget {
  final TextEditingController _dobEditingController = TextEditingController();
  final TextEditingController _nameEditingController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  final EditAccountCubit _accountCubit = EditAccountCubit();
  final ValueNotifier<String> _gender = ValueNotifier<String>("");
  File? _pickedImage;
  EditAccount({super.key}) {
    AppSharedPref sharedInstance = AppInjector.getIt<AppSharedPref>();
    FileManager fileManager = AppInjector.getIt<FileManager>();
    fileManager
        .getFile(sharedInstance.getString(key: AppSharedPrefEnums.profileImage))
        .then((value) {
      _pickedImage = value;
      _gender.value = "";
      _gender.value = sharedInstance.getString(key: AppSharedPrefEnums.gender);
    });
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
            appBar: AppBar(title: const Text('Edit account')),
            body: SafeArea(
                child: SingleChildScrollView(
                    child: Padding(
                        padding: const EdgeInsets.only(
                            left: AppPaddings.regular,
                            right: AppPaddings.regular),
                        child: Form(
                            key: _formKey,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  ValueListenableBuilder(
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
                                  const SizedBox(height: AppSpacing.regular),
                                  AppTextField(
                                      label: AppStrings.name,
                                      controller: _nameEditingController,
                                      validator: (value) {
                                        if (value != null) {
                                          if (Validator.isValidName(context,
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
                                  const SizedBox(height: AppSpacing.regular),
                                  AppTextField(
                                      label: AppStrings.dob,
                                      readOnly: true,
                                      onTap: () {
                                        DatePicker(context, date: (date) {
                                          _dobEditingController.text = date;
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
                                      inputType: TextInputType.emailAddress),
                                  const SizedBox(height: AppSpacing.regular),
                                  AppRadioButton(
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
                                  const SizedBox(height: AppSpacing.regular),
                                  BlocConsumer<EditAccountCubit,
                                          EditAccountState>(
                                      listener: (context, state) {
                                    if (state is SuccessState) {
                                      context.router.pop(context);
                                    }
                                  }, builder: (context, state) {
                                    return AppButton(
                                      title: 'update',
                                      onPressed: () {
                                        _validateForm();
                                      },
                                      foreground: AppColors.white,
                                      background: AppColors.buttonColor,
                                    );
                                  })
                                ])))))));
  }
}
