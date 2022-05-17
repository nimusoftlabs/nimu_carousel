import 'package:flutter/material.dart';
import 'package:nimu_carousel/nimu_carousel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    int activePage = 0;
    PageController? pageController;
    List<String> images = [
      "https://images.livemint.com/img/2022/04/27/600x338/UKRAINE-CRISIS-FERTILIZER-1_1648533358705_1651088197574.JPG",
      "https://images.indianexpress.com/2021/01/farmers-7.jpg",
      "https://images.newindianexpress.com/uploads/user/imagelibrary/2021/8/20/w900X450/Farmers.jpg?w=400&dpr=2.6",
      "https://live.staticflickr.com/5497/9038087312_586fd97cf1_b.jpg"
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
          ],
        ),
      ),
      
    );
  }
}
