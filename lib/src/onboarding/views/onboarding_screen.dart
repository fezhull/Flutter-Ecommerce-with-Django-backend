import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';
import 'package:test1/common/utils/kcolors.dart';
//import 'package:test1/common/widgets/logout_bottom_sheet.dart';
import 'package:test1/src/onboarding/controllers/onboarding_notifier.dart';
import 'package:test1/src/onboarding/widgets/onboarding_page_one.dart';
import 'package:test1/src/onboarding/widgets/onboarding_page_two.dart';
import 'package:test1/src/onboarding/widgets/welcome_screen.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late final PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(
        initialPage: context.read<OnboardingNotifier>().selectedPage);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          controller: _pageController,
          onPageChanged: (page) {
            context.read<OnboardingNotifier>().setSelectedPage = page;
          },
          children: const [
            OnboardingScreenOne(),
            OnboardingScreenTwo(),
            WelcomeScreen()
          ],
        ),
        context.watch<OnboardingNotifier>().selectedPage == 2
            ? SizedBox.shrink()
            : Positioned(
                bottom: 50.h,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  width: ScreenUtil().screenWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      context.watch<OnboardingNotifier>().selectedPage == 0
                          ? const SizedBox(
                              width: 25,
                            )
                          : GestureDetector(
                              onTap: () {
                                _pageController.animateToPage(
                                    context
                                            .read<OnboardingNotifier>()
                                            .selectedPage -
                                        1,
                                    duration: const Duration(milliseconds: 200),
                                    curve: Curves.easeIn);
                              },
                              child: const Icon(
                                AntDesign.leftcircleo,
                                color: Kolors.kPrimary,
                                size: 30,
                              ),
                            ),
                      SizedBox(
                        width: ScreenUtil().screenWidth * 0.7,
                        height: 50.h,
                        child: PageViewDotIndicator(
                          currentItem:
                              context.watch<OnboardingNotifier>().selectedPage,
                          count: 3,
                          unselectedColor: Colors.black26,
                          selectedColor: Kolors.kPrimary,
                          duration: const Duration(microseconds: 200),
                          onItemClicked: (index) {
                            _pageController.animateToPage(index,
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.easeIn);
                          },
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          _pageController.animateToPage(
                              context.read<OnboardingNotifier>().selectedPage +
                                  1,
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.easeIn);
                        },
                        child: const Icon(
                          AntDesign.rightcircleo,
                          color: Kolors.kPrimary,
                          size: 30,
                        ),
                      )
                    ],
                  ),
                ))
      ],
    ));
  }
}
