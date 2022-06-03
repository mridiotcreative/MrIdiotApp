import 'dart:convert';

ViewPostsModel viewPostsModelFromJson(String str) => ViewPostsModel.fromJson(json.decode(str));

String viewPostsModelToJson(ViewPostsModel data) => json.encode(data.toJson());

class ViewPostsModel {
  ViewPostsModel({
    this.responseCode,
    this.responseMessage,
    this.result,
    this.statuscode,
    this.timeZone,
  });

  int? responseCode;
  String? responseMessage;
  List<Result>? result;
  String? statuscode;
  String? timeZone;

  factory ViewPostsModel.fromJson(Map<String, dynamic> json) => ViewPostsModel(
    responseCode: json["ResponseCode"],
    responseMessage: json["ResponseMessage"],
    result: List<Result>.from(json["Result"].map((x) => Result.fromJson(x))),
    statuscode: json["Statuscode"],
    timeZone: json["TimeZone"],
  );

  Map<String, dynamic> toJson() => {
    "ResponseCode": responseCode,
    "ResponseMessage": responseMessage,
    "Result": List<dynamic>.from(result!.map((x) => x.toJson())),
    "Statuscode": statuscode,
    "TimeZone": timeZone,
  };
}

class Result {
  Result({
    this.id,
    this.userId,
    this.videoCategoryType,
    this.description,
    this.uploadUrl,
    this.thumbnailImage,
    this.createdDate,
    this.updatedDate,
    this.isDelete,
  });

  String? id;
  String? userId;
  String? videoCategoryType;
  String? description;
  String? uploadUrl;
  String? thumbnailImage;
  String? createdDate;
  String? updatedDate;
  String? isDelete;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    userId: json["user_id"],
    videoCategoryType: json["video_category_type"],
    description: json["description"],
    uploadUrl: json["upload_url"],
    thumbnailImage: json["thumbnail_image"],
    createdDate: json["created_date"],
    updatedDate: json["updated_date"],
    isDelete: json["is_delete"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "video_category_type": videoCategoryType,
    "description": description,
    "upload_url": uploadUrl,
    "thumbnail_image": thumbnailImage,
    "created_date": createdDate,
    "updated_date": updatedDate,
    "is_delete": isDelete,
  };
}
