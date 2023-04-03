import 'package:http/http.dart' as http;
import 'package:translator/translator.dart';
class TranslateApiService{


static Future<String> translatorApi({required String txt,required String fromLnCode,required String toLnCode}) async {
  final GoogleTranslator googleTranslator = GoogleTranslator();
  final result = await googleTranslator.translate(txt,from: fromLnCode,to: toLnCode);
  return result.text;
}
}