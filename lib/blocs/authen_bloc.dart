import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:homeworkout_app/blocs/api_service.dart';
import 'package:homeworkout_app/blocs/app_constant.dart';
import 'package:homeworkout_app/blocs/base_response.dart';
import 'package:homeworkout_app/blocs/bloc_impl/signin_account_bloc_impl.dart';
import 'package:homeworkout_app/blocs/remote/api_response.dart';
import 'package:homeworkout_app/blocs/remote/signin_account_request.dart';
import 'package:homeworkout_app/model/api_constants.dart';
import 'package:homeworkout_app/model/user/MemberData.dart';
import 'package:homeworkout_app/utils/app_cache.dart';
import 'package:rxdart/subjects.dart';

import 'bloc.dart';

class AuthenBloc implements Bloc  {

  SigninAccountImpl _signinAccountImpl;
  final _subjectSigninAccount =  BehaviorSubject<ApiResponse<JDIResponse>>();
  final _subjectAuthenData = BehaviorSubject<ApiResponse<MemberData>>();

  executeSigninAccount(String account, String pass) {
    final request = SigninAccountRequest(account, pass);
    ApiService(ApiConstants.SIGNIN_ACCOUNT, request.toMap(),_subjectSigninAccount).execute();
  }

  BehaviorSubject<ApiResponse<MemberData>> get subjectAuthenData => _subjectAuthenData;

  void onSigninAccountListen(SigninAccountImpl impl) {
    _signinAccountImpl = impl;
    _subjectSigninAccount.listen((data) {
      if (data == null || data.status == Status.LOADING) {
        _signinAccountImpl.onSigninAccountRequesting();
      } else if (data.status == Status.SUCCESS) {
        JDIResponse response = data.data;
        if(response != null) {
          if(response.ErrorCode == "000000") {
            List<MemberData> result = response.Data.map((e) => MemberData.fromJson(e)).toList();
            //thiết lập cache thông tin cơ bản của member
            if(result.first.ptDepartments==null) result.first.ptDepartments = List();
            AppCache().setMember(result.first);
            Hive.box(AppConstants.HIVE_USER_BOX)
                .put(AppConstants.HIVE_MEMBER_DATA, jsonEncode(result[0].toJson()));
           final data =Hive.box(AppConstants.HIVE_USER_BOX).get(AppConstants.HIVE_MEMBER_DATA);
            _signinAccountImpl.onSigninAccountSuccess(result);
          } else {
            _signinAccountImpl.onSigninAccountError(response.ErrorMessage);
          }
        } else {
          _signinAccountImpl.onSigninAccountError(response.ErrorMessage);
        }
      } else {
        _signinAccountImpl.onSigninAccountError(data.error.errorMessage);
      }
    });
  }

  loadData() async {
    final data = Hive.box(AppConstants.HIVE_USER_BOX).get(AppConstants.HIVE_MEMBER_DATA);
    if(data == null) {
      _subjectAuthenData.sink.add(ApiResponse<MemberData>(Status.SUCCESS, null, null));
      return;
    } else {
      final memberData = MemberData.fromJson(jsonDecode(data));
      AppCache().setMember(memberData);
      _subjectAuthenData.sink.add(ApiResponse<MemberData>(Status.SUCCESS, memberData, null));
      return;
    }
  }

  @override
  void dispose() {
    _subjectAuthenData.close();
    _subjectSigninAccount.close();
  }


}