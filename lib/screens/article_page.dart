import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rahaty/styles/constants.dart';

class ArticlesPage extends StatefulWidget {
  @override
  _ArticlesPageState createState() => _ArticlesPageState();
}

class _ArticlesPageState extends State<ArticlesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            centerTitle: true,
            expandedHeight: 140,
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
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: -540,
                    child: Container(
                      height: 700,
                      width: 700,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1000),
                        color: Color(0xffFBF7F3),
                      ),
                    ),
                  ),
                  Text(
                    "مواضيع",
                    style: mainFontStyle.copyWith(
                      fontSize: 34,
                      color: darkGrey,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                ListView.builder(
                  padding: EdgeInsets.zero,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: darkColors.length,
                  itemBuilder: (ctx, index) {
                    var color = darkColors[(index + 5) % darkColors.length];
                    return Stack(
                      children: [
                        Card(
                          margin:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                          color: color,
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12.0,
                                  vertical: 8,
                                ),
                                child: Column(
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
                                    SizedBox(
                                      height: 50,
                                    )
                                  ],
                                ),
                              ),
                              Positioned(
                                child: Card(
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: Colors.white),
                                    child: FaIcon(
                                      FontAwesomeIcons.chevronLeft,
                                      size: 20,
                                    ),
                                  ),
                                ),
                                bottom: 10,
                                left: 10,
                              )
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
                verticaleSpace,
              ],
            ),
          )
        ],
      ),
    );
  }
}
