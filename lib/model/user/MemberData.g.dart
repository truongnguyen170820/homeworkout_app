// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

part of 'MemberData.dart';

MemberData _$MemberDataFromJson(Map<String, dynamic> json) {
  return MemberData(
    SessionId: json['SessionId'] as String,
    listMyFollow: (json['AllMyFollow'] as List)
        ?.map((e) =>
            e == null ? null : AllMyFollow.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    memberInfo: json['MemberInfo'] == null
        ? null
        : MemberInfo.fromJson(json['MemberInfo'] as Map<String, dynamic>),
    departmentDefaultInfo: json['DepartmentDefaultInfo'] == null
        ? null
        : DepartmentDefaultInfo.fromJson(
            json['DepartmentDefaultInfo'] as Map<String, dynamic>),
    myFitness: (json['listMyFitnesses'] as List)
        ?.map((e) => e == null
            ? null
            : MyFitnessInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    myHobbies: (json['AllMyHobby'] as List)?.map((e) => e as int)?.toList(),
    myGroupsIds: (json['myGroupsIds'] as List)?.map((e) => e as String)?.toList(),
    ptDepartments: (json['lstDepartment'] as List)
        ?.map((e) =>
            e == null ? null : PTDepartment.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$MemberDataToJson(MemberData instance) =>
    <String, dynamic>{
      'SessionId': instance.SessionId,
      'AllMyHobby': instance.myHobbies,
      'MemberInfo': instance.memberInfo,
      'AllMyFollow': instance.listMyFollow,
      'listMyFitnesses': instance.myFitness,
      'DepartmentDefaultInfo': instance.departmentDefaultInfo,
      'lstDepartment': instance.ptDepartments,
      'myGroupsIds':instance.myGroupsIds
    };

AllMyFollow _$AllMyFollowFromJson(Map<String, dynamic> json) {
  return AllMyFollow(
    json['IdStr'] as String,
    json['CoverImage'] as String,
  )
    ..Ico = json['Ico'] as String
    ..Name = json['Name'] as String;
}

Map<String, dynamic> _$AllMyFollowToJson(AllMyFollow instance) =>
    <String, dynamic>{
      'IdStr': instance.IdStr,
      'CoverImage': instance.CoverImage,
      'Ico': instance.Ico,
      'Name': instance.Name,
    };

DepartmentDefaultInfo _$DepartmentDefaultInfoFromJson(
    Map<String, dynamic> json) {
  return DepartmentDefaultInfo(
    DepartmentIdStr: json['DepartmentIdStr'] as String,
  )
    ..Name = json['Name'] as String
    ..Description = json['Description'] as String
    ..Address = json['Address'] as String
    ..MobileNumber = json['MobileNumber'] as String
    ..PhoneNumber = json['PhoneNumber'] as String
    ..Email = json['Email'] as String
    ..Lng = (json['Lng'] as num)?.toDouble()
    ..Lat = (json['Lat'] as num)?.toDouble()
    ..HasTrainerService = json['HasTrainerService'] as bool
    ..FreeParking = json['FreeParking'] as bool
    ..TowelRent = json['TowelRent'] as bool
    ..FreeWater = json['FreeWater'] as bool
    ..IntroductionText = json['IntroductionText'] as String
    ..Website = json['Website'] as String
    ..IsPublic = json['IsPublic'] as bool
    ..ImageList = (json['ImageList'] as List)?.map((e) => e as String)?.toList()
    ..LogoUrl = json['LogoUrl'] as String;
}

Map<String, dynamic> _$DepartmentDefaultInfoToJson(
        DepartmentDefaultInfo instance) =>
    <String, dynamic>{
      'DepartmentIdStr': instance.DepartmentIdStr,
      'Name': instance.Name,
      'Description': instance.Description,
      'Address': instance.Address,
      'MobileNumber': instance.MobileNumber,
      'PhoneNumber': instance.PhoneNumber,
      'Email': instance.Email,
      'Lng': instance.Lng,
      'Lat': instance.Lat,
      'HasTrainerService': instance.HasTrainerService,
      'FreeParking': instance.FreeParking,
      'TowelRent': instance.TowelRent,
      'FreeWater': instance.FreeWater,
      'IntroductionText': instance.IntroductionText,
      'Website': instance.Website,
      'IsPublic': instance.IsPublic,
      'ImageList': instance.ImageList,
      'LogoUrl': instance.LogoUrl,
    };

MemberInfo _$MemberInfoFromJson(Map<String, dynamic> json) {
  return MemberInfo(
    IdStr: json['IdStr'] as String,
  )
    ..CustomerIdStr = json['CustomerIdStr'] as String
    ..Name = json['Name'] as String
    ..Username = json['Username'] as String
    ..Password = json['Password'] as String
    ..Status = json['Status'] as int
    ..MemberType = json['MemberType'] as int
    ..MemberCode = json['MemberCode'] as String
    ..FacebookId = json['FacebookId'] as String
    ..GoogleId = json['GoogleId'] as String
    ..Mobile = json['Mobile'] as String
    ..Email = json['Email'] as String
    ..Address = json['Address'] as String
    ..Sex = json['Sex'] as String
    ..BirthDayStr = json['BirthDayStr'] as String
    ..Note = json['Note'] as String
    ..RegisterDateStr = json['RegisterDateStr'] as String
    ..CustomerCode = json['CustomerCode'] as String
    ..ImageUrl = json['ImageUrl'] as String
    ..SourceType = json['SourceType'] as String
    ..CreatedBy = json['CreatedBy'] as String
    ..CreatedByCode = json['CreatedByCode'] as String
    ..CreatedDateStr = json['CreatedDateStr'] as String
    ..IntroduceByIdStr = json['IntroduceByIdStr'] as String
    ..JobCode = json['JobCode'] as String
    ..NationCode = json['NationCode'] as String
    ..ProvinceCode = json['ProvinceCode'] as String
    ..DistrictCode = json['DistrictCode'] as String
    ..CommuneCode = json['CommuneCode'] as String
    ..IDNo = json['IDNo'] as String
    ..IDFrom = json['IDFrom'] as String
    ..IDDateStr = json['IDDateStr'] as String
    ..AuthenType = json['AuthenType'] as int
    ..BackgroundImageUrl = json['BackgroundImageUrl'] as String;
}

Map<String, dynamic> _$MemberInfoToJson(MemberInfo instance) =>
    <String, dynamic>{
      'IdStr': instance.IdStr,
      'CustomerIdStr': instance.CustomerIdStr,
      'Name': instance.Name,
      'Username': instance.Username,
      'Password': instance.Password,
      'Status': instance.Status,
      'MemberType': instance.MemberType,
      'MemberCode': instance.MemberCode,
      'FacebookId': instance.FacebookId,
      'GoogleId': instance.GoogleId,
      'Mobile': instance.Mobile,
      'Email': instance.Email,
      'Address': instance.Address,
      'Sex': instance.Sex,
      'BirthDayStr': instance.BirthDayStr,
      'Note': instance.Note,
      'RegisterDateStr': instance.RegisterDateStr,
      'CustomerCode': instance.CustomerCode,
      'ImageUrl': instance.ImageUrl,
      'SourceType': instance.SourceType,
      'CreatedBy': instance.CreatedBy,
      'CreatedByCode': instance.CreatedByCode,
      'CreatedDateStr': instance.CreatedDateStr,
      'IntroduceByIdStr': instance.IntroduceByIdStr,
      'JobCode': instance.JobCode,
      'NationCode': instance.NationCode,
      'ProvinceCode': instance.ProvinceCode,
      'DistrictCode': instance.DistrictCode,
      'CommuneCode': instance.CommuneCode,
      'IDNo': instance.IDNo,
      'IDFrom': instance.IDFrom,
      'IDDateStr': instance.IDDateStr,
      'AuthenType': instance.AuthenType,
      'BackgroundImageUrl': instance.BackgroundImageUrl,
    };
