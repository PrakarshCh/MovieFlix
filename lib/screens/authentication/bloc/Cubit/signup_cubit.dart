import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';
import 'package:ttn_flix/utilities/App_encryption.dart';
import '../../../../DI/injector.dart';
import '../../../../constants/app_constant.dart';
import '../../../../constants/app_shared_prefrence.dart';
import '../../../../utilities/file_manager.dart';
import '../state/signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitialState());

  void signup(Map request) async {
    var sharedInstance = AppInjector.getIt<AppSharedPref>();
    sharedInstance.setString(
        key: AppSharedPrefEnums.fullName, value: request[LoginApiKeys.name]);
    sharedInstance.setString(
        key: AppSharedPrefEnums.gender, value: request[LoginApiKeys.gender]);
    sharedInstance.setString(
        key: AppSharedPrefEnums.dob, value: request[LoginApiKeys.dob]);
    sharedInstance.setString(
        key: AppSharedPrefEnums.email, value: request[LoginApiKeys.email]);
    sharedInstance.setString(
        key: AppSharedPrefEnums.password,
        value: Encryption.encrypt(
                AppData.encryptKey, request[LoginApiKeys.password])
            .base64);
    if (request[LoginApiKeys.image] is File) {
      FileManager fileManager = AppInjector.getIt<FileManager>();
      var path = await fileManager.saveFile(request[LoginApiKeys.image]);
      sharedInstance.setString(
          key: AppSharedPrefEnums.profileImage, value: basename(path.path));
    }
    sharedInstance.setBool(key: AppSharedPrefEnums.loginStatus, value: true);
    emit(SignupSuccessState());
  }
}
