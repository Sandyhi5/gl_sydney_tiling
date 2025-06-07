// Copyright (c) 2025 Sandeep Chandra
// All rights reserved.


import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:ionicons/ionicons.dart';


class TestimonialsSection extends StatelessWidget {
  final GlobalKey sectionKey;
  final BuildContext context;

  const TestimonialsSection(this.sectionKey, this.context, {super.key});

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    //double screenHeight = MediaQuery.of(context).size.width;

    return Container(
      key: sectionKey,
      width: double.infinity,
      alignment: Alignment.centerLeft,
      color: Colors.black87,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: screenWidth,
          child: Wrap(
            direction: Axis.horizontal,
            children: [

              // Leader box
              SizedBox(width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Wrap(
                      direction: Axis.vertical,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Text('Testimonials',
                          style: TextStyle(
                            color: Colors.pink.shade500,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10,),
                        Text('What Our Clients Say!',
                          style: TextStyle(fontSize: 36, overflow: TextOverflow.visible, color: Colors.white),),
                        SizedBox(height: 5,),
                        Row(
                          children: [
                            Container(
                              width: screenWidth / 2 - 30,
                              height: 250,
                              color: Colors.grey,),
                            Container(
                              width: 20,
                              color: Colors.white),
                            Container(
                              width: screenWidth / 2 - 30,
                              height: 250,
                              color: Colors.grey),
                        ]),
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
