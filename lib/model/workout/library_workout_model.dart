class LibraryWorkoutModel {
  num idInfo;
  String name;
  bool isDeleted;
  String createdBy;
  String createdByStr;
  String createdDate;
  String createdDateStr;
  String modifiedByStr;
  String modifiedDate;
  String modifiedDateStr;
  String language;
  String originalId;
  String originalIdStr;
  bool isMain;
  bool isFinished;
  int totalCategoryCompleted=0;
  int totalCategory=0;
  int practiveTime;
  int startTime;
  String text;
  int totalPractive;
  int totalTime;
  int times;
  String description;
  num index;
  String title;
  bool isPublic;
  String parentId;
  String parentIdStr;
  num level;
  num caloConsumption;
  String imageUrl;
  String videoUrl;
  num orgId;
  num totalDay;
  num groupType;
  num type;
  num totalWorkout;
  String imageName;
  String parentName;
  String languageName;
  num parentInfo;
  num appType;
  String textScore;
  String sId;
  String domainId;
  String idStr;
  String domainIdStr;
  int totalPractiveCompleted;
  List<LibraryWorkoutModel> children;

  LibraryWorkoutModel(
      {this.idInfo,
        this.name,
        this.videoUrl,
        this.isDeleted,
        this.caloConsumption,
        this.totalCategoryCompleted,
        this.createdBy,
        this.createdByStr,
        this.createdDate,
        this.createdDateStr,
        this.startTime,
        this.modifiedByStr,
        this.practiveTime,
        this.totalPractiveCompleted,
        this.isFinished,
        this.times,
        this.text,
        this.modifiedDate,
        this.modifiedDateStr,
        this.language,
        this.originalId,
        this.originalIdStr,
        this.totalCategory,
        this.isMain,
        this.description,
        this.children,
        this.index,
        this.title,
        this.isPublic,
        this.parentId,
        this.parentIdStr,
        this.level,
        this.imageUrl,
        this.orgId,
        this.totalDay,
        this.groupType,
        this.type,
        this.totalWorkout,
        this.imageName,
        this.parentName,
        this.languageName,
        this.parentInfo,
        this.appType,
        this.textScore,
        this.totalPractive,
        this.totalTime,
        this.sId,
        this.domainId,
        this.idStr,
        this.domainIdStr});

  LibraryWorkoutModel.fromJson(Map<String, dynamic> json) {
    idInfo = json['IdInfo'];
    name = json['Name'];
    text = json['Text'];
    totalCategoryCompleted = json['TotalCategoryCompleted'];
    caloConsumption = json['CaloConsumption'];
    isDeleted = json['IsDeleted'];
    createdBy = json['CreatedBy'];
    createdByStr = json['CreatedByStr'];
    createdDate = json['CreatedDate'];
    createdDateStr = json['CreatedDateStr'];
    modifiedByStr = json['ModifiedByStr'];
    totalCategory = json['TotalCategory'];
    modifiedDate = json['ModifiedDate'];
    practiveTime = json['PractiveTime'];
    startTime = json['StartTime'];
    totalPractiveCompleted = json['TotalPractiveCompleted'];
    times = json['Times'];
    isFinished = json['IsFinished'];
    modifiedDateStr = json['ModifiedDateStr'];
    language = json['Language'];
    originalId = json['OriginalId'];
    originalIdStr = json['OriginalIdStr'];
    isMain = json['IsMain'];
    description = json['Description'];
    index = json['Index'];
    title = json['Title'];
    isPublic = json['IsPublic'];
    parentId = json['ParentId'];
    parentIdStr = json['ParentIdStr'];
    level = json['Level'];
    imageUrl = json['ImageUrl'];
    videoUrl = json['VideoUrl'];
    orgId = json['OrgId'];
    totalDay = json['TotalDay'];
    groupType = json['GroupType'];
    type = json['Type'];
    if (json['Children'] != null) {
      children = new List<LibraryWorkoutModel>();
      json['Children'].forEach((v) {
        children.add(new LibraryWorkoutModel.fromJson(v));
      });
    }
    totalWorkout = json['TotalWorkout'];
    imageName = json['ImageName'];
    parentName = json['ParentName'];
    languageName = json['LanguageName'];
    parentInfo = json['ParentInfo'];
    appType = json['AppType'];
    textScore = json['textScore'];
    sId = json['_id'];
    totalPractive = json['TotalPractive'];
    totalTime = json['TotalTime'];
    domainId = json['DomainId'];
    idStr = json['IdStr'];
    domainIdStr = json['DomainIdStr'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['IdInfo'] = this.idInfo;
    data['Name'] = this.name;
    data['Text'] = this.text;
    data['IsDeleted'] = this.isDeleted;
    data['CreatedBy'] = this.createdBy;
    data['CreatedByStr'] = this.createdByStr;
    data['CreatedDate'] = this.createdDate;
    data['CreatedDateStr'] = this.createdDateStr;
    data['ModifiedByStr'] = this.modifiedByStr;
    data['ModifiedDate'] = this.modifiedDate;
    data['ModifiedDateStr'] = this.modifiedDateStr;
    data['TotalCategoryCompleted'] = this.totalCategoryCompleted;
    data['Language'] = this.language;
    data['TotalCategory'] = this.totalCategory;
    data['VideoUrl'] = this.videoUrl;
    data['OriginalId'] = this.originalId;
    data['OriginalIdStr'] = this.originalIdStr;
    data['IsMain'] = this.isMain;
    data['Description'] = this.description;
    data['Index'] = this.index;
    data['Title'] = this.title;
    data['IsFinished'] = this.isFinished;
    data['CaloConsumption'] = this.caloConsumption;
    data['IsPublic'] = this.isPublic;
    data['ParentId'] = this.parentId;
    data['ParentIdStr'] = this.parentIdStr;
    data['Level'] = this.level;
    data['ImageUrl'] = this.imageUrl;
    data['OrgId'] = this.orgId;
    data['TotalDay'] = this.totalDay;
    data['GroupType'] = this.groupType;
    data['Type'] = this.type;
    data['TotalWorkout'] = this.totalWorkout;
    data['PractiveTime'] = this.practiveTime;
    data['StartTime'] = this.startTime;
    data['Times'] = this.times;
    data['ImageName'] = this.imageName;
    data['ParentName'] = this.parentName;
    data['LanguageName'] = this.languageName;
    data['ParentInfo'] = this.parentInfo;
    data['AppType'] = this.appType;
    data['textScore'] = this.textScore;
    data['_id'] = this.sId;
    data['DomainId'] = this.domainId;
    if (this.children != null) {
      data['Children'] = this.children.map((v) => v.toJson()).toList();
    }
    data['TotalPractive'] = this.totalPractive;
    data['TotalTime'] = this.totalTime;
    data['TotalPractiveCompleted'] = this.totalPractiveCompleted;
    data['IdStr'] = this.idStr;
    data['DomainIdStr'] = this.domainIdStr;
    return data;
  }
}
