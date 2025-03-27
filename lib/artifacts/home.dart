// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_icons/flutter_svg_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:routemaster/routemaster.dart';
import '../core/typography/typo.dart';
// import 'package:studynautz/auth/provider/user_provider.dart';
import '../constants/constants.dart';
import '../constants/kustom_backgrounds.dart';
import 'infotainment/widget.dart';
// import 'package:studynautz/launcher/pages/homePage/smart_info_bar.dart';
import '../constants/route_constants.dart';
import 'infotainment/smart_search.dart';

class StudynautzHomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final launcherManager = ref.watch(launcherManagerProvider.notifier);
    // final userProvider = ref.read(currentUserProvider);
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColorDark,
        // backgroundColor: Colors.black,
        body: Stack(
      children: [
        Positioned.fill(
          child: CustomPaint(
            size: Size.infinite,
            painter: BackgroundPainterUtils.gridPatternLinearGradient(
              startColor: Colors.blue.shade100,
              endColor: Color.fromARGB(255, 210, 108, 31),
            ),
          ),
        ),
        SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // if (userProvider.value != null)
                            //   Text(
                            //     'Hi, ${userProvider.value!.displayName}',
                            // ... rest of the Text widget
                            // ),

                            // Text(
                            //     '${MyDateUtil.getMessageTime(context: context, time: DateTime.now().millisecondsSinceEpoch.toString())}',
                            //     style: TextStyle(
                            //         fontFamily: 'Satoshis',
                            //         color: Colors.blue[200]))
                          ],
                        ),
                        //TODO: Readapt UI to match flex theme colors
                        //Notification icon
                        InkWell(
                          onTap: () {
                            // Get.to(() => Notifications());
                            // ExDialogs.showSnackbar(context,
                            //     'You do not have any notifications yet');
                            Routemaster.of(context)
                                .push(RouteConstants.settingsLauncher);
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(.5),
                                  // color: Colors.blue[600],
                                  borderRadius: BorderRadius.circular(12)),
                              padding: EdgeInsets.all(8),
                              child: Icon(
                                EvaIcons.bell,
                                color: Colors.white,
                              )),
                        )
                      ],
                    ),

                    // Search bar

                    SizedBox(
                      height: 5,
                    ),

                    //TODO: Bug fixes
                    // SmartSearchBar(),
                    GestureDetector(
                      onTap: () {
                        // Get.to(() => GPT2ChatPage());
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor.withOpacity(.5),
                          // color: Colors.blue[600],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: EdgeInsets.all(8),
                        child: Row(
                          children: [
                            Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Search',
                              style: TextStyle(
                                  fontFamily: 'Satoshis', color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),

                    homeGrid(context),
                  ],
                ),
              ),
              SizedBox(
                height: 60,
              ),
              InfotainmentWidget(),
            ],
          ),
        ),
      ],
    ));
  }

  Widget homeGrid(BuildContext context) {
    List<Widget> icons = [
      XHomeIcon(
        name: 'Learn',
        icon: 'assets/icons/think.svg',
        onPressed: () {
          Routemaster.of(context).push(ELearningRoutes.welcomeScreen);
          // Routemaster.of(context).push(RouteConstants.solvoLauncher);
          // launcherManager.deactivate();
          // Splasher.showSolvoSplashScreen(context);
          // Get.to(() => SolvoHome());
          // Get.delete<LauncherManager>(tag: 'schedule_tab_controller');
        },
      ),
      XHomeIcon(
        name: 'Calendar',
        // icon: 'assets/icons/networking-collaboration.svg',
        icon: 'assets/icons/chat-chat.svg',
        onPressed: () {
          Routemaster.of(context).push(RouteConstants.calendarLauncher);
          // Splasher.showSocialSplashScreen(context);
          // Get.to(() => SocialMain());
        },
      ),
      // XHomeIcon(
      //     name: 'Study',
      //     icon: 'assets/icons/desk-chair.svg',
      //     onPressed: () {
      //       Routemaster.of(context).push(ELearningRoutes.welcomeScreen);
      //       // Splasher.showStudySplashScreen(context);
      //       // Get.to(() => CourseraHome());
      //     }),
      // InkWell(
      //   child: XHomeIcon(
      //     name: 'Gemin-eye',
      //     icon: 'assets/icons/microscope.svg',
      //     onPressed: () {},
      //   ),
      // ),
      XHomeIcon(
        name: 'Notes',
        icon: 'assets/icons/exam.svg',
        onPressed: () {
          Routemaster.of(context).push(RouteConstants.notesLauncher);
        },
      ),
      XHomeIcon(
        name: 'Gemiscope',
        icon: 'assets/icons/browser.svg',
        onPressed: () {
          Routemaster.of(context).push(AiRoutes.gemiScope);
          // Routemaster.of(context).push(AiRoutes.studyToolsScreen);
        },
      ),
      XHomeIcon(
        name: 'e-Class',
        icon: 'assets/icons/classroom.svg',
        onPressed: () {
          // Splasher.showClassSplashScreen(context);
          // Get.to(() => EClass());
        },
      ),
      XHomeIcon(
        name: 'FlashCards',
        icon: 'assets/icons/newspaper.svg',
        onPressed: () {
          Routemaster.of(context).push(RouteConstants.flashCardsLauncher);
        },
      ),
      XHomeIcon(
        name: 'TODO',
        icon: 'assets/icons/highlighter-underline.svg',
        onPressed: () {
          Routemaster.of(context).push(RouteConstants.todoLauncher);
        },
      ),
      // XHomeIcon(
      //   name: 'Games',
      //   icon: 'assets/icons/gamepad.svg',
      //   onPressed: () {
      //     Routemaster.of(context).push(RouteConstants.gameLauncher);
      //     // Get.to(() => GameHome());
      //     // Splasher.showGameSplashScreen(context);
      //     // Get.to(() => GameLauncherPro());
      //   },
      // ),
      XHomeIcon(
        name: 'Calculator',
        icon: 'assets/icons/calculator.svg',
        onPressed: () {
          // Get.to(() => AdvancedCalc());
          Routemaster.of(context).push(RouteConstants.calculatorLauncher);
        },
      ),
    ];
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          // color: Colors.amber,
        ),
        height: MediaQuery.of(context).size.height * 0.25,
        // padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 90,
                childAspectRatio: 1,
                crossAxisSpacing: 2,
                mainAxisSpacing: 5),
            itemCount: icons.length,
            itemBuilder: (_, index) {
              return icons[index];
            })
        // child: GridView.count(
        //   crossAxisCount: 5, // Number of columns in the grid
        //   childAspectRatio: 1,
        //   shrinkWrap: true,

        //   padding: EdgeInsets.all(0), // Aspect ratio to maintain square design
        //   children: [],
        // ),
        );
  }
}

