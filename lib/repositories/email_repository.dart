import 'package:dio/dio.dart';
import 'package:boca_app/settings.dart';
import 'package:flutter/cupertino.dart';

abstract class EmailRepository{


  Future<int> sendEmail(Map<String, dynamic> data) async{

    var url = "${Settings.apiURL}usuario/email";
    Response response = await Dio().post(url, data: data);

    return response.statusCode;
  }

}