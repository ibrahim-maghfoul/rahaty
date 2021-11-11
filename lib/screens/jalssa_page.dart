import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:rahaty/screens/audio_page.dart';
import 'package:rahaty/styles/assets.dart';
import 'package:rahaty/styles/constants.dart';
import 'dart:math' as math;

class JalssaPage extends StatefulWidget {
  @override
  _JalssaPageState createState() => _JalssaPageState();
}

class _JalssaPageState extends State<JalssaPage> {
  @override
  Widget build(BuildContext context) {
    var rn = math.Random().nextInt(darkColors.length);
    return SafeArea(
      child: Scaffold(
        backgroundColor: backGroundColor,
        body: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              backgroundColor: backGroundColor,
              expandedHeight: 290,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
                      height: 150,
                      width: 130,
                      padding: EdgeInsets.zero,
                      color: darkGrey,
                      child: Column(
                        children: [
                          Text("data"),
                          SizedBox(
                            height: 5,
                          ),
                          Text("5 Jalassat"),
                        ],
                      ),
                    ),
                    Positioned(
                      child: Transform.rotate(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          height: 180,
                          width: 180,
                          decoration: BoxDecoration(
                            color: darkGrey,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              jalasatIntro,
                              width: 1,
                            ),
                          ),
                        ),
                        angle: -math.pi / 4,
                      ),
                      bottom: 29,
                    )
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                <Widget>[
                  verticaleSpace,
                  Center(
                    child: Text(
                      "Go to listen",
                      style: TextStyle(fontSize: 35, color: Colors.white),
                    ),
                  ),
                  verticaleSpace,
                  ListView(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: darkColors.map(
                      (element) {
                        var index = darkColors.indexOf(element);

                        print(index);
                        return GestureDetector(
                          onTap: () {
                            pushNewScreen(
                              context,
                              screen: SoundPage(),
                              withNavBar:
                                  false, // OPTIONAL VALUE. True by default.
                              pageTransitionAnimation:
                                  PageTransitionAnimation.cupertino,
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(60)),
                              color:
                                  darkColors[(index + rn) % darkColors.length],
                              margin: EdgeInsets.zero,
                              child: ListTile(
                                leading: Container(
                                  height: 50,
                                  width: 50,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  child: Icon(
                                    Icons.play_circle_fill_rounded,
                                    color: Colors.white,
                                    size: 40,
                                  ),
                                ),
                                title: Text(
                                  jalasatTitles[darkColors.indexOf(element)],
                                  textAlign: TextAlign.end,
                                ),
                                subtitle: Text(
                                  "5 Jalassat",
                                  textAlign: TextAlign.end,
                                ),
                                trailing: Container(
                                  alignment: Alignment.center,
                                  height: 50,
                                  width: 50,
                                  padding: EdgeInsets.only(bottom: 8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(60),
                                    border: Border.all(
                                      width: 2,
                                      color: (darkColors[(index + rn) %
                                                  darkColors.length] ==
                                              darkGrey)
                                          ? Colors.white
                                          : darkGrey,
                                    ),
                                  ),
                                  child: Text(
                                    "0${index + 1}",
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ).toList(),
                  ),
                  verticaleSpace,
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
