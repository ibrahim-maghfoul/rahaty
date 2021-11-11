import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rahaty/models/jalssa.dart';
import 'package:rahaty/models/jalssa_data.dart';
import 'package:rahaty/styles/assets.dart';
import 'package:rahaty/styles/constants.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    // final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
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
              backgroundColor: backGroundColor,
              expandedHeight: 252,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  padding: EdgeInsets.zero,
                  child: Image.asset(
                    mainPageImg,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                <Widget>[
                  Center(
                    child: Text(
                      "! مرحبا بك",
                      style: TextStyle(fontSize: 40, color: Colors.white),
                    ),
                  ),
                  verticaleSpace,
                  TitleSection(title: "أفضل الجلسات  "),
                  verticaleSpace,
                  Container(
                    height: 230,
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: ListView(
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: darkColors.map(
                          (element) {
                            int index = darkColors.indexOf(element);
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 3.0),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Card(
                                    color: Colors.transparent,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Image.asset(
                                        secondPageBackgrounds[index]),
                                  ),
                                  Positioned(
                                    child: Text(
                                      (jalasatTitles[index] == "الحب")
                                          ? "الحب     "
                                          : jalasatTitles[index],
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    top: 6,
                                    right: 12,
                                  ),
                                  Positioned(
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      color: Colors.transparent,
                                      child: Container(
                                        padding: EdgeInsets.only(bottom: 6),
                                        alignment: Alignment.center,
                                        height: 35,
                                        width: 90,
                                        decoration: BoxDecoration(
                                          gradient: gradientColors[index],
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("5"),
                                            horizontaleSpace,
                                            Text("جلسات"),
                                          ],
                                        ),
                                      ),
                                    ),
                                    bottom: 15,
                                  )
                                ],
                              ),
                            );
                          },
                        ).toList(),
                      ),
                    ),
                  ),
                  verticaleSpace,
                  TitleSection(title: "آخر المتصفحات"),
                  verticaleSpace,
                  CarouselSlider(
                    //carouselController: carouselController,
                    options: CarouselOptions(
                      height: 200,
                      initialPage: 0,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      reverse: false,
                      enableInfiniteScroll: true,
                      autoPlayInterval: Duration(milliseconds: 2500),
                      autoPlayAnimationDuration: Duration(milliseconds: 1000),
                      scrollDirection: Axis.horizontal,
                    ),
                    items: darkColors.map(
                      (item) {
                        return Builder(
                          builder: (BuildContext context) {
                            var color = darkColors[
                                darkColors.indexOf(item) % darkColors.length];
                            return Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 18,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: color,
                                borderRadius: BorderRadius.circular(
                                  6,
                                ),
                              ),
                              child: Stack(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        "التأمل ■",
                                        style: mainFontStyle.copyWith(
                                            color: (color == darkGrey)
                                                ? Colors.white
                                                : darkGrey),
                                      ),
                                      verticaleSpace,
                                      Text(
                                        "التأمل هو طقس ممارسة يقوم فيها الفرد بتدريب عقله لتحفيز الوعي الداخلي، ويحصل في المقابل على فوائد معنوية وذهنية. محتويات",
                                        style: mainFontStyle.copyWith(
                                          fontSize: 16,
                                          color: Colors.white,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.end,
                                        maxLines: 3,
                                      ),
                                    ],
                                  ),
                                  Positioned(
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: Colors.white),
                                      child: FaIcon(
                                        FontAwesomeIcons.chevronLeft,
                                        size: 20,
                                      ),
                                    ),
                                    bottom: 10,
                                    left: 0,
                                  )
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ).toList(),
                  ),
                  verticaleSpace,
                  TitleSection(title: "الجلسات"),
                  ListView(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: jalassat.map(
                      (element) {
                        Jalssa jalssa = jalassat[jalassat.indexOf(element)];
                        var darckColor = darkColors[
                            jalassat.indexOf(element) % mainPageIcons.length];
                        var lightColor = lightColors[
                            jalassat.indexOf(element) % mainPageIcons.length];
                        return Card(
                          margin:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          color: darckColor,
                          child: ListTile(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 12),
                            subtitle: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("جلسات"),
                                horizontaleSpace,
                                Text(jalssa.jalassatCount.toString()),
                              ],
                            ),
                            trailing: Container(
                              padding: EdgeInsets.all(12),
                              child: Image.asset(jalssa.icon),
                              width: 60,
                              decoration: BoxDecoration(
                                color: lightColor,
                                borderRadius: BorderRadius.circular(
                                  12,
                                ),
                              ),
                            ),
                            leading: Container(
                              margin: EdgeInsets.all(6),
                              alignment: Alignment.center,
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: Colors.grey[800],
                                  width: 2,
                                ),
                              ),
                              child: FaIcon(
                                FontAwesomeIcons.chevronLeft,
                                size: 20,
                                color: Colors.white,
                              ),
                            ),
                            title: Text(
                              jalssa.title,
                              textAlign: TextAlign.end,
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

class TitleSection extends StatelessWidget {
  final String title;
  const TitleSection({@required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: mainFontStyle,
        ),
        SizedBox(
          width: 20,
        ),
        Container(
          height: 45,
          width: 8,
          color: darkGrey,
        ),
      ],
    );
  }
}
