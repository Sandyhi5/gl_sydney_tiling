// Copyright (c) 2025 Sandeep Chandra
// All rights reserved.


import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';


class AboutSection extends StatelessWidget {
  final GlobalKey sectionKey;
  final BuildContext context;
  final bool isMobile;

  const AboutSection(this.sectionKey, this.context, this.isMobile, {super.key});

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;

    return isMobile
      ? Column(
        key: sectionKey,
        children: [
          SizedBox(
            width: screenWidth, // / 2 - 20,
            child: Container(
              height: 50,
              color: Colors.pink.shade700,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('About Us',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 10,),
          SizedBox(width: screenWidth, // / 2 - 20,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('GL Tiling has been operating in Sydney for last 24 years. We specialize in all tiling jobs like wall and floor tiling, for your bathroom, shower, floors, patio, stairs or any part of your home or for any Commercial work, simply contact us and our Tiling professionals will look after you.\n\nOur tiling specialists are fully insured and we are a full member of the Housing Industry Association (HIA). Our work is guaranteed that our wall and floor tiling services adhere to the association’s code of ethics, principles, and industry standards.',
                style: TextStyle(fontSize: 14, overflow: TextOverflow.visible, color: Colors.black87),),
            ),
          ),
          SizedBox(height: 10,),
          Container(
            width: screenWidth, // / 2,
            height: 300,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/image10.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            alignment: Alignment.center,
          ),
        ])
      : Row(
      key: sectionKey,
      children: [
        Container(
          width: screenWidth / 2,
          height: 300,
          decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/image10.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          alignment: Alignment.center,
        ),
        SizedBox(width: 10,),
        SizedBox(width: screenWidth / 2 - 10,
          child: Wrap(
              direction: Axis.vertical,
              children: [
                SizedBox(
                  width: screenWidth / 2 - 20,
                  child: Container(
                    height: 50,
                    color: Colors.pink.shade700,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('About Us',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                SizedBox(width: screenWidth / 2 - 20,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('GL Tiling has been operating in Sydney for last 24 years. We specialize in all tiling jobs like wall and floor tiling, for your bathroom, shower, floors, patio, stairs or any part of your home or for any Commercial work, simply contact us and our Tiling professionals will look after you.\n\nOur tiling specialists are fully insured and we are a full member of the Housing Industry Association (HIA). Our work is guaranteed that our wall and floor tiling services adhere to the association’s code of ethics, principles, and industry standards.',
                      style: TextStyle(fontSize: 14, overflow: TextOverflow.visible, color: Colors.black87),),
                  ),
                ),
                SizedBox(width: 5,),
              ]),
        ),
    ]);
  }
}
