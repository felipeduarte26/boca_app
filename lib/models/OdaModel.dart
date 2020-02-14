class OdaModel{
  String id;
  String nome;
  String usuario;
  String status;
  String imagem;
  String texto1;
  String texto2;
  String texto3;
  String audio1;
  String audio2;
  String audio3;
  String data_inclusao;
  String data_edicao;

  OdaModel({this.nome, this.status, this.id, this.audio1, this.audio2, this.audio3, this.data_edicao, this.data_inclusao, this.imagem, this.texto1, this.texto2,
  this.texto3, this.usuario});

  OdaModel.fromJson(Map<String, dynamic> json){

    id = json['id'];
    nome = json['nome'];
    usuario = json['usuario'];
    status = json['status'];
    imagem = json['imagem'];
    texto1 = json['texto1'];
    texto2 = json['texto2'];
    texto3 = json['texto3'];
    audio1 = json['audio1'];
    audio2 = json['audio2'];
    audio3 = json['audio3'];
    data_inclusao = json['data_inclusao'];
    data_edicao = json['data_edicao'];

  }

  Map<String, dynamic> toJson(){

    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['id'] = this.id;
    data['nome'] = this.nome;
    data['usuario'] = this.usuario;
    data['status'] = this.status;
    data['imagem'] = this.imagem;
    data['texto1'] = this.texto1;
    data['texto2'] = this.texto2;
    data['texto3'] = this.texto3;
    data['audio1'] = this.audio1;
    data['audio2'] = this.audio2;
    data['audio3'] = this.texto3;
    data['data_inclusao'] = this.data_inclusao;
    data['data_edicao'] = this.data_edicao;
  }

}