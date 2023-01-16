part of favoriteview;

class _FavoritesBody extends ViewModelWidget<FavoritesViewModel> {
  const _FavoritesBody({Key? key}) : super(key: key, reactive: true);
  @override
  Widget build(BuildContext context, FavoritesViewModel model) {
    return Obx(
      () => model.movieController.videos.isEmpty
          ? Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 250.0),
                child: Column(
                  children: const [
                    Text(
                      'Opps!',
                      style: TextStyle(
                        color: Color(0xFF000000),
                        fontSize: 25.0,
                        fontFamily: 'FredokaOne',
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'Results not found',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF000000),
                        fontSize: 14.0,
                      ),
                    )
                  ],
                ),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(10.0),
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: model.movieController.videos.length,
              itemBuilder: (context, index) {
                Video video = model.movieController.videos.keys.toList()[index];
                return Padding(
                  padding: EdgeInsets.only(top: index == 0 ? 0.0 : 10.0),
                  child: model.isOwnUI
                      ? OwnUIMovie(
                          video: video,
                          makeFavorite: () => model.makeFavorite(
                            context,
                            video,
                          ),
                        )
                      : GivenUIMovie(
                          video: video,
                          makeFavorite: () => model.makeFavorite(
                            context,
                            video,
                          ),
                        ),
                );
              },
            ),
    );
  }
}
