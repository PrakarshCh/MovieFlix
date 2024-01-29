import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ttn_flix/utilities/App_encryption.dart';
import '../../../../DI/injector.dart';
import '../../../../constants/app_constant.dart';
import '../../../../constants/app_shared_prefrence.dart';
import '../../../../constants/app_string_constant.dart';
import '../state/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());

  void loginIn(Map params) async {
    var sharedInstance = AppInjector.getIt<AppSharedPref>();
    if (params[LoginApiKeys.email] ==
            await sharedInstance.getString(key: AppSharedPrefEnums.email) &&
        params[LoginApiKeys.password] ==
            Encryption.decrypt(
                AppData.encryptKey,
                await sharedInstance.getString(
                    key: AppSharedPrefEnums.password))) {
      sharedInstance.setString(
          key: AppSharedPrefEnums.email, value: params[LoginApiKeys.email]);
      sharedInstance.setString(
          key: AppSharedPrefEnums.password,
          value: Encryption.encrypt(
                  AppData.encryptKey, params[LoginApiKeys.password])
              .base64);
      sharedInstance.setBool(key: AppSharedPrefEnums.loginStatus, value: true);
      emit(LoginSuccessState());
    } else {
      emit(LoginError(AppStrings.incorrectPassword));
    }
  }
}
