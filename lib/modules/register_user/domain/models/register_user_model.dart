class UserModel {
  String? username;
  String? password;
  String? nome;
  String? email;
  String? id;
  String? profilePicture;

  UserModel(
      {this.username,
      this.password,
      this.nome,
      this.email,
      this.id,
      this.profilePicture});

  UserModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
    nome = json['nome'];
    email = json['email'];
    profilePicture = json['profile_picture'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['password'] = password;
    data['nome'] = nome;
    data['email'] = email;
    data['profile_picture'] = profilePicture;
    data['id'] = id;
    return data;
  }
}
