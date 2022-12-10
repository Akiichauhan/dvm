class LoginModel {
  int? status;
  String? token;
  Data? data;
  Messages? messages;

  LoginModel({this.status, this.token, this.data, this.messages});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    token = json['token'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    messages =
        json['messages'] != null ? Messages.fromJson(json['messages']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['token'] = token;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    if (messages != null) {
      data['messages'] = messages!.toJson();
    }
    return data;
  }
}

class Data {
  String? id;
  String? memberNumber;
  String? name;
  String? village;
  String? liveIn;
  String? mobileNo;
  String? email;
  String? status;
  String? updatedBy;
  String? updatedDate;
  String? createdBy;
  String? createdDate;

  Data(
      {this.id,
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
      this.createdDate});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    memberNumber = json['member_number'];
    name = json['name'];
    village = json['village'];
    liveIn = json['live_in'];
    mobileNo = json['mobile_no'];
    email = json['email'];
    status = json['status'];
    updatedBy = json['updated_by'];
    updatedDate = json['updated_date'];
    createdBy = json['created_by'];
    createdDate = json['created_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['member_number'] = memberNumber;
    data['name'] = name;
    data['village'] = village;
    data['live_in'] = liveIn;
    data['mobile_no'] = mobileNo;
    data['email'] = email;
    data['status'] = status;
    data['updated_by'] = updatedBy;
    data['updated_date'] = updatedDate;
    data['created_by'] = createdBy;
    data['created_date'] = createdDate;
    return data;
  }
}

//* now run bro one ag

class Messages {
  String? success;

  Messages({this.success});

  Messages.fromJson(Map<String, dynamic> json) {
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    return data;
  }
}
