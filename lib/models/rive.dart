import 'package:hippo/routes/index.routes.dart';

class RiveAsset {
  final String artboard, stateMachineName, title, src;
  late SMIBool? input;

  RiveAsset(
    this.src, {
    required this.artboard,
    required this.stateMachineName,
    required this.title,
    this.input,
  });

  set setInput(SMIBool smiBool) {
    input = smiBool;
  }
}

List<RiveAsset> bottomNavs = [
  RiveAsset('assets/icons/icons.riv', artboard: 'HOME', stateMachineName: 'HOME_interactivity', title: 'Home'),
  RiveAsset('assets/icons/icons.riv', artboard: 'SEARCH', stateMachineName: 'SEARCH_Interactivity', title: 'Search'),
  RiveAsset('assets/icons/icons.riv', artboard: 'LIKE/STAR', stateMachineName: 'STAR_Interactivity', title: 'Like'),
  RiveAsset('assets/icons/icons.riv', artboard: 'BELL', stateMachineName: 'BELL_Interactivity', title: 'Notification'),
  RiveAsset('assets/icons/icons.riv', artboard: 'SETTINGS', stateMachineName: 'SETTINGS_Interactivity', title: 'Setting'),
];
