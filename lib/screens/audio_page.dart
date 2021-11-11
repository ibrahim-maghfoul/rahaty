import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rahaty/screens/jalssa_page.dart';
import 'package:rahaty/styles/assets.dart';
import 'package:rahaty/styles/constants.dart';

class SoundPage extends StatefulWidget {
  @override
  _SoundPageState createState() => _SoundPageState();
}

class _SoundPageState extends State<SoundPage>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;
  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 20),
    );

    animation = Tween<double>(
      begin: 0,
      end: 12.5664, // 2Radians (360 degrees)
    ).animate(animationController);
    animationController.forward();
    animation.addStatusListener(
      (status) {
        if (status == AnimationStatus.completed) {
          animationController.repeat();
        }
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   actions: [
      //     IconButton(
      //       icon: Icon(Icons.share),
      //       onPressed: () {},
      //     ),
      //     IconButton(
      //       icon: Icon(Icons.favorite),
      //       onPressed: () {},
      //     ),
      //   ],
      // ),
      body: SafeArea(
        child: Stack(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Image.asset(
                  jalasatBgs,
                  fit: BoxFit.fill,
                  height: double.infinity,
                  width: double.infinity,
                ),
                Positioned(
                  child: Card(
                    elevation: 4,
                    child: Container(
                      height: 800,
                      width: 800,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(400)),
                    ),
                    color: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        400,
                      ),
                    ),
                  ),
                  bottom: -750,
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop(context);
                        }),
                    Spacer(),
                    Text(
                      "كيف نتأمل ؟",
                      style: mainFontStyle,
                    ),
                    Spacer(),
                    IconButton(
                        icon: Icon(
                          Icons.share,
                        ),
                        onPressed: null),
                    IconButton(
                        icon: Icon(
                          Icons.favorite,
                        ),
                        onPressed: null),
                  ],
                ),
                verticaleSpace,
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 50),
                  child: AnimatedBuilder(
                    animation: animationController,
                    builder: (context, child) => Transform.rotate(
                      angle: animation.value,
                      child: Image.asset(
                        jalasatItem,
                      ),
                    ),
                  ),
                ),
                Text(
                  "كيف نتأمل ؟",
                  style: TextStyle(color: Colors.white, fontSize: 34),
                ),
                verticaleSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("00:00"),
                    Container(
                      margin: EdgeInsets.only(top: 12),
                      width: MediaQuery.of(context).size.width / 1.5,
                      child: Slider(
                        value: 50,
                        onChanged: (val) {},
                        min: 0,
                        max: 100,
                      ),
                    ),
                    Text("2:12"),
                  ],
                ),
                verticaleSpace,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        iconSize: 45,
                        icon: Center(
                          child: Icon(
                            Icons.skip_previous,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: null),
                    Container(
                      decoration: BoxDecoration(
                        color: darkGrey,
                        borderRadius: BorderRadius.circular(
                          200,
                        ),
                      ),
                      margin: EdgeInsets.zero,
                      child: IconButton(
                          padding: EdgeInsets.zero,
                          iconSize: 100,
                          icon: Center(
                            child: Icon(
                              Icons.play_circle_fill_rounded,
                              color: Colors.white,
                            ),
                          ),
                          onPressed: null),
                    ),
                    IconButton(
                        iconSize: 45,
                        icon: Center(
                          child: Icon(
                            Icons.skip_next,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: null),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
