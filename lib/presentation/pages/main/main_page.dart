import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:unipres/presentation/misc/app_routes.dart';
import 'package:unipres/presentation/misc/colors.dart';
import 'package:unipres/presentation/pages/home/home_page.dart';
import 'package:unipres/presentation/pages/profile/profile_page.dart';
import 'package:unipres/presentation/providers/routes/router_provider.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({super.key});

  @override
  ConsumerState<MainPage> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  PageController pageController = PageController();
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            onPageChanged: (value) => setState(() {
              selectedIndex = value;
            }),
            children: const [
              HomePage(),
              ProfilePage(),
            ],
          )
        ],
      ),
      bottomNavigationBar: Container(
        height: 97,
        width: MediaQuery.of(context).size.width,
        color: Colors.transparent,
        child: Stack(
          alignment: const FractionalOffset(.5, 1.0),
          children: [
            Positioned(
              bottom: 0,
              child: Container(
                height: 65,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                        color: AppColors.secondaryExtraSoft, width: 1),
                  ),
                ),
                child: BottomAppBar(
                  shape: const CircularNotchedRectangle(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Expanded(
                        child: InkWell(
                          onTap: () => setState(() {
                            selectedIndex = 0;
                            pageController.animateToPage(selectedIndex,
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.easeInOut);
                          }),
                          child: Container(
                            height: 65,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(bottom: 4),
                                  child: (selectedIndex == 0)
                                      ? SvgPicture.asset(
                                          'assets/icons/home-active.svg')
                                      : SvgPicture.asset(
                                          'assets/icons/home.svg'),
                                ),
                                Text(
                                  "Home",
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: AppColors.secondary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 4,
                        margin: const EdgeInsets.only(top: 24),
                        alignment: Alignment.center,
                        child: Text(
                          "Presence",
                          style: TextStyle(
                            fontSize: 10,
                            color: AppColors.secondary,
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () => setState(() {
                            selectedIndex = 1;
                            pageController.animateToPage(selectedIndex,
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.easeInOut);
                          }),
                          child: Container(
                            height: 65,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(bottom: 4),
                                  child: (selectedIndex == 1)
                                      ? SvgPicture.asset(
                                          'assets/icons/profile-active.svg')
                                      : SvgPicture.asset(
                                          'assets/icons/profile.svg'),
                                ),
                                Text(
                                  "Profile",
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: AppColors.secondary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 32,
              child: SizedBox(
                width: 64,
                height: 64,
                child: FloatingActionButton(
                  onPressed: () =>
                      ref.watch(routerProvider).push(Routes.SPLASH),
                  elevation: 0,
                  shape: const CircleBorder(),
                  child: SvgPicture.asset(
                    'assets/icons/fingerprint.svg',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
