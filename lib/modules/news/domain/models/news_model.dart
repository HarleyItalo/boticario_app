class NewsModel {
  List<News>? news;

  NewsModel({this.news});

  NewsModel.fromJson(Map<String, dynamic> json) {
    if (json['news'] != null) {
      news = <News>[];
      json['news'].forEach((v) {
        news!.add(News.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (news != null) {
      data['news'] = news!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class News {
  User? user;
  Message? message;

  News({this.user, this.message});

  News.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    message =
        json['message'] != null ? Message.fromJson(json['message']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (message != null) {
      data['message'] = message!.toJson();
    }
    return data;
  }
}

class User {
  String? name;
  String? profilePicture;

  User({this.name, this.profilePicture});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    profilePicture = json['profile_picture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['profile_picture'] = profilePicture;
    return data;
  }
}

class Message {
  String? content;
  String? createdAt;

  Message({this.content, this.createdAt});

  Message.fromJson(Map<String, dynamic> json) {
    content = json['content'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['content'] = content;
    data['created_at'] = createdAt;
    return data;
  }
}
