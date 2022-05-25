import 'package:flutter/material.dart';
import 'package:flutter_application_1/home_page/home_view.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class Carousel extends StatefulWidget {
  const Carousel({
    Key? key,
  }) : super(key: key);

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  late PageController _pageController;

  List<String> imageList = [
    'assets/img/kawhi.jpg',
    'assets/img/kobe.jpg',
    'assets/img/mj.jpg',
    'assets/img/duncan.jpg',
    'assets/img/leflop.jpeg',
  ];

  int activePage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 1, initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 350,
            height: 170,
            margin: const EdgeInsets.only(left: 20),
            child: PageView.builder(
                itemCount: imageList.length,
                pageSnapping: true,
                controller: _pageController,
                onPageChanged: (page) {
                  setState(() {
                    activePage = page;
                  });
                },
                itemBuilder: (context, pagePosition) {
                  return Neumorphic(
                      margin: const EdgeInsets.only(right: 15),
                      style: NeumorphicStyle(
                        shape: NeumorphicShape.concave,
                        boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(12)),
                        depth: 12,
                        intensity: 0.3,
                        lightSource: LightSource.topLeft,
                        color: Colors.white,
                      ),
                      child: Container(
                        child: Image(
                            image: AssetImage(imageList[pagePosition]),
                            fit: BoxFit.fill),
                      ));
                }),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: indicators(imageList.length, activePage))
        ],
      ),
    );
  }
}

List<Widget> indicators(imagesLength, currentIndex) {
  return List<Widget>.generate(imagesLength, (index) {
    return Container(
      margin: const EdgeInsets.all(3),
      width: 7,
      height: 7,
      decoration: BoxDecoration(
          color: currentIndex == index ? Colors.black : Colors.black26,
          shape: BoxShape.circle),
    );
  });
}
