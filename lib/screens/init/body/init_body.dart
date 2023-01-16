part of initview;

class _InitBody extends ViewModelWidget<InitViewModel> {
  const _InitBody({Key? key}) : super(key: key, reactive: true);
  @override
  Widget build(BuildContext context, InitViewModel model) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              elevation: 0,
            ),
            onPressed: () => Get.to(const MainView(
              isOwnUI: false,
            )),
            child: const Text("Given UI"),
          ),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.red,
              side: const BorderSide(
                color: Colors.red,
              ),
            ),
            onPressed: () => Get.to(const MainView(
              isOwnUI: true,
            )),
            child: const Text("Own UI"),
          ),
        ],
      ),
    );
  }
}
