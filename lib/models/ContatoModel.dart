class ContatoModel{

  String _nome;
  String _email;
  String _assunto;
  String _comentario;

  set nome(final String nome) => this._nome = nome;
  set email(final String  email)=> this._email = email;
  set assunto(final String assunto) => this._assunto = assunto;
  set comentario(final String comentario) => this._comentario = comentario;

  String get nome => this._nome;
  String get email => this._email;
  String get assunto => this._assunto;
  String get comentario => this._comentario;

  Future<bool> Cadastrarar() async{



   return true;
  }

}