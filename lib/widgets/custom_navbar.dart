import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:pinme/utils/color_utils.dart';
import 'package:pinme/utils/extensions.dart';
import 'package:pinme/utils/image_utils.dart';
import 'package:pinme/views/add%20pins/add_new_pin1.dart';
import 'package:pinme/views/add%20pins/add_new_pin2.dart';
import 'package:pinme/views/all%20pins/all_pins.dart';
import 'package:pinme/views/home/home.dart';
import 'package:pinme/views/notification/notification_screen.dart';
import 'package:pinme/views/profile/profile_screen.dart';


class MyPersistentBottomNavBar extends StatelessWidget{
  MyPersistentBottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Persistent Bottom Nav Bar',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: const BottomNavBar(),
    );

  }
}


class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    PersistentTabController controller1;
    controller1 = PersistentTabController(initialIndex: 0);

    List<Widget> _buildScreens() {
      return [
        const Home(),
        const AllPins(),
        const AddNewPin1(),
        const NotificationScreen(),
        const ProfileScreen(),
      ];
    }

    List<PersistentBottomNavBarItem> _navBarsItems() {
      return [
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.home),
         // title: ("Home"),
          activeColorPrimary: ColorUtils.onboardHeading,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.menu),
         // title: ("Categories"),
          activeColorPrimary: ColorUtils.onboardHeading,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: Image.asset(
            ImageUtils.logoWhite,
            //height: 0.5.h,
          ),
          //iconSize: 3.0,
          activeColorPrimary: ColorUtils.onboardHeading,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.notifications),
          //title: ("Notifications"),
          activeColorPrimary: ColorUtils.onboardHeading,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.person),
          //title: ("Account"),
          // filter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 0, tileMode: TileMode.clamp),
          activeColorPrimary: ColorUtils.onboardHeading,
          inactiveColorPrimary: Colors.grey,
        ),
      ];
    }

    return  Scaffold(
      key: scaffoldKey,
      //extendBodyBehindAppBar: true,
      // appBar: CustomAppbar(
      //   onMenuClicked: ()=> controller.scaffoldKey.currentState!.openEndDrawer(),
      // ),
      //endDrawer: CustomDrawer(),
      body: PersistentTabView(
        context,
        controller: controller1,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.white, // Default is Colors.white.
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset:
        true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardShows:
        true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              offset: const Offset(0, -1), // Controls the position of the shadow
              blurRadius: 6.0, // Controls the size/blur of the shadow
            ),
          ],
          borderRadius: BorderRadius.circular(0),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: const ItemAnimationProperties(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle:
        NavBarStyle.style15, // Choose the nav bar style with this property.
      ),
    );

  }
}













