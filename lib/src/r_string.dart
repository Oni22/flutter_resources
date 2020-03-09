 
import 'package:flutter_resources/src/r_service.dart';

class RString {

  RString({this.langs,this.name});
  String name;

  Map<String,dynamic> langs;

  String get text => langs[RService.languageCode];

}