TODO: NimuCarousel is a Flutter Carousel or Flutter Image Slider widget that has a set of images
that slides one after the other in a linear manner repeatedly in a given interval of time. NimuCarousel can have any number of items in a slide and it can also have multiple images in one single slide. NimuCarousel also supports a variety of effects like fade, zoom, slide, and dot indicators with custom design.

## Getting started


Codes:

```
            NimuCarousel(
              activePage: activePage,
              images: images,
              pageController: pageController,
              fit: BoxFit.fill,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              indicatorHeight: 10,
              indicatorWidth: 10,
              activeColor: Colors.black,
              inactiveColor: Colors.black26,
              indicatorShape: BoxShape.rectangle,
              carouselHeight: 200,
              carouselWidth: MediaQuery.of(context).size.width,
            ),
```

## Usage

TODO: You can find example in `/example` folder.
