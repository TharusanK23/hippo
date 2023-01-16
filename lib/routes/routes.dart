import 'package:flutter/material.dart';
import 'package:hippo/routes/index.routes.dart';

class Routes {
  Routes._();

  static final routes = <String, WidgetBuilder>{
    InitView.routeName: (context) => const InitView(),
    MainView.routeName: (context) => const MainView(isOwnUI: false),
    HomeView.routeName: (context) => const HomeView(isOwnUI: false),
    FavoritesView.routeName: (context) => const FavoritesView(isOwnUI: false),
  };
}
