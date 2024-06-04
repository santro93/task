class GetAllDetailsModel {
  GetAllDetailsModel({
    this.success,
    this.message,
    this.data,
  });
  bool? success;
  String? message;
  List<Data>? data;

  GetAllDetailsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = List.from(json['data']).map((e) => Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['message'] = message;
    _data['data'] = data!.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.locationLabel,
    required this.locationName,
    required this.longitude,
    required this.latitude,
    required this.remark,
    required this.isActive,
    required this.createdAt,
    required this.createdBy,
    this.updatedAt,
    this.updatedBy,
  });
  late final int id;
  late final String locationLabel;
  late final String locationName;
  late final String longitude;
  late final String latitude;
  late final String remark;
  late final int isActive;
  late final String createdAt;
  late final int createdBy;
  late final String? updatedAt;
  late final int? updatedBy;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    locationLabel = json['location_label'];
    locationName = json['location_name'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    remark = json['remark'];
    isActive = json['is_active'];
    createdAt = json['created_at'];
    createdBy = json['created_by'];
    updatedAt = null;
    updatedBy = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['location_label'] = locationLabel;
    _data['location_name'] = locationName;
    _data['longitude'] = longitude;
    _data['latitude'] = latitude;
    _data['remark'] = remark;
    _data['is_active'] = isActive;
    _data['created_at'] = createdAt;
    _data['created_by'] = createdBy;
    _data['updated_at'] = updatedAt;
    _data['updated_by'] = updatedBy;
    return _data;
  }
}
