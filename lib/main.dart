// Copyright (c) 2025 Sandeep Chandra
// All rights reserved.

import 'package:flutter/material.dart';
import 'package:gl_sydney_tiling/NavButton.dart';
import 'package:gl_sydney_tiling/AboutSection.dart';
import 'package:gl_sydney_tiling/GallerySection.dart';
import 'package:gl_sydney_tiling/PhoneButton.dart';
import 'package:gl_sydney_tiling/ServicesSection.dart';
import 'package:gl_sydney_tiling/ContactSection.dart';
import 'package:gl_sydney_tiling/TestimonialsSection.dart';
import 'package:gl_sydney_tiling/EnquirySection.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'HeroSection.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveApp(
        builder: (context) {
          return MaterialApp(
            title: 'GL Tiling Services Sydney',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(

              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            ),
            home: const HomePage(title: 'GL Tiling Sydney'),
          );
        });
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // This is for parallax control
  final ScrollController _scrollController = ScrollController();
  double _scrollOffset = 0.0;

  // Intro a bool to show or not a promo offer
  bool _dialogShown = false;

  // Below is for jumping to sections upon request
  final GlobalKey sectionKeyHm = GlobalKey();
  final GlobalKey sectionKeyAb = GlobalKey();
  final GlobalKey sectionKeySv = GlobalKey();
  final GlobalKey sectionKeyGa = GlobalKey();
  final GlobalKey sectionKeyTm = GlobalKey();
  final GlobalKey sectionKeyEq = GlobalKey();
  final GlobalKey sectionKeyCt = GlobalKey();


  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
        builder: (context, sizingInformation) {
          if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
            debugPrint('DESKTOP view');
            return desktopView(context);
          }
          if (sizingInformation.deviceScreenType == DeviceScreenType.tablet) {
            debugPrint('TABLET view');
            return tabletView(context);
          }
          debugPrint('MOBILE view');
          return mobileView(context);
        });
  }


  Widget mobileView(BuildContext context) {
    final double kSeparator = 20;
    final bool isMobile = true;

    double heroHeight = 700.0;
    double parallax = _scrollOffset * 0.6; // slower scroll rate

    return Scaffold(

      appBar: AppBar(
        title: Transform.translate(
          offset: Offset(-10, 0),
          child: const Text("GL Tiling Sydney",
            style: TextStyle(fontSize: 18,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.10,
                wordSpacing: 1.4),),
        ), // You can replace with logo widget

        actions: [
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: const PhoneButton(title: "0450 341 705"),
          ),
        ],
      ),

      drawer: SizedBox(
        width: MediaQuery
            .of(context)
            .size
            .width * 0.5,
        child: Drawer(
          child: Align(
            alignment: Alignment.topLeft,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque, // Ensures all taps are caught
              onTap: () {
                Navigator.of(context).pop();
              },
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.pink.shade800, Colors.pink.shade400]),
                    ),
                    child: SizedBox(
                      height: 50,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Categories',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 55,),
                  NavButton(sectionKey: sectionKeyHm,
                    title: "Home",
                    isMobile: isMobile,),
                  const SizedBox(width: 3,),
                  NavButton(sectionKey: sectionKeyAb,
                    title: "About",
                    isMobile: isMobile,),
                  const SizedBox(width: 3,),
                  NavButton(sectionKey: sectionKeySv,
                    title: "Services",
                    isMobile: isMobile,),
                  const SizedBox(width: 3,),
                  NavButton(sectionKey: sectionKeyGa,
                    title: "Gallery",
                    isMobile: isMobile,),
                  const SizedBox(width: 3,),
                  NavButton(sectionKey: sectionKeyTm,
                    title: "Testimonials",
                    isMobile: isMobile,),
                  const SizedBox(width: 3,),
                  NavButton(sectionKey: sectionKeyEq,
                    title: "Enquire",
                    isMobile: isMobile,),
                  const SizedBox(width: 10,),
                  NavButton(sectionKey: sectionKeyCt,
                    title: "Contact",
                    isMobile: isMobile,),
                  const SizedBox(width: 10,),
                ],
              ),
            ),
          ),
        ),
      ),

      body: SingleChildScrollView(
        controller: _scrollController,
        child: AnimationLimiter(
          child: Column(
            children: [
              animatedSection(
                Stack(
                    children: [
                      Positioned.fill(
                        child: Transform.translate(
                          offset: Offset(0, parallax),
                          child: Image.asset(
                            'images/image6.jpg',
                            height: heroHeight,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      HeroSection(sectionKeyHm, context, isMobile)
                    ]),
              ),
              SizedBox(height: kSeparator,),
              animatedSection(AboutSection(sectionKeyAb, context, isMobile)),
              SizedBox(height: kSeparator,),
              animatedSection(ServicesSection(sectionKeySv, context, isMobile)),
              SizedBox(height: kSeparator,),
              animatedSection(GallerySection(sectionKeyGa, context, isMobile)),
              SizedBox(height: kSeparator,),
              animatedSection(
                  TestimonialsSection(sectionKeyTm, context, isMobile)),
              SizedBox(height: kSeparator,),
              animatedSection(EnquirySection(sectionKeyEq, context)),
              SizedBox(height: kSeparator,),
              animatedSection(ContactSection(sectionKeyCt, context, isMobile)),
            ],
          ),
        ),
      ),
    );
  }


  Widget tabletView(BuildContext context) {
    //return Container(color: Colors.blue,);
    double kSeparator = 30;
    final bool isMobile = false;

    return Scaffold(
      appBar: AppBar(
        title: const Text("GL Tiling Sydney",
          style: TextStyle(fontSize: 22,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.25,
              wordSpacing: 1.8),), // You can replace with logo widget
        actions: [
          const PhoneButton(title: "0450 341 705"),
          const SizedBox(width: 55,),
          NavButton(
            sectionKey: sectionKeyHm, title: "Home", isMobile: isMobile,),
          const SizedBox(width: 3,),
          NavButton(
            sectionKey: sectionKeyAb, title: "About", isMobile: isMobile,),
          const SizedBox(width: 3,),
          NavButton(
            sectionKey: sectionKeySv, title: "Services", isMobile: isMobile,),
          const SizedBox(width: 3,),
          NavButton(
            sectionKey: sectionKeyGa, title: "Gallery", isMobile: isMobile,),
          const SizedBox(width: 3,),
          NavButton(sectionKey: sectionKeyTm,
            title: "Testimonials",
            isMobile: isMobile,),
          const SizedBox(width: 3,),
          NavButton(
            sectionKey: sectionKeyEq, title: "Enquire", isMobile: isMobile,),
          const SizedBox(width: 10,),
          NavButton(
            sectionKey: sectionKeyCt, title: "Contact", isMobile: isMobile,),
          const SizedBox(width: 10,),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeroSection(sectionKeyHm, context, isMobile),
            SizedBox(height: kSeparator,),
            AboutSection(sectionKeyAb, context, isMobile),
            SizedBox(height: kSeparator,),
            ServicesSection(sectionKeySv, context, isMobile),
            SizedBox(height: kSeparator,),
            GallerySection(sectionKeyGa, context, isMobile),
            SizedBox(height: kSeparator,),
            TestimonialsSection(sectionKeyTm, context, isMobile),
            SizedBox(height: kSeparator,),
            EnquirySection(sectionKeyEq, context),
            SizedBox(height: kSeparator,),
            ContactSection(sectionKeyCt, context, isMobile),
          ],
        ),
      ),
    );
  }


  Widget desktopView(BuildContext context) {
    double kSeparator = 30;
    final bool isMobile = false;

    return Scaffold(
      appBar: AppBar(
        title: const Text("GL Tiling Sydney",
          style: TextStyle(fontSize: 22,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.25,
              wordSpacing: 1.8),), // You can replace with logo widget
        actions: [
          const PhoneButton(title: "0450 341 705"),
          const SizedBox(width: 55,),
          NavButton(
            sectionKey: sectionKeyHm, title: "Home", isMobile: isMobile,),
          const SizedBox(width: 3,),
          NavButton(
            sectionKey: sectionKeyAb, title: "About", isMobile: isMobile,),
          const SizedBox(width: 3,),
          NavButton(
            sectionKey: sectionKeySv, title: "Services", isMobile: isMobile,),
          const SizedBox(width: 3,),
          NavButton(
            sectionKey: sectionKeyGa, title: "Gallery", isMobile: isMobile,),
          const SizedBox(width: 3,),
          NavButton(sectionKey: sectionKeyTm,
            title: "Testimonials",
            isMobile: isMobile,),
          const SizedBox(width: 3,),
          NavButton(
            sectionKey: sectionKeyEq, title: "Enquire", isMobile: isMobile,),
          const SizedBox(width: 10,),
          NavButton(
            sectionKey: sectionKeyCt, title: "Contact", isMobile: isMobile,),
          const SizedBox(width: 10,),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeroSection(sectionKeyHm, context, isMobile),
            SizedBox(height: kSeparator,),
            AboutSection(sectionKeyAb, context, isMobile),
            SizedBox(height: kSeparator,),
            ServicesSection(sectionKeySv, context, isMobile),
            SizedBox(height: kSeparator,),
            GallerySection(sectionKeyGa, context, isMobile),
            SizedBox(height: kSeparator,),
            TestimonialsSection(sectionKeyTm, context, isMobile),
            SizedBox(height: kSeparator,),
            EnquirySection(sectionKeyEq, context),
            SizedBox(height: kSeparator,),
            ContactSection(sectionKeyCt, context, isMobile),
          ],
        ),
      ),
    );
    //
  }


  Widget animatedSection(Widget child,
      {int position = 0, double offset = 50.0}) {
    return AnimationConfiguration.staggeredList(
      position: position,
      duration: const Duration(milliseconds: 500),
      child: SlideAnimation(
        verticalOffset: offset,
        child: FadeInAnimation(child: child),
      ),
    );
  }


  Future<void> _showMyDialog() async {
    _dialogShown = true;
    await showDialog(
      context: context,
      builder: (context) =>
          AlertDialog(
            backgroundColor: Colors.transparent, // to make card stand out
            contentPadding: EdgeInsets.zero, // remove default padding
            content: Card(
              color: Colors.grey.shade400,
              elevation: 8,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              child: Container(
                width: 360,
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.bathtub_outlined, color: Colors.blueAccent,
                            size: 28),
                        SizedBox(width: 6),
                        Text(
                          '    ✨ Special Offer ✨\n🚿 Bathroom Renovation 🚿',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.pinkAccent,
                          ),
                        ),
                        SizedBox(width: 6),
                        Icon(Icons.bathtub_outlined, color: Colors.blueAccent,
                            size: 28),
                      ],
                    ),
                    SizedBox(height: 12),

                    // Price Highlight
                    Text(
                      'From just \$3,500!',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w900,
                        color: Colors.deepOrangeAccent,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 12),

                    // Offer details
                    Text(
                      '✓ Full Demolition\n'
                          '✓ Villaboard Installation\n'
                          '✓ Certified Waterproofing\n'
                          '✓ Custom Screed Work\n'
                          '✓ Professional Tiling\n',
                      style: TextStyle(fontSize: 15, height: 1.4),
                    ),

                    SizedBox(height: 10),

                    Text(
                      '🎁 Bonus: Free quote + expert design consultation!',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.green[700],
                      ),
                      textAlign: TextAlign.center,
                    ),

                    SizedBox(height: 20),

                    // Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          child: Text('Later'),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                        SizedBox(width: 12),
                        ElevatedButton(
                          child: Text('Call Now'),
                          onPressed: () {
                            // Insert your call action here
                            Navigator.of(context).pop();
                            // e.g., launch phone dialer or navigate
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
    );
  }


  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        _scrollOffset = _scrollController.offset;
      });
    });

// Show dialog after 3 seconds
    Future.delayed(Duration(seconds: 3), () {
      if (!_dialogShown) _showMyDialog();
    });

    // Show dialog when user scrolls down
    _scrollController.addListener(() {
      if (!_dialogShown && _scrollController.offset > 100) {
        _showMyDialog();
      }
    });
  }


  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

}
