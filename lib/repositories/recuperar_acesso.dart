import 'package:boca_app/models/authenticate_user.dart';
import 'package:dio/dio.dart';
import 'package:boca_app/models/UserModel.dart';
import 'package:boca_app/settings.dart';


class RecuperarAcessoRepository{



  Future<int> RecuperarSenha(Map dados) async{
    var url = "${Settings.apiURL}usuario/recuperar";

    Response response = await Dio().put(url, data: dados);
    return response.statusCode;
  }

}
