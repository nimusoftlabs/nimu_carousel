import 'package:flutter/material.dart';

class NimuCarousel extends StatefulWidget {
  NimuCarousel({
    Key? key,
    required this.activePage,
    required this.images,
    required this.pageController,
    required this.fit,
    required this.scrollDirection,
    required this.physics,
    required this.indicatorHeight,
    required this.indicatorWidth,
    required this.activeColor,
    required this.inactiveColor,
    required this.indicatorShape,
    required this.carouselHeight,
    required this.carouselWidth,
  }) : super(key: key);
  int activePage = 0;
  PageController? pageController;
  List<String> images = [];
  BoxFit fit;
  Axis scrollDirection;
  ScrollPhysics physics;
  final double indicatorHeight;
  final double indicatorWidth;
  final Color activeColor;
  final Color inactiveColor;
  BoxShape indicatorShape;
  final double carouselHeight;
  final double carouselWidth;
  @override
  State<NimuCarousel> createState() => _NimuCarouselState();
}

class _NimuCarouselState extends State<NimuCarousel> {
  @override
  void initState() {
    super.initState();
    widget.pageController =
        PageController(viewportFraction: 0.8, initialPage: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: widget.carouselWidth,
          height: widget.carouselHeight,
          child: PageView.builder(
              itemCount: widget.images.length,
              pageSnapping: true,
              controller: widget.pageController,
              onPageChanged: (page) {
                setState(() {
                  widget.activePage = page;
                });
              },
              itemBuilder: (context, pagePosition) {
                bool active = pagePosition == widget.activePage;
                return slider(widget.images, pagePosition, active);
              }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: indicators(
            widget.images.length,
            widget.activePage,
            widget.indicatorHeight,
            widget.indicatorWidth,
            widget.activeColor,
            widget.inactiveColor,
          ),
        ),
      ],
    );
  }
}

AnimatedContainer slider(images, pagePosition, active) {
  double margin = active ? 10 : 20;

  return AnimatedContainer(
    duration: const Duration(milliseconds: 500),
    curve: Curves.easeInOutCubic,
    margin: EdgeInsets.all(margin),
    decoration: BoxDecoration(
        image: DecorationImage(image: NetworkImage(images[pagePosition]))),
  );
}

imageAnimation(PageController animation, images, pagePosition) {
  return AnimatedBuilder(
    animation: animation,
    builder: (context, widget) {
      return SizedBox(
        // width: 200,
        // height: 200,
        child: widget,
      );
    },
    child: Container(
      margin: const EdgeInsets.all(10),
      child: Image.network(
        images[pagePosition],
      ),
    ),
  );
}

List<Widget> indicators(
    imagesLength, currentIndex, height, width, activeColor, inactiveColor) {
  return List<Widget>.generate(imagesLength, (index) {
    return Container(
      margin: const EdgeInsets.all(3),
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: currentIndex == index ? activeColor : inactiveColor,
        shape: BoxShape.circle,
      ),
    );
  });
}
