import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:vroom_driver/Auth/SignIn/sign_in.dart';
import 'package:vroom_driver/Auth/loginPage.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd() {
    Get.off(() => LoginPage());
  }

  Widget _buildFullscrenImage() {
    return Image.asset(
      'assets/fullscreen.jpg',
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
    );
  }

  Widget _buildImage(String assetName, [double width = 250]) {
    return Image.asset('assets/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return Scaffold(
      body: IntroductionScreen(
        key: introKey,
        globalBackgroundColor: Colors.white,
        globalHeader: Align(
          alignment: Alignment.topRight,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 16, right: 16),
              // child: _buildImage('flutter.png', 100),
            ),
          ),
        ),
        globalFooter: Padding(
          padding: const EdgeInsets.only(bottom: 30, left: 30, right: 30),
          child: SizedBox(
            width: double.infinity,
            height: 45,
            child: ElevatedButton(
              child: const Text(
                'Get started',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              onPressed: () => _onIntroEnd(),
            ),
          ),
        ),
        pages: [
          PageViewModel(
            titleWidget: Text(
              "International Shipping",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            bodyWidget: Text(
              "Shipping internationally is a great way to grow your  business. we are here to help you grow",
              style: TextStyle(
                fontSize: 15,
              ),
              textAlign: TextAlign.center,
            ),
            image: _buildImage(
              'homeBackground.png',
            ),
            decoration: pageDecoration,
          ),
          PageViewModel(
            titleWidget: Text(
              "Be Secured",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            bodyWidget: Text(
              "We ensures that the package  delivered to the address that the buyer had entered at the time of purchase",
              style: TextStyle(
                fontSize: 15,
              ),
              textAlign: TextAlign.center,
            ),
            image: _buildImage('pana.png'),
            decoration: pageDecoration,
          ),
          PageViewModel(
            titleWidget: Text(
              "Fast Delivery",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            bodyWidget: Text(
              "Fast Delivery Services specializes in providing excellent airfreight forwarding services to  customers. ",
              style: TextStyle(
                fontSize: 15,
              ),
              textAlign: TextAlign.center,
            ),
            image: _buildImage('delv.png'),
            decoration: pageDecoration,
          ),
          // PageViewModel(
          //   title: "Full Screen Page",
          //   body:
          //       "Pages can be full screen as well.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc id euismod lectus, non tempor felis. Nam rutrum rhoncus est ac venenatis.",
          //   image: _buildFullscrenImage(),
          //   decoration: pageDecoration.copyWith(
          //     contentMargin: const EdgeInsets.symmetric(horizontal: 16),
          //     fullScreen: true,
          //     bodyFlex: 2,
          //     imageFlex: 3,
          //   ),
          // ),
          // PageViewModel(
          //   title: "Another title page",
          //   body: "Another beautiful body text for this example onboarding",
          //   image: _buildImage('img2.jpg'),
          //   footer: ElevatedButton(
          //     onPressed: () {
          //       introKey.currentState?.animateScroll(0);
          //     },
          //     child: const Text(
          //       'FooButton',
          //       style: TextStyle(color: Colors.white),
          //     ),
          //     style: ElevatedButton.styleFrom(
          //       primary: Colors.lightBlue,
          //       shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(8.0),
          //       ),
          //     ),
          //   ),
          //   decoration: pageDecoration,
          // ),
          // PageViewModel(
          //   title: "Title of last page - reversed",
          //   bodyWidget: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: const [
          //       Text("Click on ", style: bodyStyle),
          //       Icon(Icons.edit),
          //       Text(" to edit a post", style: bodyStyle),
          //     ],
          //   ),
          //   decoration: pageDecoration.copyWith(
          //     bodyFlex: 2,
          //     imageFlex: 4,
          //     bodyAlignment: Alignment.bottomCenter,
          //     imageAlignment: Alignment.topCenter,
          //   ),
          //   image: _buildImage('img1.jpg'),
          //   reverse: true,
          // ),
        ],
        showDoneButton: false,
        onDone: () => _onIntroEnd(),
        //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
        // showSkipButton: true,
        skipFlex: 0,
        nextFlex: 0,
        //rtl: true, // Display as right-to-left
        showNextButton: false,
        skip: const Text('Skip'),
        // next: const Icon(Icons.arrow_forward),
        done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
        curve: Curves.fastLinearToSlowEaseIn,
        controlsMargin: const EdgeInsets.all(16),
        controlsPadding: kIsWeb
            ? const EdgeInsets.all(12.0)
            : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
        dotsDecorator: const DotsDecorator(
          size: Size(10.0, 10.0),
          color: Color(0xFFBDBDBD),
          activeSize: Size(22.0, 10.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
        ),
        dotsContainerDecorator: const ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
        ),
      ),
    );
  }
}
