import 'package:boca_app/models/authenticate_user.dart';
import 'package:dio/dio.dart';
import 'package:boca_app/models/UserModel.dart';
import 'package:boca_app/settings.dart';


class AccountRepository{

  Future<UserModel>  authenticate(AuthenticateModel model) async{
      var url = "${Settings.apiURL}usuario/login";

      Response response = await Dio().post(url, data: model);
      return UserModel.fromJson(response.data);

  }

}