class HomeIcon extends StatelessWidget {
  const HomeIcon({
    required this.icon,
    required this.name,
    required this.onPressed,
    super.key,
  });

  final String name;
  final IconData icon;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        children: [
          Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 190, 139, 10),
                  // color: Theme.of(context).primaryColor.withOpacity(.5),
                  // decoration: BoxDecoration(
                  //     color: Theme.of(context).primaryColor.withOpacity(.6),
                  borderRadius: BorderRadius.circular(10)),
              child: Icon(icon, color: Color(0xfffffb801))),
          // color: Get.isDarkMode ? Colors.white : Colors.white)),
          SizedBox(
            height: 2.5,
          ),
          Text(
            name,
            style: TextStyle(
                fontFamily: 'Aspira', fontSize: 9, color: Colors.white),
          )
        ],
      ),
    );
  }
}

class XHomeIcon extends StatelessWidget {
  const XHomeIcon({
    required this.icon,
    required this.name,
    this.Ai = false,
    required this.onPressed,
    super.key,
  });

  final String name;
  final String icon;
  final bool? Ai;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                // color: Theme.of(context).primaryColor.withOpacity(.5),
                color: Color.fromARGB(255, 190, 139, 10),
                // decoration: BoxDecoration(
                //     color: Theme.of(context).primaryColor.withOpacity(.6),
                borderRadius: BorderRadius.circular(10)),
            child: SvgIcon(
              icon: SvgIconData(
                icon,
                colorSource: SvgColorSource.specialColors,
              ),
              size: 32,
            ),
          ),
          SizedBox(
            height: 2.5,
          ),
          Text(
            name,
            style: TextStyle(
                fontFamily: 'Aspira', fontSize: 9, color: Colors.white),
          ),
          SizedBox(
            height: 2.5,
          ),
        ],
      ),
    );
  }
}
