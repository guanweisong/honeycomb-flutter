class Setting {
  String? id;
  String? siteCopyright;
  String? siteName;
  String? siteSubName;
  String? siteSignature;
  String? siteRecordNo;
  String? siteRecordUrl;
  String? updatedAt;

  Setting(
      {this.id,
      this.siteCopyright,
      this.siteName,
      this.siteSubName,
      this.siteSignature,
      this.siteRecordNo,
      this.siteRecordUrl,
      this.updatedAt});

  Setting.fromJson(Map<String, dynamic> json) {
    id = json["_id"]?.toString();
    siteCopyright = json["site_copyright"]?.toString();
    siteName = json["site_name"]?.toString();
    siteSubName = json["site_subName"]?.toString();
    siteSignature = json["site_signature"]?.toString();
    siteRecordNo = json["site_record_no"]?.toString();
    siteRecordUrl = json["site_record_url"]?.toString();
    updatedAt = json["updated_at"]?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["_id"] = id;
    data["site_copyright"] = siteCopyright;
    data["site_name"] = siteName;
    data["site_subName"] = siteSubName;
    data["site_signature"] = siteSignature;
    data["site_record_no"] = siteRecordNo;
    data["site_record_url"] = siteRecordUrl;
    data["updated_at"] = updatedAt;
    return data;
  }
}
