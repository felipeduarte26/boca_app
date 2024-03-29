import 'dart:convert';
import 'package:boca_app/models/authenticate_user.dart';
import 'package:boca_app/repositories/account_repository.dart';
import 'package:boca_app/settings.dart';
import 'package:flutter/material.dart';
import 'package:boca_app/models/UserModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:boca_app/repositories/recuperar_acesso.dart';

class UserBloc extends ChangeNotifier{
  var user = new UserModel();

  UserBloc(){
    Settings.user = null;
    user = null;
    loadUser();
  }

  Future<UserModel> authenticate(AuthenticateModel model) async{
      try{
        var prefs = await SharedPreferences.getInstance();
        var repository = new AccountRepository();
        user = null;
        var res = await repository.authenticate(model);
        user = res;

        await prefs.setString('user', jsonEncode(res));
        notifyListeners();
        return user;
      }catch(ex){
        user = null;
        return null;
      }

  }

  logout() async{
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString('user', null);
    user = null;
    notifyListeners();
  }

  Future loadUser() async{
    var prefs = await SharedPreferences.getInstance();
    var userData = prefs.getString('user');


    /*if(userData != null){
      var res = UserModel.fromJson(jsonDecode(userData));
      Settings.user = res;
      user = res;
      notifyListeners();
    }*/

  }

  Future<bool> Recuperar(Map dados) async{
    var repository = new RecuperarAcessoRepository();

    var res = await repository.RecuperarSenha(dados);

    return (res == 200);

  }

}