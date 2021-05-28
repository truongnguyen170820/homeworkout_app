

import 'package:homeworkout_app/model/fitnet/my_fitness_info.dart';
import 'package:homeworkout_app/model/fitnet/pt_fitness_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'MemberData.g.dart';
@JsonSerializable()
class MemberData {
  String SessionId;
  @JsonKey(name: 'AllMyHobby')
  List<int> myHobbies;
  @JsonKey(name: 'MemberInfo')
  MemberInfo memberInfo;
  @JsonKey(name: 'AllMyFollow')
  List<AllMyFollow> listMyFollow=[];
  @JsonKey(name: 'listMyFitnesses')
  List<MyFitnessInfo> myFitness=[];
  @JsonKey(name: 'DepartmentDefaultInfo')
  DepartmentDefaultInfo departmentDefaultInfo;
  @JsonKey(name: 'lstDepartment')
  List<PTDepartment> ptDepartments=[];
  @JsonKey(name: 'myGroupsIds')
  List<String> myGroupsIds=[];

//  DepartmentDefaultInfo departmentDefaultInfo;
 // MemberInfo memberInfo;
 // AllMyFitness myFitness;

  MemberData({this.SessionId,this.myGroupsIds, this.listMyFollow, this.memberInfo,
    this.departmentDefaultInfo, this.myFitness, this.myHobbies,this.ptDepartments});

  factory MemberData.fromJson(Map<String, dynamic> json) => _$MemberDataFromJson(json);
  Map<String, dynamic> toJson() => _$MemberDataToJson(this);
}

@JsonSerializable()
class AllMyFollow {
  String _id;
  String IdStr;
  String CoverImage;
  String Ico;
  String Name;

  AllMyFollow(this.IdStr, this.CoverImage);

  factory AllMyFollow.fromJson(Map<String, dynamic> json) => _$AllMyFollowFromJson(json);
  Map<String, dynamic> toJson() => _$AllMyFollowToJson(this);

//  3 = {map entry} "Description" -> null
//  4 = {map entry} "Email" -> null
//  6 = {map entry} "MemberCount" -> 34
//  7 = {map entry} "MemberRequest" -> 0
//  8 = {map entry} "HobbyType" -> 1
//  9 = {map entry} "Type" -> 1
//  11 = {map entry} "ParentIdStr" -> "000000000000000000000000"
//  12 = {map entry} "Privacy" -> null
//  13 = {map entry} "IsFollowed" -> false
}
@JsonSerializable()
class DepartmentDefaultInfo {
  String DepartmentIdStr;
  String Name;
  String Description;
  String Address;
  String MobileNumber;
  String PhoneNumber;
  String Email;
  double Lng;
  double Lat;
  bool HasTrainerService;
  bool FreeParking;
  bool TowelRent;
  bool FreeWater;
  String IntroductionText;
  String Website;
  bool IsPublic;
  List<String> ImageList;
  String LogoUrl;
  DepartmentDefaultInfo({this.DepartmentIdStr});

  factory DepartmentDefaultInfo.fromJson(Map<String, dynamic> json) => _$DepartmentDefaultInfoFromJson(json);
  Map<String, dynamic> toJson() => _$DepartmentDefaultInfoToJson(this);
}
@JsonSerializable()
class MemberInfo {
  String IdStr;
  String CustomerIdStr;
  String Name;
  String Username;
  String Password;
  int Status;
  int MemberType; //PT or Member
  String MemberCode;
  String FacebookId;
  String GoogleId;
  String Mobile;
  String Email;
  String Address;
  String Sex;
  String BirthDayStr;
  String Note;
  String RegisterDateStr;
  String CustomerCode;
  String ImageUrl;
  String SourceType;
  String CreatedBy;
  String CreatedByCode;
  String CreatedDateStr;
  String IntroduceByIdStr;
  String JobCode;
  String NationCode;
  String ProvinceCode;
  String DistrictCode;
  String CommuneCode;
  String IDNo;
  String IDFrom;
  String IDDateStr;
  int AuthenType;
  String BackgroundImageUrl;

  MemberInfo({this.IdStr});

  factory MemberInfo.fromJson(Map<String, dynamic> json) => _$MemberInfoFromJson(json);
  Map<String, dynamic> toJson() => _$MemberInfoToJson(this);
}
//@JsonSerializable()
//class AllMyFitness {
//  String IdStr;
//  String MemberIdStr;
//  String DepartmentIdStr;
//  String DepartmentName;
//  int ExcersicePoint;
//  bool IsDefault;
//  String DomainIdStr;
//
//  AllMyFitness({this.IdStr});
//
//  factory AllMyFitness.fromJson(Map<String, dynamic> json) => _$AllMyFitnessFromJson(json);
//  Map<String, dynamic> toJson() => _$AllMyFitnessToJson(this);
//}