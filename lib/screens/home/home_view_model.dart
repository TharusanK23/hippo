import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hippo/routes/index.routes.dart';

class HomeViewModel extends BaseViewModel {
  late bool _isOwnUI = false;
  late bool _isLoading = false;
  List<Video> _videoList = [];
  late VideoResult videoResult;
  late Timer searchOnStoppedTyping;

  final MovieController _movieController = Get.put(MovieController());

  final FocusNode _searchFocusNode = FocusNode();
  final TextEditingController _searchControler = TextEditingController();
  bool _isType = false;
  String title = 'Marvel';

  bool get isOwnUI => _isOwnUI;

  FocusNode get searchFocusNode => _searchFocusNode;
  TextEditingController get searchControler => _searchControler;
  bool get isType => _isType;

  List<Video> get videoList => _videoList;
  bool get isLoading => _isLoading;

  Future<void> initialise({required BuildContext context, bool isOwn = true}) async {
    _isOwnUI = isOwn;
    _searchControler.text = 'Marvel';
    _searchControler.addListener(_getLatestValue);
    getAllVideoList('');
    notifyListeners();
  }

  void _getLatestValue() {
    const duration = Duration(milliseconds: 500);
    searchOnStoppedTyping = Timer(duration, () => getAllVideoList(_searchControler.text.toLowerCase()));
  }

  // GET ALL VIDEO LIST
  void getAllVideoList(title) {
    if (_searchControler.text != '') {
      _isType = true;
    } else {
      _isType = false;
    }
    _isLoading = true;
    title = _searchControler.text;
    VidoeService.getAllVideos(title).then((res) {
      _isLoading = false;
      videoResult = VideoResult.fromJson(res);
      if (videoResult.response == 'True') {
        _videoList = videoResult.search!;
        dynamic videos = _movieController.videos.keys.toList();
        if (videos.isNotEmpty) {
          for (var i = 0; i < _videoList.length; i++) {
            int index = videos.indexWhere((v) => v.imdbId == videoList[i].imdbId);
            if (index != -1) {
              _videoList[i].isLiked = true;
            } else {
              _videoList[i].isLiked = false;
            }
          }
        } else {
          _videoList = videoList;
        }
      } else {
        _videoList = [];
      }
      notifyListeners();
    });
    notifyListeners();
  }

  void makeFavorite(BuildContext context, Video video) {
    if (!video.isLiked!) {
      video.isLiked = true;
      _movieController.addMovie(video);
    } else {
      Get.snackbar('Movie Already Added', 'You have already added the ${video.title!.toUpperCase()} in the favorites!', backgroundColor: Colors.orange, snackPosition: SnackPosition.TOP, duration: const Duration(seconds: 2));
    }
    notifyListeners();
  }
}
