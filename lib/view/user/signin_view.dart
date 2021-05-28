import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:homeworkout_app/blocs/user/login_social_bloc.dart';
import 'package:homeworkout_app/model/user/MemberData.dart';
import 'package:homeworkout_app/model/user/department_info.dart';
import 'package:homeworkout_app/utils/app_utils.dart';
import 'package:homeworkout_app/utils/color_utils.dart';
import 'package:homeworkout_app/utils/hive_utils.dart';
import 'package:homeworkout_app/view/main_view.dart';
import 'package:homeworkout_app/view/user/signin_account_view.dart';
import 'package:homeworkout_app/widget/custombutton.dart';
import 'package:progress_dialog/progress_dialog.dart';

class SigninView extends StatefulWidget {
  final hasRemember;

  const SigninView({Key key, this.hasRemember}) : super(key: key);
  @override
  _SigninViewState createState() => _SigninViewState();
}
abstract class SignInSocialListener {
  void onSignInSocialRequesting();
  void onSignInSocialSuccess(List<MemberData> response);
  void onSignInSocialError(String message);
}
class _SigninViewState extends State<SigninView> implements SignInSocialListener {
  LoginSocialBloc loginSocialBloc;
  CommonDepartmentInfo currentDeptInfo;
  ProgressDialog progressDialog;
  bool _isConnectedFitness = false;
  @override
  void initState() {
    // if(widget.hasRemember) SchedulerBinding.instance.addPostFrameCallback((_) {
    //   AppUtils.shared.pushReplacementWidget(context, MainViewPage(),routeName: "MainScreen");
    //   return;
    // });
    loginSocialBloc = LoginSocialBloc();
    loginSocialBloc.init();
    loginSocialBloc.setSignInSocialListener(this);
    progressDialog = ProgressDialog(context);

    currentDeptInfo = HiveUtils.shared.getCurrentDept();
    if(currentDeptInfo!=null){
      _isConnectedFitness = true;
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 200),
          ButtonCustom(
            bgColor: ColorUtils.blueAccent,
            title: "ĐĂng nhÂPK",
            onTap: (){
              AppUtils.shared.pushReplacementWidget(
                  context, SigninAccountView());
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
}
