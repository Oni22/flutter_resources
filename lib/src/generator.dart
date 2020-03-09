import 'dart:async';
import 'package:build/build.dart';
import 'package:multilang/src/base_r.dart';
import 'package:xml/xml.dart' as xml;

//https://www.youtube.com/watch?time_continue=840&v=H4HWB2Pmgcw&feature=emb_title
class ResourceBuilder extends Builder {

  @override
  Map<String, List<String>> get buildExtensions => const <String, List<String>>{'.xml' : <String>['.res.dart']};

  @override
  FutureOr<void> build(BuildStep buildStep) async {
    final AssetId output = buildStep.inputId.changeExtension(".res.dart");
    final String contents = await buildStep.readAsString(buildStep.inputId);
    var parsedXML = xml.parse(contents);
    
    String finalContent = "import 'package:multilang/multilang.dart';\nclass R extends BaseR {\n";
    
    parsedXML.findAllElements("string").forEach((node) {
      print(node.toString());
      var attr = node.attributes.firstWhere((attr) => attr.name.toString() == "name");
      finalContent += "\tstatic String ${attr.value} = \"${node.text}\";\n";
    });
    finalContent += "}";
    buildStep.writeAsString(output, finalContent);
  }

}