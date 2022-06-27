class Setting {
  late String id;
  late String siteCopyright;
  late String siteName;
  late String siteSubName;
  late String siteSignature;
  String? siteRecordNo;
  String? siteRecordUrl;
  late String updatedAt;

  Setting(
      {required this.id,
      required this.siteCopyright,
      required this.siteName,
      required this.siteSubName,
      required this.siteSignature,
      this.siteRecordNo,
      this.siteRecordUrl,
      required this.updatedAt});

  Setting.fromJson(Map<String, dynamic> json) {
    id = json["_id"].toString();
    siteCopyright = json["site_copyright"].toString();
    siteName = json["site_name"].toString();
    siteSubName = json["site_subName"].toString();
    siteSignature = json["site_signature"].toString();
    siteRecordNo = json["site_record_no"]?.toString();
    siteRecordUrl = json["site_record_url"]?.toString();
    updatedAt = json["updated_at"].toString();
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
