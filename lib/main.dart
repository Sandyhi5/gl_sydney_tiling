// Copyright (c) 2025 Sandeep Chandra
// All rights reserved.

import 'package:flutter/material.dart';
import 'package:gl_sydney_tiling/NavButton.dart';
import 'package:gl_sydney_tiling/AboutSection.dart';
import 'package:gl_sydney_tiling/GallerySection.dart';
import 'package:gl_sydney_tiling/PhoneButton.dart';
import 'package:gl_sydney_tiling/ServicesSection.dart';
import 'package:gl_sydney_tiling/ContactSection.dart';
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
          return desktopView(context);
        }
        if(sizingInformation.deviceScreenType == DeviceScreenType.tablet) {
          return tabletView(context);
        }

        return mobileView(context);
      });
  }


  Widget mobileView(BuildContext context) {
    return Container(color: Colors.purple,);
  }

  Widget tabletView(BuildContext context) {
    return Container(color: Colors.blue,);
  }

  Widget desktopView(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GL Tiling Sydney",
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, letterSpacing: 1.25, wordSpacing: 1.8),), // You can replace with logo widget
        actions: [
          const PhoneButton(title: "0450 341 705"),
          const SizedBox(width: 55,),
          NavButton(sectionKey: sectionKeyHm, title: "Home"),
          const SizedBox(width: 3,),
          NavButton(sectionKey: sectionKeyAb, title: "About"),
          const SizedBox(width: 3,),
          NavButton(sectionKey: sectionKeySv, title: "Services"),
          const SizedBox(width: 3,),
          NavButton(sectionKey: sectionKeyGa, title: "Gallery"),
          const SizedBox(width: 3,),
          NavButton(sectionKey: sectionKeyCt, title: "Contact"),
          const SizedBox(width: 10,),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeroSection(sectionKeyHm, context),
            const Divider(),
            AboutSection(sectionKeyAb, context),
            const Divider(),
            ServicesSection(sectionKeySv, context),
            const Divider(),
            GallerySection(sectionKeyGa, context),
            const Divider(),
            ContactSection(sectionKeyCt, context),
          ],
        ),
      ),
    );
    //
  }
}
