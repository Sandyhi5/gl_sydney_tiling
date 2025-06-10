// Copyright (c) 2025 Sandeep Chandra
// All rights reserved.


import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:ionicons/ionicons.dart';
import 'package:carousel_slider/carousel_slider.dart';


class TestimonialsSection extends StatelessWidget {
  final GlobalKey sectionKey;
  final BuildContext context;
  final bool isMobile;

  final Map<String, String> reviews = {
    'Sandy': 'I used the services of GL Tiling and the results were simply WOW !',
    'Sumi': 'Excellent service. Very pleased with GL\'s approachable Tilers, particularly Joseph',
    'Sanjna' : 'Will refer GL Tiling for their excellent work'
  };

  TestimonialsSection(this.sectionKey, this.context, this.isMobile, {super.key});

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    //double screenHeight = MediaQuery.of(context).size.width;

    return isMobile
    ? Container(
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

                        SizedBox(
                          width: screenWidth - 10,
                          child: CarouselSlider(
                            items: reviews.entries.map((review) {
                              return Container(
                                width: screenWidth / 2 - 30,
                                height: 250,

                                child: Card(
                                  color: Colors.teal.shade300,
                                  elevation: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Text(review.value, style: TextStyle(fontSize: 15),),
                                        const SizedBox(height: 10),
                                        Text('- ${review.key}', style: TextStyle(fontSize: 16),),
                                      ],
                                    ),
                                  ),
                                ),);
                            }).toList(),
                            options: CarouselOptions(
                              height: 175.0,
                              viewportFraction: 0.5,
                              enlargeCenterPage: false,
                              autoPlay: true,
                              autoPlayInterval: const Duration(seconds: 5),
                              autoPlayAnimationDuration: const Duration(milliseconds: 8000),
                              autoPlayCurve: Curves.easeInOut,
                              scrollPhysics: BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              reverse: true,
                            ),
                          ),
                        ),
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    )

    : Container(
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

                        SizedBox(
                          width: screenWidth - 10,
                          child: CarouselSlider(
                            items: reviews.entries.map((review) {
                              return Container(
                                //width: screenWidth / 2 - 30,
                                height: 200,

                                child: Card(
                                  color: Colors.teal.shade300,
                                  elevation: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Text(review.value, style: TextStyle(fontSize: 15),),
                                        const SizedBox(height: 10),
                                        Text('- ${review.key}', style: TextStyle(fontSize: 16),),
                                      ],
                                    ),
                                  ),
                                ),);
                            }).toList(),
                            options: CarouselOptions(
                              height: 200.0,
                              viewportFraction: 0.3,
                              enlargeCenterPage: false,
                              autoPlay: true,
                              autoPlayInterval: const Duration(seconds: 5),
                              autoPlayAnimationDuration: const Duration(milliseconds: 8000),
                              autoPlayCurve: Curves.easeInOut,
                              scrollPhysics: BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              reverse: true,
                            ),
                          ),
                        ),
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
