// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_fitness_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyFitnessInfo _$MyFitnessInfoFromJson(Map<String, dynamic> json) {
  return
    MyFitnessInfo(
      (json['MainAccount'] as num)?.toDouble(),
      json['ExercisePoint'] as int,
      json['DepartmentName'] as String,
      json['TrainerIdStr'] as String,
      json['ProductIdStr'] as String,
      json['ProductName'] as String,
      json['DepartmentIdStr'] as String,
      json['EmployeeIdStr'] as String,
      json['DepartmentLogo'] as String,
      json['DepartmentAddress'] as String,
      json['DepartmentHotLine'] as String,
      json['CustomerIdStr'] as String,
      json['GoneDay'] as int,
      json['empGoneDay'] as int,
      json['empTotalWorkDay'] as int,
      json['AbsentDay'] as int,
      json['empAbsentDay'] as int,
      json['TotalGroupClass'] as num,
      json['TotalPTClass'] as num,
      json['TotalCustomer'] as num,
      json['TotalSession'] as num,
      json['TotalCusConfirm'] as num,
        json['TotalCusAbsent'] as num,
        (json['listMyFitnesses'] as List)
            ?.map((e) => e == null
            ? null
            : MyFitnessInfo.fromJson(e as Map<String, dynamic>))
            ?.toList(),
        (json['lstDepartment'] as List)
            ?.map((e) => e == null
            ? null
            : MyFitnessInfo.fromJson(e as Map<String, dynamic>))
            ?.toList(),
      json['ServiceStatus'] as int,
      json['ServiceStatusName'] as String,
      json['ProductUnitName'] as String,
      json['ProductValue'] as int,
      (json['BeCoin'] as num)?.toDouble(),
      (json['FitCoin'] as num)?.toDouble(),
      (json['ReCoin'] as num)?.toDouble(),
      json['SocialGroupIdStr'] as String,
      double.parse((json['Rate']??"0").toString()),
      json['NoOfRate'] as int,);

}

Map<String, dynamic> _$MyFitnessInfoToJson(MyFitnessInfo instance) =>
    <String, dynamic>{
      'MainAccount': instance.mainAccount,
      'TotalGroupClass': instance.totalGroupClass,
      'TotalPTClass': instance.totalPTClass,
      'TotalCustomer': instance.totalCustomer,
      'TotalSession': instance.totalSession,
      'TotalCusConfirm': instance.totalCusConfirm,
      'TotalCusAbsent': instance.totalCusAbsent,
      'ExercisePoint': instance.exercisePoint,
      'DepartmentName': instance.departmentName,
      'EmployeeIdStr': instance.employeeIdStr,
      'TrainerIdStr': instance.trainerIdStr,
      'ProductName': instance.productName,
      'DepartmentIdStr': instance.departmentIdStr,
      'DepartmentLogo': instance.departmentLogo,
      'ProductIdStr': instance.productIdStr,
      'CustomerIdStr': instance.customerIdStr,
      'GoneDay': instance.goneDay,
      'empGoneDay': instance.empGoneDay,
      'empTotalWorkDay': instance.empTotalWorkDay,
      'AbsentDay': instance.absentDay,
      'empAbsentDay': instance.empAbsentDay,
      // 'listServices': instance.listServices,
      // 'listProducts': instance.listProducts,
      'listMyFitnesses': instance.listMyFitnesses,
      // 'listAppMember': instance.listAppMember,
      // 'myCalendars': instance.myCalendars,
      'lstDepartment': instance.lstDepartment,
      // 'DefaultProduct': instance.defaultProduct,
      // 'groupSummary': instance.groupSummary,
      // 'lstEventLogs': instance.lstEventLogs,
      'IsDefault': instance.isDefault,
      // 'BodyMeasureInfo': instance.lstInfoHealthModel,
      'ServiceStatus': instance.serviceStatus,
      'ServiceStatusName': instance.serviceStatusName,
      'ProductUnitName': instance.productUnitName,
      'ProductValue': instance.productValue,
      'BeCoin': instance.beCoin,
      'FitCoin': instance.fitCoin,
      'ReCoin': instance.reCoin,
      'SocialGroupIdStr': instance.socialGroupIdStr,
      'Rate' : instance.rate,
      'NoOfRate' : instance.noOfRate
    };
