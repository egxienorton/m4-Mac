import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../core/typography/typo.dart';
import '../../constants/constants.dart';
import 'jumbomodel.dart';
// import 'package:studynautz/launcher/pages/homePage/jumbomodel.dart';
// import 'package:studynautz/launcher/pages/homePage/smart_info_bar.dart';
// import 'package:scroll_snap_list/scroll_snap_list.dart';

class InfotainmentWidget extends ConsumerStatefulWidget {
  const InfotainmentWidget({
    super.key,
  });

  @override
  ConsumerState<InfotainmentWidget> createState() => _InfotainmentWidgetState();
}

class _InfotainmentWidgetState extends ConsumerState<InfotainmentWidget> {
  getContent() {
    Future.delayed(Duration(milliseconds: 200), () {
      // var notifier = ref.watch(geminiInfotainmentControllerProvider.notifier);

      // notifier.generateUserContent();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getContent();
    super.initState();
  }

  // List<JumbotronContent> data = [];
  int _focusedIndex = 0;

  void _onItemFocus(int index) {
    setState(() {
      _focusedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // var provider = ref.watch(geminiInfotainmentControllerProvider);
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          // color: Get.isDarkMode ? Colors.black : Colors.white,
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'For you',
                    textAlign: TextAlign.start,
                    style: AppTypography.header2(context),
                  ),
                  IconButton(
                      onPressed: () {
                        // Get.to(() => NewsScreen());
                      },
                      icon: Icon(Icons.more_horiz))
                ],
              ),
            ),
            Expanded(
                child: true
                    ? ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          // final infotain = {};
                          return Column(
                            children: [
                              Text("infotain.content"),
                              Text("infotain.type")
                            ],
                          );
                        })
                    : Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: SizedBox(
                                  width: MediaQuery.of(context).size.width * .1,
                                  // height: 20,
                                  child: LoadingAnimationWidget.discreteCircle(
                                      color: kAppColor,
                                      // rightDotColor: kBackgroundColor,
                                      size: 40)
                                  // child: Lottie.asset(
                                  //   'assets/lottieFiles/blue_sand_loader.json',
                                  // ),
                                  ),
                            ),
                          ],
                        ),
                      )),
          ],
        ),
      ),
    );
  }

  Widget _buildListItem(
      BuildContext context, int index, List<JumbotronContent> content) {
    //horizontal
    return Container(
      width: 35,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            // height: content[index].toDouble()*2,
            // height: ,
            width: 25,
            color: Colors.lightBlueAccent,
            child: Column(
              children: [
                Text(content[index].content),
                Text(content[index].type)
              ],
            ),
          )
        ],
      ),
    );
  }
}
