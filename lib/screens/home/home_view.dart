library homeview;

import 'package:flutter/material.dart';
import 'package:hippo/routes/index.routes.dart';

//Part
part './body/home_body.dart';

class HomeView extends StatelessWidget {
  static const routeName = '/home-view';
  const HomeView({Key? key, required this.isOwnUI}) : super(key: key);

  final bool isOwnUI;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
        builder: (context, model, child) {
          return Scaffold(
            backgroundColor: const Color(0xFFFFFFFF),
            appBar: AppBar(
                elevation: model.isOwnUI ? 0.0 : 1,
                backgroundColor: model.isOwnUI ? const Color(0xFF232f3f) : const Color(0xFFFFFFFF),
                title: model.isOwnUI
                    ? Row(
                        children: const <Widget>[
                          Text(
                            'Flim List',
                            style: TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontSize: 30.0,
                              fontFamily: 'FredokaOne',
                            ),
                          )
                        ],
                      )
                    : const SizedBox(),
                leading: SizedBox(
                  child: IconButton(
                    onPressed: () => Get.back(),
                    icon: Icon(
                      model.isOwnUI ? Icons.arrow_back_ios_new_rounded : Icons.arrow_back_rounded,
                      color: model.isOwnUI ? Colors.white : Colors.black,
                    ),
                  ),
                ),
                centerTitle: false),
            body: const SafeArea(
              child: _HomeBody(),
            ),
          );
        },
        onViewModelReady: (model) {
          model.initialise(context: context, isOwn: isOwnUI);
        },
        viewModelBuilder: () => HomeViewModel());
  }
}
