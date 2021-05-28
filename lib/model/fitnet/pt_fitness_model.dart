
class MyCalendars {
  String pTReisterIdStr;
  String pTGroupIdStr;
  bool isHasScheduler;
  String classIdStr;
  bool isPTClass;
  bool isPTGroupClass;
  bool isClass;
  int dayOfWeek;
  int day;
  String date;
  getEventDate() {
    return DateTime.parse(date);
  }

  MyCalendars(
      {this.pTReisterIdStr,
        this.pTGroupIdStr,
        this.classIdStr,
        this.isPTClass,
        this.isPTGroupClass,
        this.isClass,
        this.dayOfWeek,
        this.day,
        this.isHasScheduler,
        this.date});

  MyCalendars.fromJson(Map<String, dynamic> json) {
    pTReisterIdStr = json['PTReisterIdStr'];
    pTGroupIdStr = json['PTGroupIdStr'];
    classIdStr = json['ClassIdStr'];
    isPTClass = json['IsPTClass'];
    isPTGroupClass = json['IsPTGroupClass'];
    isClass = json['IsClass'];
    dayOfWeek = json['DayOfWeek'];
    isHasScheduler = json['IsHasScheduler'];
    day = json['Day'];
    date = json['Date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['PTReisterIdStr'] = this.pTReisterIdStr;
    data['PTGroupIdStr'] = this.pTGroupIdStr;
    data['ClassIdStr'] = this.classIdStr;
    data['IsPTClass'] = this.isPTClass;
    data['IsPTGroupClass'] = this.isPTGroupClass;
    data['IsClass'] = this.isClass;
    data['IsHasScheduler'] = this.isHasScheduler;
    data['DayOfWeek'] = this.dayOfWeek;
    data['Day'] = this.day;
    data['Date'] = this.date;
    return data;
  }
}
class PTDepartment {
  String name;
  String memberIdStr;
  String trainerIdStr;
  String departmentIdStr;
  String departmentLogo;
  String departmentAddress;
  String departmentHotline;
  String departmentName;
  String registeredDate;
  String registeredDateStr;
  String createdDate;
  String createdDateStr;
  String modifiedTime;
  String modifiedTimeStr;
  Null leftDate;
  String leftDateStr;
  bool isDeleted;
  Null deletedIdStr;
  Null deletedDate;
  String deletedDateStr;
  Null createdBy;
  Null deletedBy;
  Null createdByIdStr;
  bool isTeaching;
  bool isDefault;
  String sId;
  String domainId;
  String idStr;
  String domainIdStr;
  String socialGroupIdStr;
  PTDepartment.fromDeptName(this.departmentName,this.departmentIdStr);

  PTDepartment(
      {this.name,
        this.memberIdStr,
        this.trainerIdStr,
        this.departmentIdStr,
        this.departmentName,
        this.registeredDate,
        this.departmentLogo,
        this.departmentAddress,
        this.departmentHotline,
        this.registeredDateStr,
        this.createdDate,
        this.createdDateStr,
        this.modifiedTime,
        this.modifiedTimeStr,
        this.leftDate,
        this.leftDateStr,
        this.isDeleted,
        this.deletedIdStr,
        this.deletedDate,
        this.deletedDateStr,
        this.createdBy,
        this.deletedBy,
        this.createdByIdStr,
        this.isTeaching,
        this.isDefault,
        this.sId,
        this.domainId,
        this.idStr,
        this.domainIdStr,
        this.socialGroupIdStr});

  PTDepartment.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    memberIdStr = json['MemberIdStr'];
    trainerIdStr = json['TrainerIdStr'];
    departmentIdStr = json['DepartmentIdStr'];
    departmentLogo = json['DepartmentLogo'];
    departmentHotline = json['DepartmentHotLine'];
    departmentAddress = json['DepartmentAddress'];
    departmentName = json['DepartmentName'];
    registeredDate = json['RegisteredDate'];
    registeredDateStr = json['RegisteredDateStr'];
    createdDate = json['CreatedDate'];
    createdDateStr = json['CreatedDateStr'];
    modifiedTime = json['ModifiedTime'];
    modifiedTimeStr = json['ModifiedTimeStr'];
    leftDate = json['LeftDate'];
    leftDateStr = json['LeftDateStr'];
    isDeleted = json['IsDeleted'];
    deletedIdStr = json['DeletedIdStr'];
    deletedDate = json['DeletedDate'];
    deletedDateStr = json['DeletedDateStr'];
    createdBy = json['CreatedBy'];
    deletedBy = json['DeletedBy'];
    createdByIdStr = json['CreatedByIdStr'];
    isTeaching = json['IsTeaching'];
    isDefault = json['IsDefault'];
    sId = json['_id'];
    domainId = json['DomainId'];
    idStr = json['IdStr'];
    domainIdStr = json['DomainIdStr'];
    socialGroupIdStr = json['SocialGroupIdStr'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Name'] = this.name;
    data['MemberIdStr'] = this.memberIdStr;
    data['TrainerIdStr'] = this.trainerIdStr;
    data['DepartmentIdStr'] = this.departmentIdStr;
    data['DepartmentLogo'] = this.departmentLogo;
    data['DepartmentName'] = this.departmentName;
    data['RegisteredDate'] = this.registeredDate;
    data['RegisteredDateStr'] = this.registeredDateStr;
    data['CreatedDate'] = this.createdDate;
    data['CreatedDateStr'] = this.createdDateStr;
    data['ModifiedTime'] = this.modifiedTime;
    data['ModifiedTimeStr'] = this.modifiedTimeStr;
    data['LeftDate'] = this.leftDate;
    data['LeftDateStr'] = this.leftDateStr;
    data['IsDeleted'] = this.isDeleted;
    data['DeletedIdStr'] = this.deletedIdStr;
    data['DeletedDate'] = this.deletedDate;
    data['DeletedDateStr'] = this.deletedDateStr;
    data['CreatedBy'] = this.createdBy;
    data['DeletedBy'] = this.deletedBy;
    data['CreatedByIdStr'] = this.createdByIdStr;
    data['IsTeaching'] = this.isTeaching;
    data['IsDefault'] = this.isDefault;
    data['_id'] = this.sId;
    data['DomainId'] = this.domainId;
    data['IdStr'] = this.idStr;
    data['DomainIdStr'] = this.domainIdStr;
    data['SocialGroupIdStr'] = this.socialGroupIdStr;
    return data;
  }
}