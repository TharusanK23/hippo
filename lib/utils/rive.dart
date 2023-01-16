import 'package:hippo/routes/index.routes.dart';

class RiveUtils {
  static StateMachineController getRiveController(Artboard artboard, {stateMachineName = 'State Mechine 1'}) {
    StateMachineController? controller = StateMachineController.fromArtboard(artboard, stateMachineName);
    artboard.addController(controller!);
    return controller;
  }
}
