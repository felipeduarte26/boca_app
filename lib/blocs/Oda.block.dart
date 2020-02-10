import 'package:boca_app/models/OdaModel.dart';
import 'package:boca_app/repositories/oda_repository.dart';
import 'package:flutter/material.dart';


class OdaBlock extends ChangeNotifier{

  final odaRepository = new OdaRepository();

  List<OdaModel> Oda;


  OdaBlock(){
    getOda();
  }

  getOda(){
    odaRepository.getAll().then((data){
        this.Oda = data;
        notifyListeners();
    });

  }
}