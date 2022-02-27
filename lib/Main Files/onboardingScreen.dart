import 'package:flutter/material.dart';
import 'package:notes_app/Main%20Files/homePage.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final controller = PageController();
  bool isLastPage = false;

  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.only(bottom: 80),
        child: PageView(
          controller: controller,
          onPageChanged: (index) {
            setState(() => isLastPage = index == 2);
          },
          children: [
            buildPage(
                color: Colors.blue,
                UrlImage: "assets/file/1.png",
                title: "Write Down Notes",
                description:
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,"),
            buildPage(
                color: Colors.green,
                UrlImage: "assets/file/2.png",
                title: "Measure different Objects",
                description:
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,"),
            buildPage(
                color: Colors.red,
                UrlImage: "assets/file/3.png",
                title: "Know your direction",
                description:
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,"),
          ],
        ),
      ),
      bottomSheet: isLastPage
          ? TextButton(
              style: TextButton.styleFrom(
                  primary: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)),
                  backgroundColor: Color.fromARGB(255, 238, 166, 10),
                  alignment: Alignment.bottomCenter,
                  minimumSize: Size.fromHeight(70)),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Home_Page()));
              },
              child: Text(
                "Get Started",
                style: TextStyle(fontSize: 30),
              ))
          : Container(
              padding: EdgeInsets.only(bottom: 15),
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () => controller.jumpToPage(2),
                      child: Text(
                        "Skip",
                        style: TextStyle(
                            color: Color.fromARGB(255, 238, 166, 10),
                            fontSize: 20),
                      )),
                  Center(
                    child: SmoothPageIndicator(
                      controller: controller,
                      count: 3,
                      effect: WormEffect(
                          spacing: 15,
                          dotColor: Colors.black26,
                          activeDotColor: Color.fromARGB(255, 238, 166, 10)),
                      onDotClicked: (index) => controller.animateToPage(index,
                          duration: Duration(milliseconds: 200),
                          curve: Curves.easeInOut),
                    ),
                  ),
                  TextButton(
                    onPressed: () => controller.nextPage(
                        duration: Duration(milliseconds: 200),
                        curve: Curves.easeInOut),
                    child: Text(
                      "Next",
                      style: TextStyle(
                          color: Color.fromARGB(255, 238, 166, 10),
                          fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

buildPage({
  required Color color,
  required String UrlImage,
  required String title,
  required String description,
}) =>
    Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 350,
            width: 320,
            child: Image.asset(
              UrlImage,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Text(
            title,
            style: TextStyle(
                color: Color.fromARGB(209, 2, 2, 2),
                fontSize: 32,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              description,
              style: TextStyle(
                color: Color.fromARGB(209, 78, 78, 78),
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
