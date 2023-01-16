import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hippo/routes/index.routes.dart';

class FavoritesViewModel extends BaseViewModel {
  late bool _isOwnUI = false;
  final MovieController _movieController = Get.find();

  MovieController get movieController => _movieController;

  bool get isOwnUI => _isOwnUI;

  Future<void> initialise({required BuildContext context, bool isOwn = true}) async {
    _isOwnUI = isOwn;
    notifyListeners();
  }

  void makeFavorite(BuildContext context, Video video) {
    video.isLiked = !video.isLiked!;
    _movieController.removeMovie(video);
    notifyListeners();
  }
}
