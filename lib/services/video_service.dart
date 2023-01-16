import 'dart:convert';

import 'package:hippo/routes/index.routes.dart';

class VidoeService {
  static Future<dynamic> getAllVideos(title) async {
    final response = await get('$API_KEY&s=$title&type=movie');
    return json.decode(response.body);
  }

  static Future<dynamic> getVideo(id) async {
    final response = await get('$API_KEY&i=$id');
    return json.decode(response.body);
  }
}
