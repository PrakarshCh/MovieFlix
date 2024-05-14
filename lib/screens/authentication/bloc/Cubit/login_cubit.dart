import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ttn_flix/DI/injector.dart';
import 'package:ttn_flix/constants/app_constant.dart';
import 'package:ttn_flix/constants/app_shared_prefrence.dart';
import 'package:ttn_flix/screens/authentication/bloc/state/login_state.dart';
import 'package:ttn_flix/utilities/App_encryption.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());

  void loginIn(Map params) async {
    var sharedInstance = AppInjector.getIt<AppSharedPref>();
    if (params[LoginApiKeys.email] ==
            sharedInstance.getString(key: AppSharedPrefEnums.email) &&
        params[LoginApiKeys.password] ==
            Encryption.decrypt(AppData.encryptKey,
                sharedInstance.getString(key: AppSharedPrefEnums.password))) {
      sharedInstance.setString(
          key: AppSharedPrefEnums.email, value: params[LoginApiKeys.email]);
      sharedInstance.setString(
          key: AppSharedPrefEnums.password,
          value: Encryption.encrypt(
                  AppData.encryptKey, params[LoginApiKeys.password])
              .base64);
      sharedInstance.setInt(
          key: AppSharedPrefEnums.timeStamp,
          value: DateTime.now().millisecondsSinceEpoch);
      sharedInstance.setBool(key: AppSharedPrefEnums.loginStatus, value: true);
      //emit(LoginSuccessState());
    } else {
      //emit(LoginError(AppStrings.incorrectPassword));
    }
  }

  Future<User?> signInUsingEmailPassword({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
      emit(LoginSuccessState());
    } on FirebaseAuthException catch (e) {
      emit(LoginError(e.code));
    }
    return user;
  }
}
