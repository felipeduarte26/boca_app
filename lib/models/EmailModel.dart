import 'package:boca_app/repositories/email_repository.dart';

class email extends EmailRepository {
   
   String _nome;
   String _email;
   String _texto;
   
   set Nome(String value)=> _nome   = value;
   set Email(String value)=> _email = value;
   set Texto(String value)=> _texto  = value;

    Future<int> enviar() async{

     final Map<String, dynamic> data = new Map<String, dynamic>();

     data['nome'] = _nome;
     data['email'] = _email;
     data['texto'] = _texto;

     return sendEmail(data);
    }

}
