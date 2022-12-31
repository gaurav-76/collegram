import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:project/pages/home_widgets/bottom_bar.dart';
import 'package:intro_slider/dot_animation_enum.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:project/pages/login_option.dart';
import 'package:sizer/sizer.dart';

class IntroSliderPage extends StatefulWidget {
  @override
  _IntroSliderPageState createState() => _IntroSliderPageState();
}

class _IntroSliderPageState extends State<IntroSliderPage> {
  List<Slide> slides = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    slides.add(
      new Slide(
        description: "Welcome to the Collegram 1",
        //pathImage: "assets/images/diwali.png",
      ),
    );
    slides.add(
      new Slide(
        //title: "Movie Tickets",
        description: "Welcome to the Collegram 2",
        // pathImage: "assets/images/Event.png",
      ),
    );
    slides.add(
      new Slide(
        //title: "Great Discounts",
        description: "Welcome to the Collegram 3",
        //pathImage: "assets/images/hallowen.png",
      ),
    );
    slides.add(
      new Slide(
        //title: "World Travel",
        description: "Welcome to the Collegram 4",
        //pathImage: "assets/images/cultural.png",
      ),
    );
  }

  List<Widget> renderListCustomTabs() {
    List<Widget> tabs = [];
    for (int i = 0; i < slides.length; i++) {
      Slide currentSlide = slides[i];
      tabs.add(
        Flexible(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: Container(
              margin: EdgeInsets.only(bottom: 160, top: 60),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Container(
                  //   padding: EdgeInsets.all(20),
                  //   decoration: BoxDecoration(
                  //     shape: BoxShape.circle,
                  //     color: Colors.white,
                  //   ),
                  //   child: Image.asset(
                  //     currentSlide.pathImage =
                  //         currentSlide.pathImage ?? 'default',
                  //     matchTextDirection: true,
                  //     height: 60,
                  //   ),
                  // ),
                  // Container(
                  //   margin: EdgeInsets.only(top: 20),
                  //   child: Text(
                  //     currentSlide.title = currentSlide.title ?? 'default',
                  //     style: TextStyle(color: Colors.white, fontSize: 25),
                  //   ),
                  // ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 30,
                    ),
                    child: Text(
                      currentSlide.description =
                          currentSlide.description ?? 'defualt',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.height * 0.055,
                        height: 1.3,
                      ),
                      maxLines: 3,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    ),
                    margin: EdgeInsets.only(
                      top: 15,
                      left: 20,
                      right: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
    return tabs;
  }

  @override
  Widget build(BuildContext context) {
    // ScreenConfig.init();

    return IntroSlider(
      backgroundColorAllSlides: Color(0xFFd9d9d9),
      renderSkipBtn: Text(
        "Skip",
        style: TextStyle(
            color: Color(0xFFffffff),
            //fontSize: 17.0.sp,
            fontWeight: FontWeight.bold),
      ),
      renderNextBtn: Text(
        "Next",
        style: TextStyle(
            color: Color(0xFFffffff),
            //fontSize: 17.0.sp,
            fontWeight: FontWeight.bold),
      ),
      renderDoneBtn: Text(
        "Done",
        style: TextStyle(
            color: Color(0xFFffffff),
            //fontSize: 17.0.sp,
            fontWeight: FontWeight.bold),
      ),
      colorSkipBtn: Color(0xff293130),
      colorDoneBtn: Color(0xFF293130),
      colorActiveDot: Color(0xFF293130),
      sizeDot: 6.0,
      typeDotAnimation: dotSliderAnimation.SIZE_TRANSITION,
      listCustomTabs: this.renderListCustomTabs(),
      scrollPhysics: BouncingScrollPhysics(),
      hideStatusBar: false,
      onDonePress: () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => LoginOptions(),
        ),
      ),
    );
  }
}
