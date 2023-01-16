part of mainview;

class _MainBody extends ViewModelWidget<MainViewModel> {
  const _MainBody({Key? key}) : super(key: key, reactive: true);
  @override
  Widget build(BuildContext context, MainViewModel model) {
    if (model.isOwnUI) {
      if (model.riveAsset.title == 'Home') {
        return const HomeView(isOwnUI: true);
      } else if (model.riveAsset.title == 'Search') {
        return const Text('Search');
      } else if (model.riveAsset.title == 'Like') {
        return const FavoritesView(isOwnUI: true);
      } else if (model.riveAsset.title == 'Notification') {
        return const Text('Notification');
      } else {
        return const Text('Setting');
      }
    } else {
      return model.widgets.elementAt(model.selectedIndex);
    }
  }
}
