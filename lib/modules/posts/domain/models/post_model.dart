class PostModel {
  User? user;
  String? createdAt;
  String? content;

  PostModel({this.user, this.createdAt, this.content});

  PostModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    createdAt = json['createdAt'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['createdAt'] = createdAt;
    data['content'] = content;
    return data;
  }
}

class User {
  String? username;
  String? nome;
  String? profilePicture;

  User({this.username, this.nome, this.profilePicture});

  User.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    nome = json['nome'];
    profilePicture = json['profile_picture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['nome'] = nome;
    data['profile_picture'] = profilePicture;
    return data;
  }
}
