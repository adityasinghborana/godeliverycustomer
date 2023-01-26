import 'package:flutter/material.dart';
import 'package:godelivery/screens/storyboardscreen/intropage1.dart';
import 'package:godelivery/screens/storyboardscreen/intropage2.dart';
import 'package:godelivery/screens/storyboardscreen/intropage3.dart';
import 'package:godelivery/screens/storyboardscreen/intropage4.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class StoryBoard extends StatefulWidget {
  const StoryBoard({Key? key}) : super(key: key);

  @override
  State<StoryBoard> createState() => _StoryBoardState();
}

class _StoryBoardState extends State<StoryBoard> {
  PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            PageView(
              controller: _controller,
              children: [
                Intropage1(),
                Intropage2(),
                Intropage3(),
                Intropage4(),
              ],
            ),

            //skip button
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    _controller.jumpToPage(3);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xffBF1D2D),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 65),
                    height: 30,
                    width: 60,
                    alignment: Alignment.topRight,
                    child: Center(
                        child: Text(
                      "skip",
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              alignment: Alignment(
                  0,
                  MediaQuery.of(context).size.height /
                      (MediaQuery.of(context).size.height * 1.30)),
              child: SmoothPageIndicator(
                controller: _controller,
                count: 4,
                effect: SlideEffect(
                    spacing: 15,
                    activeDotColor: Colors.blue,
                    dotColor: Color.fromARGB(255, 205, 205, 205),
                    radius: 6,
                    dotHeight: 10,
                    dotWidth: 10),
              ),
            ),
            //dot indicators
          ],
        ),
      ),
    );
  }
}
