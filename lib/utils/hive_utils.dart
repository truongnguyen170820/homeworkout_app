import 'dart:convert';
import 'package:homeworkout_app/blocs/app_constant.dart';
import 'package:homeworkout_app/main.dart';
import 'package:homeworkout_app/model/user/MemberData.dart';
import 'package:homeworkout_app/model/user/department_info.dart';

class HiveUtils {
  static HiveUtils shared = HiveUtils();

  MemberData getMemberData() {
    final data = userBox.get(AppConstants.HIVE_MEMBER_DATA);
    if(data == null)
      return MemberData();
    final memberData = MemberData.fromJson(jsonDecode(data));
    return memberData;
  }

  CommonDepartmentInfo getCurrentDept() {
    final data = userBox.get(AppConstants.HIVE_CURRENT_DEPT_DATA);
    if(data == null)
      return null;
    final deptInfo = CommonDepartmentInfo.fromJson(jsonDecode(data));
    return deptInfo;
  }

  CommonDepartmentInfo removeCurrentDept() {
     userBox.delete(AppConstants.HIVE_CURRENT_DEPT_DATA);
  }

  saveCurrentDept(CommonDepartmentInfo info) {
    userBox.put(AppConstants.HIVE_CURRENT_DEPT_DATA,jsonEncode(info.toJson()));
  }

  updateMemberData(MemberData memberData){
    userBox.put(AppConstants.HIVE_MEMBER_DATA,jsonEncode(memberData.toJson()));
  }


}