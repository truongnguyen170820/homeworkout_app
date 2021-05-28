import 'dart:async';

import 'package:homeworkout_app/blocs/app_constant.dart';
import 'package:homeworkout_app/model/fitnet/my_fitness_info.dart';
import 'package:homeworkout_app/model/fitnet/pt_fitness_model.dart';
import 'package:homeworkout_app/model/user/MemberData.dart';
import 'package:homeworkout_app/model/user/department_info.dart';
import 'package:homeworkout_app/utils/hive_utils.dart';


class AppCache{
  static AppCache _instance ;
  // ignore: close_sinks
  StreamController<String> deptStreamCtrl = StreamController.broadcast();
  get getDepStream => deptStreamCtrl.stream;

  factory AppCache() => _instance ??= new AppCache._();
  AppCache._();

  MemberData memberData;
  MemberData getMember()
  {
    return memberData;
  }
  void setMember(MemberData _member) {this.memberData = _member;}

  getDefaultDepartmentId(){
    if(memberData.memberInfo.MemberType== AppConstants.MEMBER_TYPE_MEMBER||memberData.memberInfo.MemberType== AppConstants.MEMBER_TYPE_OWNER||memberData.memberInfo.MemberType== AppConstants.MEMBER_TYPE_EMPLOYEE){
      if(memberData!=null &&memberData.myFitness!=null &&memberData.myFitness.length>0){
        var lstDept = memberData.myFitness.where((element) => element.isDefault??false).toList();
        if(lstDept.length>0) return lstDept.first.departmentIdStr;
      }
      return null;
    }else {
      if(memberData.ptDepartments==null) return null;
      var lstDept = memberData.ptDepartments.where((element) => element.isDefault??false).toList();
      if(lstDept.length>0) return lstDept.first.departmentIdStr;
      return null;
    }
  }

  getEmployeeId(){
    if(memberData.memberInfo.MemberType== AppConstants.MEMBER_TYPE_MEMBER||memberData.memberInfo.MemberType== AppConstants.MEMBER_TYPE_OWNER||memberData.memberInfo.MemberType== AppConstants.MEMBER_TYPE_EMPLOYEE){
      if(memberData!=null &&memberData.myFitness!=null &&memberData.myFitness.length>0){
        var lstDept = memberData.myFitness.where((element) => element.isDefault??false).toList();
        if(lstDept.length>0) return lstDept.first.employeeIdStr;
      }

    }
    return "";
  }

  getConnectedDept(){
    if(memberData.memberInfo.MemberType== AppConstants.MEMBER_TYPE_MEMBER||memberData.memberInfo.MemberType== AppConstants.MEMBER_TYPE_OWNER||memberData.memberInfo.MemberType== AppConstants.MEMBER_TYPE_EMPLOYEE){
      if(memberData!=null &&memberData.myFitness!=null &&memberData.myFitness.length>0){
        var lstDept = memberData.myFitness.where((element) => element.isDefault??false).toList();
        if(lstDept.length>0) return lstDept.first;
      }
      return null;
    }else {
      if(memberData.ptDepartments==null) return null;
      var lstDept = memberData.ptDepartments.where((element) => element.isDefault??false).toList();
      if(lstDept.length>0) return lstDept.first;
      return null;
    }
  }

  getDeptName(){
    if(memberData.memberInfo.MemberType== AppConstants.MEMBER_TYPE_MEMBER||memberData.memberInfo.MemberType== AppConstants.MEMBER_TYPE_OWNER||memberData.memberInfo.MemberType== AppConstants.MEMBER_TYPE_EMPLOYEE){
    if(memberData!=null &&memberData.myFitness!=null &&memberData.myFitness.length>0)
     {
       var lstDept = memberData.myFitness.where((element) => element.isDefault??false).toList();
       if(lstDept.length>0) return lstDept.first.departmentName??'';
     }
    } else if(memberData.ptDepartments!=null){
      var lstDept = memberData.ptDepartments.where((element) => element.isDefault??false).toList();
      if(lstDept.length>0) return lstDept.first.departmentName??'';
    }
    return "Belife";
  }

  getCustomerId(){
    if(memberData.memberInfo.MemberType== AppConstants.MEMBER_TYPE_MEMBER){
      if(memberData!=null &&memberData.myFitness!=null &&memberData.myFitness.length>0){
        var lstDept = memberData.myFitness.where((element) => element.isDefault??false).toList();
        if(lstDept.length>0) return lstDept.first.customerIdStr;
      }

      return "";
    }
    return "";
  }

  getMemberType() => memberData.memberInfo.MemberType;

