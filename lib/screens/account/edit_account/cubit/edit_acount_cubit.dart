import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';
import 'package:ttn_flix/screens/account/edit_account/cubit/state/edit_acount_state.dart';

import '../../../../DI/injector.dart';
import '../../../../constants/app_constant.dart';
import '../../../../constants/app_shared_prefrence.dart';
import '../../../../utilities/file_manager.dart';

class EditAccountCubit extends Cubit<EditAccountState> {
  EditAccountCubit() : super(InitialState());

  void update(Map request) async {
    var sharedInstance = AppInjector.getIt<AppSharedPref>();
    sharedInstance.setString(
        key: AppSharedPrefEnums.fullName, value: request[LoginApiKeys.name]);
    sharedInstance.setString(
        key: AppSharedPrefEnums.gender, value: request[LoginApiKeys.gender]);
    sharedInstance.setString(
        key: AppSharedPrefEnums.dob, value: request[LoginApiKeys.dob]);
    if (request[LoginApiKeys.image] is File) {
      FileManager fileManager = AppInjector.getIt<FileManager>();
      var path = await fileManager.saveFile(request[LoginApiKeys.image]);
      sharedInstance.setString(
          key: AppSharedPrefEnums.profileImage, value: basename(path.path));
    }
    emit(SuccessState());
  }
}
