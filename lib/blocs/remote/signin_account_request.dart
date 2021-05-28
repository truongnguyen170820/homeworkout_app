
import 'package:homeworkout_app/blocs/base_request.dart';

class SigninAccountRequest extends BaseRequest {
  String phone_number;
  String password;

  SigninAccountRequest(this.phone_number, this.password);

  Map<String, String> toMap() {
    Map<String, String> map = new Map();
    map["Username"] = phone_number;
    map["Password"] = password;
    return map;
  }
}