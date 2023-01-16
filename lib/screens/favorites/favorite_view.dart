library favoriteview;

import 'package:flutter/material.dart';
import 'package:hippo/routes/index.routes.dart';

//Part
part './body/favorite_body.dart';

class FavoritesView extends StatelessWidget {
  static const routeName = '/favorite-view';
  const FavoritesView({Key? key, required this.isOwnUI}) : super(key: key);

  final bool isOwnUI;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FavoritesViewModel>.reactive(
        builder: (context, model, child) {
          return Scaffold(
            backgroundColor: const Color(0xFFFFFFFF),
            appBar: AppBar(
                elevation: model.isOwnUI ? 0.0 : 1,
                automaticallyImplyLeading: false,
                backgroundColor: model.isOwnUI ? const Color(0xFF232f3f) : const Color(0xFFFFFFFF),
                title: model.isOwnUI
                    ? Row(
                        children: const <Widget>[
                          Text(
                            'Favorites List',
                            style: TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontSize: 30.0,
                              fontFamily: 'FredokaOne',
                            ),
                          )
                        ],
                      )
                    : const SizedBox(),
                centerTitle: false),
            body: const SafeArea(
              child: _FavoritesBody(),
            ),
          );
        },
        onViewModelReady: (model) {
          model.initialise(context: context, isOwn: isOwnUI);
        },
        viewModelBuilder: () => FavoritesViewModel());
  }
}
