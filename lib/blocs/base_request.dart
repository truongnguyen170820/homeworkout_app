

import 'package:homeworkout_app/blocs/app_constant.dart';
import 'package:homeworkout_app/model/api_constants.dart';

class BaseRequest {

  String token;

  BaseRequest({this.token});

  Map<String, String> toHeaderMap() {
    Map<String, String> map = new Map();
//    map["AppKey"] = "Bearer " + token;
    map["AppKey"] = AppConstants.APP_KEY;
    return map;
  }

//  "content-type →application/json; charset=utf-8
//  AppKey=1234567890abcdef"
}
