import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:rahaty/models/jalssa.dart';
import 'package:rahaty/models/jalssa_data.dart';
import 'package:rahaty/screens/jalssa_page.dart';
import 'package:rahaty/styles/constants.dart';

class TaamolatPage extends StatefulWidget {
  @override
  _TaamolatPageState createState() => _TaamolatPageState();
}

class _TaamolatPageState extends State<TaamolatPage> {
  int selectedTab = 3;
  @override
  void initState() {
    selectTab(selectedTab);
    super.initState();
  }

  void selectTab(int i) {
    setState(() {
      selectedTab = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            leading: IconButton(
              icon: Icon(
                FontAwesomeIcons.bars,
                color: darkGrey,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.star_rounded,
                  color: darkGrey,
                  size: 30,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
            ],
            backgroundColor: Colors.transparent,
            centerTitle: true,
            title: Text(
              "التأملات",
              style: mainFontStyle.copyWith(fontSize: 34),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                verticaleSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        selectTab(0);
                      },
                      child: TabBarItem(
                        title: "All",
                        selectedIndex: selectedTab,
                        tabIndex: 0,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        selectTab(1);
                      },
                      child: TabBarItem(
                        title: "Favorite",
                        selectedIndex: selectedTab,
                        tabIndex: 1,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        selectTab(2);
                      },
                      child: TabBarItem(
                        title: "Darija",
                        selectedIndex: selectedTab,
                        tabIndex: 2,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        selectTab(3);
                      },
                      child: TabBarItem(
                        title: "Fosha",
                        selectedIndex: selectedTab,
                        tabIndex: 3,
                      ),
                    )
                  ],
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: GridView.builder(
                    padding: EdgeInsets.all(12),
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: jalassat.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 0,
                      crossAxisSpacing: 10,
                      childAspectRatio: 0.55,
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (ctx, index) {
                      Jalssa jalssa = jalassat[index];

                      return JalssaCard(
                        index: index,
                        image: jalssa.bgImage,
                      );
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TabBarItem extends StatelessWidget {
  final String title;
  final int tabIndex;
  final int selectedIndex;

  TabBarItem(
      {@required this.title,
      @required this.tabIndex,
      @required this.selectedIndex});
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      height: 45,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 22, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          40,
        ),
        color: (tabIndex == selectedIndex) ? darkGrey : Colors.transparent,
      ),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}

class JalssaCard extends StatelessWidget {
  final int index;
  final String image;
  JalssaCard({@required this.index, @required this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        pushNewScreen(
          context,
          screen: JalssaPage(),
          withNavBar: false, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (context) {
        //       return JalssaPage();
        //     },
        //   ),
        // );
      },
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            overflow: Overflow.visible,
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                color: Colors.transparent,
                margin: EdgeInsets.zero,
                child: Image.asset(
                  image,
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                child: Text(
                  jalasatTitles[index],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                  ),
                ),
                top: 15,
                right: 20,
              ),
              Positioned(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  color: Colors.transparent,
                  margin: EdgeInsets.zero,
                  child: Container(
                    alignment: Alignment.center,
                    height: 40,
                    width: 90,
                    decoration: BoxDecoration(
                      gradient: gradientColors[index],
                      borderRadius: BorderRadius.circular(6),
                      //color: darkColors[index]),
                    ),
                    child: (Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "5",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          "  جلسات",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                        horizontaleSpace,
                      ],
                    )),
                  ),
                ),
                bottom: -20,
              )
            ],
          ),
        ],
      ),
    );
  }
}
