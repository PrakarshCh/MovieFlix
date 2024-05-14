import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';
import 'package:ttn_flix/DI/injector.dart';
import 'package:ttn_flix/constants/app_constant.dart';
import 'package:ttn_flix/constants/app_shared_prefrence.dart';
import 'package:ttn_flix/screens/account/edit_account/cubit/state/edit_acount_state.dart';
import 'package:ttn_flix/utilities/file_manager.dart';

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

    if (request[LoginApiKeys.image] is Uint8List) {
      final encodedImage = base64Encode(request[LoginApiKeys.image]);
      sharedInstance.setString(
          key: AppSharedPrefEnums.profileImage, value: encodedImage);
    }

    emit(SuccessState());
  }
}
