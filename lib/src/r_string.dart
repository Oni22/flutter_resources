 
import 'package:flutter_resources/src/r_service.dart';

class RString {

  RString({this.langs,this.name,this.plurals});
  String name;

  Map<String,dynamic> langs = {};
  Map<String,List<String>> plurals = {};

  String get text => langs[RService.languageCode];

  String setTextParams(List<dynamic> params) {
    var paramsText = "";

    params.forEach((p) {
      var paramPartText = text.split("${params.indexOf(p) + 1}")[params.indexOf(p)];
      paramsText += paramPartText.replaceAll("%", "$p");
    });
    return paramsText;
  }
  
  String getPlural(int quantity,{String langCode = ""}) {

    var currentLangCode = langCode == "" ? RService.languageCode : langCode;

    if(plurals.containsKey(currentLangCode)){
      return plurals[currentLangCode][quantity];
    } else {
      return "Error lang code hasn't plurals!";
    }
  }

}
