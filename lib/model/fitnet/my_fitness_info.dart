
import 'package:json_annotation/json_annotation.dart';


part 'my_fitness_info.g.dart';

@JsonSerializable()
class MyFitnessInfo {
  @JsonKey(name: "MainAccount")
  double mainAccount=0;
  @JsonKey(name: "TotalGroupClass")
  num totalGroupClass=0;
  @JsonKey(name: "TotalPTClass")
  num totalPTClass=0;
  @JsonKey(name: "TotalCustomer")
  num totalCustomer=0;
  @JsonKey(name: "TotalSession")
  num totalSession=0;
  @JsonKey(name: "TotalCusConfirm")
  num totalCusConfirm=0;
  @JsonKey(name: "TotalCusAbsent")
  num totalCusAbsent=0;
  @JsonKey(name: "ExercisePoint")
  int exercisePoint=0;
  @JsonKey(name: "DepartmentName")
  String departmentName;
  @JsonKey(name: "EmployeeIdStr")
  String employeeIdStr;
  @JsonKey(name: "TrainerIdStr")
  String trainerIdStr;
  @JsonKey(name: "ProductName")
  String productName;
  @JsonKey(name: "DepartmentIdStr")
  String departmentIdStr;
  @JsonKey(name: "DepartmentLogo")
  String departmentLogo;
  @JsonKey(name: "DepartmentAddress")
  String departmentAddress;
  @JsonKey(name: "DepartmentHotLine")
  String departmentHotline;
  @JsonKey(name: "ProductIdStr")
  String productIdStr;
  @JsonKey(name: "CustomerIdStr")
  String customerIdStr;
  @JsonKey(name: "GoneDay")
  int goneDay=0;
  @JsonKey(name: "empGoneDay")
  int empGoneDay=0;
  @JsonKey(name: "empTotalWorkDay")
  int empTotalWorkDay=0;
  @JsonKey(name: "AbsentDay")
  int absentDay=0;
  @JsonKey(name: "empAbsentDay")
  int empAbsentDay=0;
  // @JsonKey(name: "listServices")
  // List<ServiceInfo> listServices = null;
  // @JsonKey(name: "listProducts")
  // List<ProductInfo> listProducts = null;
  @JsonKey(name: "listMyFitnesses")
  List<MyFitnessInfo> listMyFitnesses = null;
  // @JsonKey(name: "listAppMember")
  // List<ListAppMember> listAppMember = null;
  // @JsonKey(name: "myCalendars")
  // List<MyCalendars> myCalendars = null;
  @JsonKey(name: "lstDepartment")
  List<MyFitnessInfo> lstDepartment;
  // @JsonKey(name: "DefaultProduct")
  // ProductInfo defaultProduct;
  // @JsonKey(name: "groupSummary")
  // GroupSummary groupSummary;
  // @JsonKey(name: "lstEventLogs")
  // List<LstEventLogs> lstEventLogs;
  @JsonKey(name: "IsDefault") bool isDefault;
  // @JsonKey(name: "BodyMeasureInfo")
  // List<InfoHealthModel> lstInfoHealthModel;

  @JsonKey(name: "ServiceStatus")
  int serviceStatus;
  @JsonKey(name: "ServiceStatusName")
  String serviceStatusName;
  @JsonKey(name: "ProductUnitName")
  String productUnitName;
  @JsonKey(name: "ProductValue")
  int productValue;
  @JsonKey(name: "BeCoin")
  double beCoin;
  @JsonKey(name: "FitCoin")
  double fitCoin;
  @JsonKey(name: "ReCoin")
  double reCoin;
  @JsonKey(name: "SocialGroupIdStr")
  String socialGroupIdStr;
  @JsonKey(name: "Rate")
  double rate=0;
  @JsonKey(name: "NoOfRate")
  int noOfRate;

  MyFitnessInfo.fromDeptName(this.departmentName, this.departmentIdStr);

  MyFitnessInfo.empty();

  MyFitnessInfo(
      this.mainAccount,
      this.exercisePoint,
      this.departmentName,
      this.trainerIdStr,
      this.productIdStr,
      this.productName,
      this.departmentIdStr,
      this.employeeIdStr,
      this.departmentLogo,
      this.departmentAddress,
      this.departmentHotline,
      this.customerIdStr,
      this.goneDay,
      this.empGoneDay,
      this.empTotalWorkDay,
      this.absentDay,
      this.empAbsentDay,
      this.totalGroupClass,
      this.totalPTClass,
      this.totalCustomer,
      this.totalSession,
      this.totalCusConfirm,
      this.totalCusAbsent,
      // this.listServices,
      // this.listProducts,
      this.listMyFitnesses,
      // this.listAppMember,
      // this.myCalendars,
      this.lstDepartment,
      // this.defaultProduct,
      // this.groupSummary,
      // this.lstEventLogs,
      // this.isDefault,this.lstInfoHealthModel,
      this.serviceStatus,
      this.serviceStatusName,
      this.productUnitName,
      this.productValue,
      this.beCoin,
      this.fitCoin,
      this.reCoin,
      this.socialGroupIdStr,
      this.rate,
      this.noOfRate);

  factory MyFitnessInfo.fromJson(Map<String, dynamic> json) =>
      _$MyFitnessInfoFromJson(json);

  Map<String, dynamic> toJson() => _$MyFitnessInfoToJson(this);
}
