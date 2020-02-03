class UserModel {
  String sId;
  String login;
  String senha;
  String senha2;
  String nome;
  String email;
  String perfil;

  UserModel(
      {this.sId,
        this.login,
        this.senha,
        this.senha2,
        this.nome,
        this.email,
        this.perfil});

  UserModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    login = json['login'];
    senha = json['senha'];
    senha2 = json['senha2'];
    nome = json['nome'];
    email = json['email'];
    perfil = json['perfil'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['login'] = this.login;
    data['senha'] = this.senha;
    data['senha2'] = this.senha2;
    data['nome'] = this.nome;
    data['email'] = this.email;
    data['perfil'] = this.perfil;
    return data;
  }
}
