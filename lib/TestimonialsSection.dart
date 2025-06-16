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
    'Sandy, Kellyville': 'Job is now completed successfully. Very good Tiler came over for the job. After proper measurements we found the total area was a lot more than originally thought, it ended up close to 90 sq m. Tiler completed the job and the result is excellent. Happy to refer this business',
    'Sumi, Kensington': 'Excellent service. Very pleased with GL\'s approachable Tilers, particularly Joseph',
    'Sanjna, Chatswood West' : 'Will refer GL Tiling for their excellent work',
    'Kyri, Enfield': 'What in incredibly wonderful experience. From the first communication to finishing the job, Joseph was outstanding. We had 150m2 of floor tiling that needed to be done ASAP and Joseph went above and beyond. His work is simply exceptional. He takes pride in his work, is diligent and a true craftsman. There is not one thing I can complain about, not one. Punctual, honours his commitments and every day he left the house clean and tidy. I have absolutely no hesitation in recommending Joseph.'
  };

  TestimonialsSection(this.sectionKey, this.context, this.isMobile, {super.key});

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final ScrollController shortController = ScrollController();

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
                                  elevation: 8,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Scrollbar(
                                      thumbVisibility: true, // always show scrollbar thumb
                                      trackVisibility: true, // optionally show track
                                      interactive: true,
                                      controller: shortController,
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(review.value, style: TextStyle(fontSize: 15),),
                                            const SizedBox(height: 10),
                                            Text('- ${review.key}', style: TextStyle(fontSize: 16),),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),);
                            }).toList(),
                            options: CarouselOptions(
                              height: 250.0,
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
                                height: 220,

                                child: Card(
                                  color: Colors.teal.shade300,
                                  elevation: 8,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Scrollbar(
                                      thumbVisibility: true, // always show scrollbar thumb
                                      trackVisibility: true, // optionally show track
                                      interactive: true,
                                      controller: shortController,
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Text(review.value, style: TextStyle(fontSize: 15),),
                                            ),
                                            const SizedBox(height: 10),
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Text('- ${review.key}', style: TextStyle(fontSize: 16),),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),);
                            }).toList(),
                            options: CarouselOptions(
                              height: 240.0,
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
