import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart';

Map<String, String> getDocument(String html){
  final document = parse(html);
  Map _list = new Map<String, String>();

  document.body.getElementsByTagName('a').forEach((element) {
    //if (Element.attributes['href'] != null) {
      _list[element.text] = element.attributes['href'];  
    //}
    
  });

  return _list;
}