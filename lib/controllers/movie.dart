import 'package:flutter/material.dart';
import 'package:hippo/routes/index.routes.dart';

class MovieController extends GetxController {
  final _videos = {}.obs;

  void addMovie(Video video) {
    if (_videos.containsKey(video)) {
      _videos[video] += 1;
    } else {
      _videos[video] = 1;
    }
    Get.snackbar('Movie Added', 'You have added the ${video.title!.toUpperCase()} to the favorites!', backgroundColor: const Color(0xFF00BF6D), snackPosition: SnackPosition.TOP, duration: const Duration(seconds: 2));
  }

  void removeMovie(Video video) {
    if (_videos.containsKey(video) && _videos[video] == 1) {
      _videos.removeWhere((key, value) => key == video);
    } else {
      _videos[video] -= 1;
    }
    Get.snackbar('Movie Removed', 'You have removed the ${video.title!.toUpperCase()} from the favorites!', backgroundColor: const Color(0xFFF03738), snackPosition: SnackPosition.TOP, duration: const Duration(seconds: 2));
  }

  void makeFavorite(Video video) {
    if (video.isLiked!) {
      removeMovie(video);
    } else {
      addMovie(video);
    }
    video.isLiked = !video.isLiked!;
  }

  get videos => _videos;
}
