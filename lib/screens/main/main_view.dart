library mainview;

import 'package:flutter/material.dart';
import 'package:hippo/routes/index.routes.dart';

//Part
part './body/main_body.dart';

class MainView extends StatelessWidget {
  final bool isOwnUI;
  static const routeName = '/main-view';
  const MainView({Key? key, required this.isOwnUI}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
        builder: (context, model, child) {
          return Scaffold(
            backgroundColor: const Color(0xFFFFFFFF),
            body: const SafeArea(child: _MainBody()),
            bottomNavigationBar: isOwnUI
                ? SafeArea(
                    child: BottomView(
                    selectNav: (asset) => model.selectNav(asset),
                  ))
                : BottomBar(selectedIndex: model.selectedIndex, onTap: (index) => model.onItemClicked(index)),
          );
        },
        onViewModelReady: (model) {
          model.initialise(context: context, isOwn: isOwnUI);
        },
        viewModelBuilder: () => MainViewModel());
  }
}
