
import 'package:homeworkout_app/model/user/MemberData.dart';

abstract class SigninAccountImpl {
  void onSigninAccountRequesting();
  void onSigninAccountSuccess(List<MemberData> response);
  void onSigninAccountError(String message);
}