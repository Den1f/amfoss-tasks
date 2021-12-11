import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:introduction_screen/introduction_screen.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
    );

    return MaterialApp(
      title: 'Introduction screen',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.brown),
      home: OnBoardingPage(),
    );
  }
}

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => HomePage()),
    );
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

  Widget _buildImage(String assetName, [double width = 350]) {
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

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.deepOrange[50],
      globalHeader: Align(
        alignment: Alignment.topRight,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 16, right: 16),

          ),
        ),
      ),
      // globalFooter: SizedBox(
      //   width: double.infinity,
      //   height: 60,
      //   child: ElevatedButton(
      //     child: const Text(
      //       'Let\s go right away!',
      //       style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
      //     ),
      //     onPressed: () => _onIntroEnd(context),
      //   ),
      // ),
      pages: [
        PageViewModel(
          title: "YOGA SURGE",
          body: "Welcome to yoga world ",
          image: _buildImage('images/page1.png'),
          decoration: pageDecoration.copyWith(
            pageColor: Colors.deepOrange[50],
          ),
        ),
        PageViewModel(
          title: "HEALTHY FREAKS EXERCISES",
          body:
          "letting go is the hardest asana",
          image: _buildImage('images/page2.png'),
          decoration: pageDecoration.copyWith(
            pageColor: Colors.deepOrange[50],
          ),
        ),
        PageViewModel(
          title: "CYCLING",
          body:" You cannot always control what goes on outside. But you can always control"
              "what goes on inside",
          image: _buildImage('images/page3.png'),
          decoration: pageDecoration.copyWith(
            pageColor: Colors.deepOrange[50],
          ),
        ),

        PageViewModel(
          title: "MEDITATION",
          body: "The longest journey of any person is the journey inward",
          image: _buildImage('images/page4.png'),
          decoration: pageDecoration.copyWith(
            pageColor: Colors.deepOrange[50],
          )

        // ),
        // PageViewModel(
        //   title: "Deepti Ranjan Das",
        //   body: ""
        //       "Hello, I am from EAC branch and this is the app that"
        //       " I created during my task period. Not so perfect "
        //       "but i tried as much as i could. hehe :)",
        //   image: _buildImage('images/welcome.png'),
        //   decoration: pageDecoration.copyWith(
        //     imageAlignment: Alignment.topCenter,
        //     bodyFlex: 8,
        //     imageFlex: 8,
        //     bodyAlignment: Alignment.topCenter,
        //     pageColor: Colors.deepOrange[50],
        //   )

        ),
        // PageViewModel(
        //   title: "Title of last page - reversed",
        //   image: _buildImage('images/welcome.png'),
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
        //     imageFlex: 6,
        //     bodyAlignment: Alignment.bottomCenter,
        //     imageAlignment: Alignment.topCenter,
        //   ),
        //
        //   reverse: true,
        // ),
      ],
      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      //rtl: true, // Display as right-to-left
      skip: const Text('Skip', style: TextStyle(color: Colors.black)),
      next: const Icon(Icons.arrow_forward, color: Colors.black,),
      done: const Text('Get Started', style: TextStyle(color: Colors.black)
      ),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Colors.black,
        activeColor: Colors.black,
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(60.0)),
        ),
      ),

      // dotsContainerDecorator: const ShapeDecoration(
      //   color: Colors.black87,
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.all(Radius.circular(8.0)),
      //   ),
      // ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Welcome'),
      backgroundColor: Colors.transparent,
      ),

      body: new ListView(
        children: <Widget> [
          Image.asset('assets/images/welcome.png'),
          Text('Deepti Ranjan Das', textAlign: TextAlign.center, textScaleFactor: 2.5,),
          Text('        '),
          Text("Hello, I am from EAC branch and I come from Rourkela, Odisha."
              " I have completed my 12th with science stream. Apart from that I have a keen interest in digital "
              " art, listening to audiobooks, music and painting.", textScaleFactor: 1.5, textAlign: TextAlign.center,

          ),
        Image.asset('assets/images/cheer.png', fit: BoxFit.cover),
        ],
      ),



    );



  }
}