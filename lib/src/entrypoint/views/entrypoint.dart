import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';
import 'package:test1/common/utils/kcolors.dart';
import 'package:test1/src/cart/views/cart_screen.dart';
import 'package:test1/src/entrypoint/controllers/bottom_tab_notifier.dart';
import 'package:test1/src/home/views/home_screen.dart';
import 'package:test1/src/profile/views/profile_screen.dart';
import 'package:test1/src/wishlist/views/wishlist_screen.dart';

class AppEntryPoint extends StatelessWidget {
  AppEntryPoint({super.key});

  List<Widget> pageList = [
    const HomePage(),
    const WishListPage(),
    const CartPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<TabIndexNotifier>(
        builder: (context, tabIndexNotifier, child) {
      return Scaffold(
        body: Stack(
          children: [
            pageList[tabIndexNotifier.index],
            Align(
              alignment: Alignment.bottomCenter,
              child: Theme(
                data: Theme.of(context).copyWith(canvasColor: Kolors.kOffWhite),
                child: BottomNavigationBar(
                  selectedFontSize: 12,
                  elevation: 0,
                  backgroundColor: Kolors.kOffWhite,
                  showSelectedLabels: true,
                  showUnselectedLabels: false,
                  currentIndex: tabIndexNotifier.index,
                  selectedItemColor: Kolors.kPrimary,
                  unselectedItemColor: Kolors.kGray,
                  unselectedIconTheme:
                      const IconThemeData(color: Colors.black38),
                  onTap: (i) {
                    tabIndexNotifier.setIndex(i);
                  },
                  items: [
                    BottomNavigationBarItem(
                      icon: tabIndexNotifier.index == 0
                          ? const Icon(
                              AntDesign.home,
                              color: Kolors.kPrimary,
                              size: 24,
                            )
                          : const Icon(
                              AntDesign.home,
                              size: 24,
                            ),
                      label: "Home",
                    ),
                    BottomNavigationBarItem(
                      icon: tabIndexNotifier.index == 1
                          ? const Icon(
                              Ionicons.heart, // Change this icon if desired
                              color: Kolors.kPrimary,
                              size: 24,
                            )
                          : const Icon(
                              Ionicons
                                  .heart_outline, // Change this icon if desired
                            ),
                      label: "Wishlist",
                    ),
                    BottomNavigationBarItem(
                      icon: tabIndexNotifier.index == 2
                          ? const Badge(
                              label: Text('2'),
                              child: Icon(
                                MaterialCommunityIcons
                                    .shopping, // Change this icon if desired
                                color: Kolors.kPrimary,
                                size: 24,
                              ),
                            )
                          : const Badge(
                              label: Text('2'),
                              child: Icon(
                                MaterialCommunityIcons
                                    .shopping_outline, // Change this icon if desired
                              ),
                            ),
                      label: "Cart",
                    ),
                    BottomNavigationBarItem(
                      icon: tabIndexNotifier.index == 3
                          ? const Icon(
                              EvilIcons.user, // Change this icon if desired
                              color: Kolors.kPrimary,
                              size: 34,
                            )
                          : const Icon(
                              EvilIcons.user, // Change this icon if desired
                              size: 34,
                            ),
                      label: "Profile",
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
