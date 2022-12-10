// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.status,
    this.token,
    this.data,
    this.messages,
  });

  int? status;
  String? token;
  Data? data;
  Messages? messages;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        status: json["status"],
        token: json["token"],
        data: Data.fromJson(json["data"]),
        messages: Messages.fromJson(json["messages"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "token": token,
        "data": data?.toJson(),
        "messages": messages?.toJson(),
      };
}

class Data {
  Data({
    this.id,
    this.memberNumber,
    this.name,
    this.village,
    this.liveIn,
    this.mobileNo,
    this.email,
    this.status,
    this.updatedBy,
    this.updatedDate,
    this.createdBy,
    this.createdDate,
  });

  String? id;
  String? memberNumber;
  String? name;
  String? village;
  String? liveIn;
  String? mobileNo;
  dynamic email;
  String? status;
  String? updatedBy;
  DateTime? updatedDate;
  String? createdBy;
  DateTime? createdDate;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        memberNumber: json["member_number"],
        name: json["name"],
        village: json["village"],
        liveIn: json["live_in"],
        mobileNo: json["mobile_no"],
        email: json["email"],
        status: json["status"],
        updatedBy: json["updated_by"],
        updatedDate: DateTime.parse(json["updated_date"]),
        createdBy: json["created_by"],
        createdDate: DateTime.parse(json["created_date"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "member_number": memberNumber,
        "name": name,
        "village": village,
        "live_in": liveIn,
        "mobile_no": mobileNo,
        "email": email,
        "status": status,
        "updated_by": updatedBy,
        "updated_date": updatedDate?.toIso8601String(),
        "created_by": createdBy,
        "created_date": createdDate?.toIso8601String(),
      };
}

class Messages {
  Messages({
    this.success,
  });

  String? success;

  factory Messages.fromJson(Map<String, dynamic> json) => Messages(
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
      };
}