  joinedMember() {
    return AppCache().getDefaultDepartmentId()!=null
          &&AppCache().getDefaultDepartmentId()!=AppConstants.ID_EMPTY;
  }


  getDefaultGroup(){
    if(memberData.memberInfo.MemberType== AppConstants.MEMBER_TYPE_MEMBER||memberData.memberInfo.MemberType== AppConstants.MEMBER_TYPE_OWNER||memberData.memberInfo.MemberType== AppConstants.MEMBER_TYPE_EMPLOYEE){
      if(memberData!=null &&memberData.myFitness!=null &&memberData.myFitness.length>0) {
        var lstDept = memberData.myFitness.where((element) => element.isDefault??false).toList();
        if(lstDept.length>0&&lstDept.first.socialGroupIdStr!=null&&lstDept.first.socialGroupIdStr.isNotEmpty&& lstDept.first.socialGroupIdStr!=AppConstants.ID_EMPTY) return lstDept.first.socialGroupIdStr;
        if(memberData.listMyFollow.length>0) return memberData.listMyFollow.first.IdStr;

      }
     return null;
    } else {
      var lstDept = memberData.ptDepartments.where((element) => element.isDefault??false).toList();
      if(lstDept.length>0&&lstDept.first.socialGroupIdStr!=null&&lstDept.first.socialGroupIdStr.isNotEmpty && lstDept.first.socialGroupIdStr!=AppConstants.ID_EMPTY) return lstDept.first.socialGroupIdStr;
      if(memberData.ptDepartments.length>0) return memberData.listMyFollow.first.IdStr;
    }

  }

  changeDefaultDept(String deptId) {
    if (memberData.memberInfo.MemberType == AppConstants.MEMBER_TYPE_MEMBER ||memberData.memberInfo.MemberType == AppConstants.MEMBER_TYPE_OWNER||memberData.memberInfo.MemberType == AppConstants.MEMBER_TYPE_EMPLOYEE) {
      if (deptId == null || deptId.isEmpty) {
        //reset current dept
        var activeDept = memberData.myFitness
            .where((element) => element.isDefault ?? false)
            ?.first;
        if (activeDept != null) activeDept.isDefault = false;
        deptStreamCtrl.sink.add("");
        HiveUtils.shared.removeCurrentDept();
      } else {
        var selectedDept = memberData.myFitness
            .where((element) => element.departmentIdStr == deptId)
            ?.first;
        if (selectedDept == null) {
          return;
        } else if (selectedDept != null && selectedDept.isDefault) {
          deptStreamCtrl.sink.add(selectedDept.departmentIdStr);
          return;
        } else {
          MyFitnessInfo activeDept;
          var lstActive = memberData.myFitness.where((element) =>
          element.isDefault ?? false);
          if (lstActive != null && lstActive.length > 0)
            activeDept = lstActive.first;
          if (activeDept != null) activeDept.isDefault = false;
          selectedDept.isDefault = true;
          deptStreamCtrl.sink.add(selectedDept.departmentIdStr);
        }
        HiveUtils.shared.saveCurrentDept(CommonDepartmentInfo(selectedDept.departmentName,selectedDept.departmentIdStr,selectedDept.departmentLogo??"",selectedDept.departmentAddress??"",selectedDept.departmentHotline??""));
      }
    } else {
      if (deptId == null || deptId.isEmpty) {
        //reset current dept
        var activeDept = memberData.ptDepartments
            .where((element) => element.isDefault ?? false)
            ?.first;
        if (activeDept != null) activeDept.isDefault = false;
        deptStreamCtrl.sink.add("");
        HiveUtils.shared.removeCurrentDept();
      } else {
        var selectedDept = memberData.ptDepartments
            .where((element) => element.departmentIdStr == deptId)
            ?.first;
        if (selectedDept == null) {
          return;
        } else if (selectedDept != null && selectedDept.isDefault) {
          deptStreamCtrl.sink.add(selectedDept.departmentIdStr);
          return;
        } else {
          PTDepartment activeDept;
          var lstActive = memberData.ptDepartments.where((element) =>
          element.isDefault ?? false);
          if (lstActive != null && lstActive.length > 0)
            activeDept = lstActive.first;
          if (activeDept != null) activeDept.isDefault = false;
          selectedDept.isDefault = true;
          deptStreamCtrl.sink.add(selectedDept.departmentIdStr);
          HiveUtils.shared.saveCurrentDept(CommonDepartmentInfo(selectedDept.departmentName,selectedDept.departmentIdStr,selectedDept.departmentLogo??"",selectedDept.departmentAddress??"",selectedDept.departmentHotline??""));
        }
      }
    }
  }
}