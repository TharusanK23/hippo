import 'package:hippo/routes/index.routes.dart';
import 'package:http/http.dart' as http;

get(String url) async {
  var getUrl = Uri.parse(BASE_URL + url);
  final getUrlWithParam = http.get(getUrl);
  return getUrlWithParam.then((res) async {
    return res;
  });
}
