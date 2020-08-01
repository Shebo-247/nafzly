import 'package:flutter/material.dart';
import 'package:nafzly/models/slide_model.dart';
import 'package:nafzly/utils/constants.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  List<SlideModel> slides = [
    SlideModel(
      pageImagePath: 'assets/images/Wazafny-Logo-white.png',
      pageHeader: 'Never miss an opportunity.',
      pageContent: 'Easily find works, chat, and collaborate on the go.',
    ),
    SlideModel(
      pageImagePath: 'assets/images/Wazafny-Logo-white.png',
      pageHeader: 'Find intersting projects and submit proposals.',
      pageContent:
          'Stand out by replying to clients quickly and getting to work.',
    ),
    SlideModel(
      pageImagePath: 'assets/images/Wazafny-Logo-white.png',
      pageHeader: 'Collaborate on the go.',
      pageContent: 'Chat, share files, and complete projects.',
    ),
  ];

  int currentSlide = 0;

  Widget _buildSlidePage(SlideModel model) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          model.pageImagePath,
          height: 200,
          width: 200,
        ),
        SizedBox(height: 100),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            model.pageHeader,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(height: 20),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 35),
          child: Text(
            model.pageContent,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w300,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSlideIndicator(bool isCurrentSlide) {
    return Container(
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        color: isCurrentSlide ? Colors.green : Colors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.primaryColorDark,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 30),
            Image.asset(
              'assets/images/Wazfny-logo-text-white.png',
              height: 70,
            ),
            Expanded(
              flex: 2,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() => currentSlide = value);
                },
                itemCount: slides.length,
                itemBuilder: (context, index) {
                  return _buildSlidePage(slides[index]);
                },
              ),
            ),
            SizedBox(height: 25),
            Container(
              width: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _buildSlideIndicator(currentSlide == 0),
                  _buildSlideIndicator(currentSlide == 1),
                  _buildSlideIndicator(currentSlide == 2),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 60,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, loginPage);
                },
                color: appTheme.primaryColor,
                child: Text(
                  'Login'.toUpperCase(),
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, signUpPage);
                },
                child: Text(
                  'New to Wazafny ? Sign Up',
                  style: TextStyle(fontSize: 18, color: appTheme.primaryColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
