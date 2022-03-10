class RegisterUserModel {
  String? username;
  String? password;
  String? nome;
  String? email;
  String? id;

  RegisterUserModel(
      {this.username, this.password, this.nome, this.email, this.id});

  RegisterUserModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
    nome = json['nome'];
    email = json['email'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['password'] = password;
    data['nome'] = nome;
    data['email'] = email;
    data['id'] = id;
    return data;
  }
}
