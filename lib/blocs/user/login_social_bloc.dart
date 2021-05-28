import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:homeworkout_app/blocs/api_service.dart';
import 'package:homeworkout_app/blocs/app_constant.dart';
import 'package:homeworkout_app/blocs/base_response.dart';
import 'package:homeworkout_app/blocs/bloc.dart';
import 'package:homeworkout_app/blocs/remote/api_response.dart';
import 'package:homeworkout_app/model/api_constants.dart';
import 'package:homeworkout_app/model/user/MemberData.dart';
import 'package:homeworkout_app/model/user/login_social_request.dart';
import 'package:homeworkout_app/utils/app_cache.dart';
import 'package:homeworkout_app/view/user/signin_view.dart';
import 'package:rxdart/rxdart.dart';

class LoginSocialBloc implements Bloc {
  Subject _loginSocialSubject = BehaviorSubject<ApiResponse<JDIResponse>>();


  SignInSocialListener _signinAccountImpl;

  setSignInSocialListener(SignInSocialListener listener){
    _signinAccountImpl = listener;
  }



  init(){

    _loginSocialSubject.listen((data) {
      if (data == null || data.status == Status.LOADING) {
//        _signinAccountImpl.onSignInSocialError("Đang gửi login SOcial");
      } else if (data.status == Status.SUCCESS) {
        JDIResponse response = data.data;
        if(response != null) {
//          _signinAccountImpl.onSignInSocialError("Kết quả " + response.ErrorCode);
          if(response.ErrorCode == "000000") {
            List<MemberData> result = response.Data.map((e) => MemberData.fromJson(e)).toList();
            //thiết lập cache thông tin cơ bản của member
            AppCache().setMember(result.first);
            Hive.box(AppConstants.HIVE_USER_BOX)
                .put(AppConstants.HIVE_MEMBER_DATA, jsonEncode(result[0].toJson()));
            _signinAccountImpl.onSignInSocialSuccess(result);
          } else {
            _signinAccountImpl.onSignInSocialError(response.ErrorMessage);
          }
        } else {
          _signinAccountImpl.onSignInSocialError(response.ErrorMessage);
        }
      } else {
        _signinAccountImpl.onSignInSocialError(data.error.errorMessage);
      }
    });
  }


  loginSocial(LoginSocialRequest request){
    ApiService(ApiConstants.LOGIN_SOCIAL,request.toJson(),_loginSocialSubject).execute();
  }


  @override
  void dispose() {
    _loginSocialSubject.close();
  }

}