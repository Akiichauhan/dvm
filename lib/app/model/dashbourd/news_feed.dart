class NewsFeed {
  int? status;
  List<Posts>? posts;
  String? page;
  String? limit;
  Messages? messages;

  NewsFeed({this.status, this.posts, this.page, this.limit, this.messages});

  NewsFeed.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['posts'] != null) {
      posts = <Posts>[];
      json['posts'].forEach((v) {
        posts!.add(Posts.fromJson(v));
      });
    }
    page = json['page'];
    limit = json['limit'];
    messages =
        json['messages'] != null ? Messages.fromJson(json['messages']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (posts != null) {
      data['posts'] = posts!.map((v) => v.toJson()).toList();
    }
    data['page'] = page;
    data['limit'] = limit;
    if (messages != null) {
      data['messages'] = messages!.toJson();
    }
    return data;
  }
}

class Posts {
  String? id;
  String? title;
  String? description;
  String? file;
  String? type;
  String? amount;
  String? status;

  Posts(
      {this.id,
      this.title,
      this.description,
      this.file,
      this.type,
      this.amount,
      this.status});

  Posts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    file = json['file'];
    type = json['type'];
    amount = json['amount'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['file'] = file;
    data['type'] = type;
    data['amount'] = amount;
    data['status'] = status;
    return data;
  }
}

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
