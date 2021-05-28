import 'dart:io';

import 'package:flutter/material.dart';
import 'package:homeworkout_app/blocs/app_constant.dart';
import 'package:homeworkout_app/blocs/authen_bloc.dart';
import 'package:homeworkout_app/blocs/bloc_impl/signin_account_bloc_impl.dart';
import 'package:homeworkout_app/blocs/user/login_social_bloc.dart';
import 'package:homeworkout_app/model/user/MemberData.dart';
import 'package:homeworkout_app/utils/app_cache.dart';
import 'package:homeworkout_app/utils/app_utils.dart';
import 'package:homeworkout_app/view/main_view.dart';
import 'package:homeworkout_app/view/user/signin_view.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart'
as passwordStore;
import 'package:homeworkout_app/widget/common_appbar.dart';
import 'package:homeworkout_app/widget/custombutton.dart';
import 'package:progress_dialog/progress_dialog.dart';
class  SigninAccountView extends StatefulWidget {
  @override
  _SigninAccountView createState() => _SigninAccountView();
}

class _SigninAccountView extends State<SigninAccountView> with SigninAccountImpl, SignInSocialListener {
  final storage = passwordStore.FlutterSecureStorage();
  final authenBloc = AuthenBloc();
  final _accountController = TextEditingController();
  final _passController = TextEditingController();
  bool rememberMe = false;
  ProgressDialog progressDialog;
  LoginSocialBloc loginSocialBloc;
  bool _isShowPassword = true;
  void _onRememberMeChanged(bool newValue) => setState(() {
    rememberMe = newValue;
  });

  @override
  void initState() {
    progressDialog = ProgressDialog(context);
    authenBloc.onSigninAccountListen(this);
    loginSocialBloc = LoginSocialBloc();
    loginSocialBloc.init();
    loginSocialBloc.setSignInSocialListener(this);
    storage.read(key: AppConstants.KEY_USER_NAME).then((value){
      setState(() {
        if(value!=null&&value.isNotEmpty) rememberMe = true;
        _accountController.text = value;
      });
    });
    storage.read(key: AppConstants.KEY_PASSWORD).then((value){
      setState(() {

        _passController.text = value;
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarDefault(context, ""),
      body: Column(
        children: [
          ButtonCustom(
            title: "DANg nhập",
            onTap: (){
              FocusScope.of(context).requestFocus(new FocusNode());
              if(!rememberMe){
                storage.write(key: AppConstants.KEY_USER_NAME, value: "");
                storage.write(key: AppConstants.KEY_PASSWORD, value: "");
              };
              authenBloc.executeSigninAccount(
                  _accountController.text, _passController.text);
            },
          ),
          ButtonCustom(
            title: "Dăng ký",
            onTap: (){
              // AppUtils.shared
              //     .pushWidget(context, RegisterVerifyMobileView());
            },
          )
        ],
      ),
    );
  }

  @override
  void onSignInSocialError(String message) {
    // TODO: implement onSignInSocialError
  }

  @override
  void onSignInSocialRequesting() {
    // TODO: implement onSignInSocialRequesting
  }

  @override
  void onSignInSocialSuccess(List<MemberData> response) {
    // TODO: implement onSignInSocialSuccess
  }

  @override
  void onSigninAccountError(String message) {
    // TODO: implement onSigninAccountError
  }

  @override
  void onSigninAccountRequesting() async {
    await progressDialog.show();
    // TODO: implement onSigninAccountRequesting
  }

  void onPostSignIn(){
    Future.delayed(Duration(seconds: AppConstants.DIALOG_DURATION))
        .then((value) {
      progressDialog.hide().whenComplete(() {
        // firebaseMessaging.getToken().then((String token) async {
        //   if (token != null) {
        //     final updateTokenBloc = ManageTokenBloc();
        //     await updateTokenBloc.init();
        //     updateTokenBloc.checkTokenSaved(token);
        //   }
        // });
        if((AppCache().memberData.memberInfo.Mobile==null||AppCache().memberData.memberInfo.Mobile.isEmpty)&&Platform.isIOS){
          // AppUtils.shared.pushReplacementWidget(context, CreateAccountView());
          return;
        }
        if((AppCache().memberData.memberInfo.Name==null||AppCache().memberData.memberInfo.Name.isEmpty
            ||AppCache().memberData.memberInfo.Mobile==null||AppCache().memberData.memberInfo.Mobile.isEmpty)&&!Platform.isIOS){
          // AppUtils.shared
          //     .pushReplacementWidget(context, RegisterAddMoreUserInfoView(""));
        }
        else if(AppCache().memberData.myHobbies==null||AppCache().memberData.myHobbies.length==0)
        {
          // AppUtils.shared.pushReplacementWidget(context, RegisterChooseFavouriteView(true));
        }
        else if (AppCache().memberData.listMyFollow == null ||
            AppCache().memberData.listMyFollow.length == 0) {
          // AppUtils.shared
              // .pushReplacementWidget(context, RegisterChooseFollowGroupView());
        } else
          AppUtils.shared.pushReplacementWidget(context, MainViewPage(),
              routeName: "MainScreen");
      });
    });

  }
  @override
  void onSigninAccountSuccess(List<MemberData> response) {
    if (rememberMe) {
      storage.write(
          key: AppConstants.KEY_USER_NAME, value: _accountController.text);
      storage.write(
          key: AppConstants.KEY_PASSWORD, value: _passController.text);
    }
    ;
    onPostSignIn();
    // TODO: implement onSigninAccountSuccess
  }
}
