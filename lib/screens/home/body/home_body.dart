part of homeview;

class _HomeBody extends ViewModelWidget<HomeViewModel> {
  const _HomeBody({Key? key}) : super(key: key, reactive: true);
  @override
  Widget build(BuildContext context, HomeViewModel model) {
    return model.isOwnUI
        ? Column(
            children: [
              const SizedBox(
                height: 15.0,
              ),
              SearchView(
                hintText: 'Search movies by title',
                readOnly: false,
                searchFocusNode: model.searchFocusNode,
                controller: model.searchControler,
                isType: model.isType,
              ),
              const SizedBox(
                height: 6.0,
              ),
              model.isLoading
                  ? const Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 250.0),
                        child: Text(
                          'Loading...',
                          style: TextStyle(
                            color: Color(0xFF000000),
                            fontSize: 20.0,
                            fontFamily: 'FredokaOne',
                          ),
                        ),
                      ),
                    )
                  : model.videoList.isEmpty
                      ? Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 250.0),
                            child: Column(
                              children: [
                                const Text(
                                  'Opps!',
                                  style: TextStyle(
                                    color: Color(0xFF000000),
                                    fontSize: 25.0,
                                    fontFamily: 'FredokaOne',
                                  ),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                model.searchControler.text.isNotEmpty
                                    ? RichText(
                                        textAlign: TextAlign.center,
                                        text: TextSpan(
                                          style: const TextStyle(
                                            color: Color(0xFF000000),
                                            fontSize: 14.0,
                                          ),
                                          children: [
                                            const TextSpan(text: 'Results not found for '),
                                            TextSpan(
                                              text: "'${model.searchControler.text}'",
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16.0,
                                              ),
                                            ),
                                            const TextSpan(text: ' search keyword'),
                                          ],
                                        ),
                                      )
                                    : const Text(
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
                      : Flexible(
                          child: ListView.builder(
                            padding: const EdgeInsets.all(10.0),
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemCount: model.videoList.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(top: index == 0 ? 0.0 : 10.0),
                                child: OwnUIMovie(
                                  video: model.videoList[index],
                                  makeFavorite: () => model.makeFavorite(
                                    context,
                                    model.videoList[index],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
            ],
          )
        : ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: model.videoList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(top: index == 0 ? 0.0 : 20.0),
                child: GivenUIMovie(
                  video: model.videoList[index],
                  makeFavorite: () => model.makeFavorite(
                    context,
                    model.videoList[index],
                  ),
                ),
              );
            },
          );
  }
}
