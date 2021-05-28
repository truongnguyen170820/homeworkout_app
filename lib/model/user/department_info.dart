class CommonDepartmentInfo {
  String deptName;
  String idStr;
  String deptImage;
  String deptAddress;
  String deptHotLine;

  CommonDepartmentInfo(this.deptName, this.idStr, this.deptImage,this.deptAddress,this.deptHotLine);

  Map<String, dynamic> toJson() =>
      <String, dynamic>{
        'deptName': this.deptName,
        'idStr': this.idStr,
        'deptImage': this.deptImage,
        'deptAddress': this.deptAddress,
        'deptHotLine' : this.deptHotLine
    };

  factory CommonDepartmentInfo.fromJson(Map<String, dynamic> json) {
    return CommonDepartmentInfo(
      json['deptName'] as String,
      json['idStr'] as String,
      json['deptImage'] as String,
      json['deptAddress'] as String,
      json['deptHotLine'] as String,
    );
  }

}