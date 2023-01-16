import 'package:flutter/material.dart';
import 'package:hippo/routes/index.routes.dart';

class MainViewModel extends BaseViewModel {
  late RiveAsset _riveAsset;
  late bool _isOwnUI = false;

  static const List<Widget> _widgets = [
    HomeView(isOwnUI: false),
    Text('Search'),
    FavoritesView(isOwnUI: false),
    Text('Notification'),
    Text('Setting'),
  ];
  late int _selectedIndex = 0;

  bool get isOwnUI => _isOwnUI;

  RiveAsset get riveAsset => _riveAsset;
  List<Widget> get widgets => _widgets;
  int get selectedIndex => _selectedIndex;

  Future<void> initialise({required BuildContext context, bool isOwn = true}) async {
    _isOwnUI = isOwn;
    _riveAsset = bottomNavs.first;
    notifyListeners();
  }

  void selectNav(RiveAsset asset) {
    _riveAsset = asset;
    notifyListeners();
  }

  void onItemClicked(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
