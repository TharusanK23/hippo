import 'package:flutter/material.dart';
import 'package:hippo/routes/index.routes.dart';

class BottomView extends StatefulWidget {
  final Function(RiveAsset) selectNav;
  const BottomView({super.key, required this.selectNav});

  @override
  State<BottomView> createState() => _BottomViewState();
}

class _BottomViewState extends State<BottomView> {
  RiveAsset selectedNav = bottomNavs.first;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      margin: const EdgeInsets.only(left: 12.0, right: 12.0, bottom: 12.0, top: 6.0),
      decoration: const BoxDecoration(color: Colors.red, borderRadius: BorderRadius.all(Radius.circular(24.0))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ...List.generate(
            bottomNavs.length,
            (index) => GestureDetector(
              onTap: () {
                if (bottomNavs[index] != selectedNav) {
                  setState(() {
                    selectedNav = bottomNavs[index];
                  });
                  widget.selectNav(selectedNav);
                }
                bottomNavs[index].input!.change(true);
                Future.delayed(const Duration(seconds: 2), () {
                  bottomNavs[index].input!.change(false);
                });
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedBar(isActive: bottomNavs[index] == selectedNav),
                  SizedBox(
                    height: 36.0,
                    width: 36.0,
                    child: Opacity(
                      opacity: bottomNavs[index] == selectedNav ? 1.0 : 0.5,
                      child: RiveAnimation.asset(
                        bottomNavs[index].src,
                        artboard: bottomNavs[index].artboard,
                        onInit: (artboard) {
                          StateMachineController controller = RiveUtils.getRiveController(
                            artboard,
                            stateMachineName: bottomNavs[index].stateMachineName,
                          );
                          bottomNavs[index].input = controller.findSMI('active') as SMIBool;
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class AnimatedBar extends StatelessWidget {
  const AnimatedBar({
    Key? key,
    required this.isActive,
  }) : super(key: key);

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: 4.0,
      width: isActive ? 25.0 : 0,
      margin: const EdgeInsets.only(bottom: 2.0),
      decoration: const BoxDecoration(
        color: Colors.cyan,
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
      ),
    );
  }
}
