import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rahaty/styles/assets.dart';
import 'package:rahaty/styles/constants.dart';

class SoundsPage extends StatefulWidget {
  @override
  _SoundsPageState createState() => _SoundsPageState();
}

class _SoundsPageState extends State<SoundsPage> {
  double value = 50;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            title: Text(
              value.floor().toString(),
              style: TextStyle(
                fontSize: 26,
              ),
            ),
            leading: IconButton(
              icon: Icon(
                FontAwesomeIcons.bars,
                color: Colors.white,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.star_rounded,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
            ],
            backgroundColor: Colors.transparent,
            centerTitle: true,
            expandedHeight: 180,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                overflow: Overflow.visible,
                children: [
                  Container(
                    height: 160,
                    padding: EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                      color: darkBlue,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                    ),
                    child: Slider(
                      inactiveColor: Colors.white.withOpacity(.2),
                      max: 100,
                      min: 0,
                      value: value,
                      onChanged: (val) {
                        setState(
                          () {
                            value = val;
                          },
                        );
                      },
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 70,
                    right: 70,
                    child: Container(
                      padding: EdgeInsets.only(bottom: 8),
                      alignment: Alignment.center,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(80),
                      ),
                      child: Text(
                        "أصوات الطبيعة",
                        textAlign: TextAlign.center,
                        style: mainFontStyle.copyWith(
                          fontSize: 20,
                          color: darkGrey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: GridView.builder(
                    padding: EdgeInsets.all(12),
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 19,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: .8,
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (ctx, index) {
                      var color = darkColors[index % darkColors.length];
                      var image = forthPageItems[index % forthPageItems.length];
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Stack(
                          children: [
                            Card(
                              margin: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              color: color,
                              child: Container(),
                            ), //dots

                            Positioned(
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(.3),
                                    borderRadius: BorderRadius.circular(20)),
                                height: 30,
                                width: 30,
                              ),
                              top: 90,
                              right: 15,
                            ),
                            Positioned(
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(.3),
                                    borderRadius: BorderRadius.circular(20)),
                                height: 15,
                                width: 15,
                              ),
                              top: 20,
                              right: 35,
                            ),
                            Positioned(
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(.3),
                                    borderRadius: BorderRadius.circular(60)),
                                height: 60,
                                width: 60,
                              ),
                              bottom: 20,
                              left: 20,
                            ),
                            Positioned(
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(.3),
                                    borderRadius: BorderRadius.circular(100)),
                                height: 100,
                                width: 100,
                              ),
                              top: -30,
                              left: -30,
                            ),
                            //elements
                            Positioned(
                              child: Image.asset(
                                image,
                                height: 100,
                              ),
                              bottom: 15,
                              left: 0,
                            ),
                            Positioned(
                              child: Text(
                                index.toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                ),
                              ),
                              bottom: 15,
                              right: 15,
                            ),
                            Positioned(
                              child: Text(
                                "الطيور",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                ),
                              ),
                              top: 15,
                              right: 15,
                            ),
                          ],
                        ),
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
