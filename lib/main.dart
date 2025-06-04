// Copyright (c) 2025 Sandeep Chandra
// All rights reserved.

import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

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
        title: 'GL Sydney Tiling Services',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const HomePage(title: 'GL Sydney Tiling Services'),
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
    return Container(color: Colors.green,);
  }
}
