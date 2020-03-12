// test_text {
//     en: Hallo,
//     de: Hello
// },

import 'package:flutter_resources/src/r_string.dart';

class FRParser {

  List<RString> strings = [];

  FRParser.toRStrings(String frData) {
    var idBlocks = frData.split("},");

    idBlocks.forEach((block) {
      var blockNameLangs = block.split("{");
      var name = blockNameLangs[0].trim();

      var langList = blockNameLangs[1].replaceAll("}","").trim().split(RegExp(r"(,)(?![^[]*\])")).map((lang) {
        print(lang);
          var langCodeText = lang.split(":");
          var langCode = langCodeText[0].trim();
          var text = langCodeText[1].trim();
          return {"code": langCode,"text": text};
      }).toList();

      var map = Map<String,String>();
      var pluralMap = Map<String,List<String>>();
      
      langList.forEach((item) {
        var text =  item["text"];
        var langCode =  item["code"];

        if(text.startsWith("[") && text.endsWith("]")) {
            var plurals = text.replaceAll("[", "").replaceAll("]", "").trim().split(",");
            pluralMap["\"$langCode\""] = plurals;
        } else {
           map["\"$langCode\""] = text;
        }
      });
      strings.add(RString(langs: map,name: name,plurals: pluralMap));
    });
  }

}