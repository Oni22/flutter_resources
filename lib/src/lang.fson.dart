import 'package:flutter_resources/flutter_resources.dart';
class R {
	static RString test_text = RString(langs: {"en": "Hallo", "de": "Hello"} ,name: "test_text", plurals: {});
	static RString test_text_two = RString(langs: {"en": "Cool"} ,name: "test_text_two", plurals: {"de": ["eins", "zwei"]});
}

fun() {
  var s = R.test_text.getPlural(1);
}