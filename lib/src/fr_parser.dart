// test_text {
//     en: Hallo,
//     de: Hello
// },

import 'package:flutter_resources/src/r_string.dart';

class FRParser {

  List<RString> strings = [];

  FRParser.toRStrings(String frData) {
    var frs = frData.split("},");

    frs.forEach((fr) {
      var frSplitted = fr.split("{");
      var name = frSplitted[0].trim();
      var langList = frSplitted[1].replaceAll("},", "").replaceAll("}","").trim().split(",").map((lang) {
          var splittedLang = lang.split(":");
          var langCode = splittedLang[0].trim();
          var text = splittedLang[1].trim();
          return {"code": langCode,"text": text};
      }).toList();
      var map = Map<String,String>();
      langList.forEach((item) {
        map["\"${item["code"]}\""] = "\"${item["text"]}\"";
      });
      strings.add(RString(langs: map,name: name));
    });
  }

}