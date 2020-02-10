import 'package:dio/dio.dart';
import 'package:boca_app/models/OdaModel.dart';
import 'package:boca_app/settings.dart';


class OdaRepository{

    Future<List<OdaModel>> getAll() async{
      var url = "${Settings.apiURL}oda";

      Response response = await Dio().get(url);
      return (response.data as List).map((course) => OdaModel.fromJson(course)).toList();
    }

}