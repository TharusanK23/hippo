library initview;

import 'package:flutter/material.dart';
import 'package:hippo/routes/index.routes.dart';

//Part
part './body/init_body.dart';

class InitView extends StatelessWidget {
  static const routeName = '/init-view';
  const InitView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<InitViewModel>.reactive(
        builder: (context, model, child) {
          return const Scaffold(
            body: SafeArea(child: _InitBody()),
          );
        },
        onViewModelReady: (model) {
          model.initialise(context: context);
        },
        viewModelBuilder: () => InitViewModel());
  }
}
