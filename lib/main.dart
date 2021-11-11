import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:rahaty/screens/article_page.dart';
import 'package:rahaty/screens/categories_page.dart';
import 'package:rahaty/screens/main_page.dart';
import 'package:rahaty/screens/sounds_page.dart';
import 'package:rahaty/screens/test_page.dart';
import 'package:rahaty/styles/assets.dart';
import 'package:rahaty/styles/constants.dart';
import 'dart:math' as math;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rahaty',
      theme: ThemeData(
        fontFamily: mainFont,
        primarySwatch: Colors.brown,
      ),
      home: TestApp(),
    );
  }
}

class TestApp extends StatefulWidget {
  @override
  _TestAppState createState() => _TestAppState();
}

class _TestAppState extends State<TestApp> {
  PersistentTabController _controller;
  List<Widget> _buildScreens() {
    return [
      TestPage(),
      ArticlesPage(),
      TaamolatPage(),
      MainPage(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: FaIcon(FontAwesomeIcons.headphonesAlt),
        title: ("Listen"),
        activeColorPrimary: darkGreen,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: FaIcon(FontAwesomeIcons.commentMedical),
        title: ("Articles"),
        activeColorPrimary: darkPink,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: FaIcon(FontAwesomeIcons.heartbeat),
        title: ("Taamol"),
        activeColorPrimary: lightYellow,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: FaIcon(FontAwesomeIcons.home),
        title: ("Home"),
        activeColorPrimary: darkBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }

  @override
  void initState() {
    _controller = PersistentTabController(initialIndex: 3);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: darkBlue,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome to our app!",
                    style: mainFontStyle,
                  ),
                  // Row(
                  //   crossAxisAlignment: CrossAxisAlignment.center,
                  //   children: [
                  //     // Transform.rotate(
                  //     //   angle: -math.pi / 4,
                  //     //   child: Image.asset(
                  //     //     jalasatIntro,
                  //     //     fit: BoxFit.cover,
                  //     //     height: 30,
                  //     //     width: 30,
                  //     //   ),
                  //     // ),
                  //     SizedBox(width: 10),
                  //     Text(
                  //       "Welcome to our app!",
                  //       style: mainFontStyle,
                  //     ),
                  //   ],
                  // ),
                  verticaleSpace,
                  Text(
                      "Enjoy it!, you can still always coontact ass for more info about the app or any other things you find weird"),
                  Text(
                    "Made with love",
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.normal,
                    ),
                  )
                ],
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.email_rounded,
                color: darkBlue,
              ),
              title: const Text('Contact Us'),
              trailing: Icon(
                Icons.arrow_forward_ios_rounded,
                color: darkBlue,
              ),
              onTap: () {
                Navigator.of(context).pop();

                // Update the state of the app.
                // ...
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.favorite,
                color: darkBlue,
              ),
              title: const Text('Rate Us'),
              trailing: Icon(
                Icons.arrow_forward_ios_rounded,
                color: darkBlue,
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.share,
                color: darkBlue,
              ),
              title: const Text('Sare'),
              trailing: Icon(
                Icons.arrow_forward_ios_rounded,
                color: darkBlue,
              ),
              onTap: () {
                Navigator.of(context).pop();

                // Update the state of the app.
                // ...
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.business,
                color: darkBlue,
              ),
              title: const Text('Buisness Perposes'),
              trailing: Icon(
                Icons.arrow_forward_ios_rounded,
                color: darkBlue,
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            Divider(),
          ],
        ),
      ),
      body: PersistentTabView(
        context,
        controller: _controller,
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
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: ItemAnimationProperties(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimation(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle:
            NavBarStyle.style11, // Choose the nav bar style with this property.
      ),
    );
  }
}
