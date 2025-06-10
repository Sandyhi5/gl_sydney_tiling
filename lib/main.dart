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

  final GlobalKey sectionKeyHm = GlobalKey();
  final GlobalKey sectionKeyAb = GlobalKey();
  final GlobalKey sectionKeySv = GlobalKey();
  final GlobalKey sectionKeyGa = GlobalKey();
  final GlobalKey sectionKeyTm = GlobalKey();
  final GlobalKey sectionKeyEq = GlobalKey();
  final GlobalKey sectionKeyCt = GlobalKey();
  bool _choice = false;

  void _selected() {
    setState(() {
      _choice = true;
    });
  }

  @override
  Widget build(BuildContext context) {

    return ResponsiveBuilder(
      builder: (context, sizingInformation) {

        if(sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
          debugPrint('DESKTOP view');
          return desktopView(context);
        }
        if(sizingInformation.deviceScreenType == DeviceScreenType.tablet) {
          debugPrint('TABLET view');
          return tabletView(context);
        }
        debugPrint('MOBILE view');
        return mobileView(context);
      });
  }


  Widget mobileView(BuildContext context) {
    //return Container(color: Colors.purple,);
    final double kSeparator = 20;
    final bool isMobile = true;

    return Scaffold(
      appBar: AppBar(
        title: Transform.translate(
          offset: Offset(-10, 0),
          child: const Text("GL Tiling Sydney",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, letterSpacing: 1.10, wordSpacing: 1.4),),
        ), // You can replace with logo widget

        actions: [
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: const PhoneButton(title: "0450 341 705"),
          ),
        ],
      ),

      drawer: SizedBox(
        width: MediaQuery.of(context).size.width * 0.5,
        child: Drawer(
          child: Align(
            alignment: Alignment.topLeft,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque, // Ensures all taps are caught
              onTap: () {Navigator.of(context).pop();},
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [Colors.pink.shade800, Colors.pink.shade400]),
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
                  NavButton(sectionKey: sectionKeyHm, title: "Home", isMobile: isMobile,),
                  const SizedBox(width: 3,),
                  NavButton(sectionKey: sectionKeyAb, title: "About", isMobile: isMobile,),
                  const SizedBox(width: 3,),
                  NavButton(sectionKey: sectionKeySv, title: "Services", isMobile: isMobile,),
                  const SizedBox(width: 3,),
                  NavButton(sectionKey: sectionKeyGa, title: "Gallery", isMobile: isMobile,),
                  const SizedBox(width: 3,),
                  NavButton(sectionKey: sectionKeyTm, title: "Testimonials", isMobile: isMobile,),
                  const SizedBox(width: 3,),
                  NavButton(sectionKey: sectionKeyEq, title: "Enquire", isMobile: isMobile,),
                  const SizedBox(width: 10,),
                  NavButton(sectionKey: sectionKeyCt, title: "Contact", isMobile: isMobile,),
                  const SizedBox(width: 10,),
                ],
              ),
            ),
          ),
        ),
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

  Widget tabletView(BuildContext context) {
    //return Container(color: Colors.blue,);
    double kSeparator = 30;
    final bool isMobile = false;

    return Scaffold(
      appBar: AppBar(
        title: const Text("GL Tiling Sydney",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, letterSpacing: 1.25, wordSpacing: 1.8),), // You can replace with logo widget
        actions: [
          const PhoneButton(title: "0450 341 705"),
          const SizedBox(width: 55,),
          NavButton(sectionKey: sectionKeyHm, title: "Home", isMobile: isMobile,),
          const SizedBox(width: 3,),
          NavButton(sectionKey: sectionKeyAb, title: "About", isMobile: isMobile,),
          const SizedBox(width: 3,),
          NavButton(sectionKey: sectionKeySv, title: "Services", isMobile: isMobile,),
          const SizedBox(width: 3,),
          NavButton(sectionKey: sectionKeyGa, title: "Gallery", isMobile: isMobile,),
          const SizedBox(width: 3,),
          NavButton(sectionKey: sectionKeyTm, title: "Testimonials", isMobile: isMobile,),
          const SizedBox(width: 3,),
          NavButton(sectionKey: sectionKeyEq, title: "Enquire", isMobile: isMobile,),
          const SizedBox(width: 10,),
          NavButton(sectionKey: sectionKeyCt, title: "Contact", isMobile: isMobile,),
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
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, letterSpacing: 1.25, wordSpacing: 1.8),), // You can replace with logo widget
        actions: [
          const PhoneButton(title: "0450 341 705"),
          const SizedBox(width: 55,),
          NavButton(sectionKey: sectionKeyHm, title: "Home", isMobile: isMobile,),
          const SizedBox(width: 3,),
          NavButton(sectionKey: sectionKeyAb, title: "About", isMobile: isMobile,),
          const SizedBox(width: 3,),
          NavButton(sectionKey: sectionKeySv, title: "Services", isMobile: isMobile,),
          const SizedBox(width: 3,),
          NavButton(sectionKey: sectionKeyGa, title: "Gallery", isMobile: isMobile,),
          const SizedBox(width: 3,),
          NavButton(sectionKey: sectionKeyTm, title: "Testimonials", isMobile: isMobile,),
          const SizedBox(width: 3,),
          NavButton(sectionKey: sectionKeyEq, title: "Enquire", isMobile: isMobile,),
          const SizedBox(width: 10,),
          NavButton(sectionKey: sectionKeyCt, title: "Contact", isMobile: isMobile,),
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
}
