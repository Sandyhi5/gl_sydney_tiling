// Copyright (c) 2025 Sandeep Chandra
// All rights reserved.


import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';


class ServicesSection extends StatefulWidget {
  final GlobalKey sectionKey;
  final BuildContext context;

  const ServicesSection(this.sectionKey, this.context, {super.key});

  @override
  State<ServicesSection> createState() => _ServicesSectionState();
}


class _ServicesSectionState extends State<ServicesSection> {

  final ScrollController _scrollController = ScrollController();
  final double itemHeight = 300.0;
  int currentIndex = 0;

  // Text labels and image paths
  final List<String> labels = [
    'Floor Tiling',
    'Wall Tiling',
    'Kitchen Tiling',
    'Bathroom Tiling',
    'Pool Tiling',
    'Patio & Pergola Tiling',
    'Steps & Stairs Tiling'
  ];

  final List<String> images = [
    'images/floor-2.jpg',
    'images/image7.jpg',
    'images/image4.jpg',
    'images/bathroom-1.jpg',
    'images/pool-3.jpg',
    'images/patio-1.jpg',
    'images/steps-4.jpg'
  ];

  void _onScroll() {
    final offset = _scrollController.offset;
    final index = (offset / itemHeight).floor().clamp(0, labels.length - 1);

    if (index != currentIndex) {
      setState(() {
        currentIndex = index;
      });
    }
  }


  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;

    return Wrap(
        key: widget.sectionKey,
        direction: Axis.vertical,
        children: [
          // Start now a Row with 2 x Boxes - left names --> right images
          Row(
            children: [
              // Left Box
              SizedBox(
                width: screenWidth / 2 - 10,
                height: itemHeight,
                child: Column(
                  children: [
                    // Our Services
                    SizedBox(
                      width: screenWidth / 2,
                      child: Container(
                        height: 50,
                        width: screenWidth / 2 - 10,
                        color: Colors.pink.shade700,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Our Services',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),

                    Expanded(
                      child: ListView.builder(
                        controller: _scrollController,
                        itemCount: labels.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                currentIndex = index;
                              });
                            },
                            child: Container(
                              //height: itemHeight,
                              alignment: Alignment.centerLeft,
                              color: index == currentIndex ? Colors.grey[500] : null,

                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(labels[index],
                                  style: TextStyle(
                                  color: Colors.pink.shade500,
                                  fontSize: index == currentIndex ? 22 : 18,
                                  fontWeight: index == currentIndex ? FontWeight.bold : FontWeight.normal,
                                ),),
                              ),
                            ),
                          );
                        }
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(width: 10,),

              // Right box
              SizedBox(width: screenWidth / 2 - 20,
                child: Container(
                  width: screenWidth / 2,
                  height: itemHeight,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(images[currentIndex]),
                      fit: BoxFit.cover,
                    ),
                  ),
                  alignment: Alignment.center,
                ),
              ),
            ],
          )

/*          // Floor Tiling
          Row(
            children: [
              Container(
                width: screenWidth / 2,
                height: 200,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/floor-2.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                alignment: Alignment.center,
              ),
              SizedBox(width: screenWidth / 2 - 20,
                child: Wrap(
                    direction: Axis.vertical,
                    children: [
                      SizedBox(
                        width: screenWidth / 2 - 20,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Floor Tiling',
                            style: TextStyle(
                              color: Colors.pink.shade500,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      //SizedBox(height: 10,),
                      SizedBox(width: screenWidth / 2 - 20,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('We specialize in high-precision floor tiling that ensures durability and a flawless finish. Our team handles everything from ceramic and porcelain to natural stone tiles. We focus on level surfaces and seamless grout lines for a professional look. Residential or commercial, we tailor floor tiling to your space and style.',
                            style: TextStyle(fontSize: 14, overflow: TextOverflow.visible, color: Colors.black87),),
                        ),
                      ),
                      SizedBox(height: 5,),
                    ]),
              ),
            ],
          ),
          const Divider(color: Colors.white),

         // Wall Tiling
          Row(
            children: [
              SizedBox(width: screenWidth / 2,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Wrap(
                      direction: Axis.vertical,
                      children: [
                        SizedBox(
                          width: screenWidth / 2,
                          child: Row(
                            children: [
                              Text('Wall Tiling',
                                style: TextStyle(
                                  color: Colors.pink.shade500,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 5),
                              Container(
                                width: 4,              // thickness of line
                                color: Colors.pink,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10,),
                        SizedBox(width: screenWidth / 2 - 16,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Our wall tiling adds texture, color, and character to any room. We’re experienced in feature walls, splashbacks, and full-tile coverings. With a focus on symmetry and clean alignment, we deliver immaculate results.\nPerfect for kitchens, bathrooms, and living spaces.',
                              style: TextStyle(fontSize: 14, overflow: TextOverflow.visible, color: Colors.black87),),
                          ),
                        ),
                        SizedBox(height: 5,),
                      ]),
                ),
              ),
              Container(
                width: screenWidth / 2,
                height: 300,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/image7.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                alignment: Alignment.center,
              ),
            ],
          ),
          const Divider(color: Colors.white),

          // Kitchen Tiling
          Row(
            children: [
              Container(
                width: screenWidth / 2,
                height: 300,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/image4.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                alignment: Alignment.center,
              ),
              SizedBox(width: screenWidth / 2,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Wrap(
                      direction: Axis.vertical,
                      children: [
                        SizedBox(
                          width: screenWidth / 2,
                          child: Row(
                            children: [
                              Text('Kitchen Tiling',
                                style: TextStyle(
                                  color: Colors.pink.shade500,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 5),
                              Container(
                                width: 4,              // thickness of line
                                color: Colors.pink,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10,),
                        SizedBox(width: screenWidth / 2 - 16,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Our kitchen tiling service enhances both function and appearance. We expertly tile splashbacks, floors, and walls with hygienic, easy-to-clean materials. Patterns, textures, and finishes are customized to your design. Every kitchen we tile is crafted for beauty and practicality.',
                              style: TextStyle(fontSize: 14, overflow: TextOverflow.visible, color: Colors.black87),),
                          ),
                        ),
                        SizedBox(height: 5,),
                      ]),
                ),
              ),
            ],
          ),
          const Divider(color: Colors.white),

          // Bathroom Tiling
          Row(
            children: [
              SizedBox(width: screenWidth / 2,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Wrap(
                      direction: Axis.vertical,
                      children: [
                        SizedBox(
                          width: screenWidth / 2,
                          child: Row(
                            children: [
                              Text('Bathroom Tiling',
                                style: TextStyle(
                                  color: Colors.pink.shade500,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 5),
                              Container(
                                width: 4,              // thickness of line
                                color: Colors.pink,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10,),
                        SizedBox(width: screenWidth / 2 - 16,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('We deliver elegant, watertight bathroom tiling that stands the test of time. From floor-to-ceiling tiles to niche detailing, we do it all. Our team ensures proper sealing and drainage for lasting performance. We help transform ordinary bathrooms into stunning retreats.',
                              style: TextStyle(fontSize: 14, overflow: TextOverflow.visible, color: Colors.black87),),
                          ),
                        ),
                        SizedBox(height: 5,),
                      ]),
                ),
              ),
              Container(
                width: screenWidth / 2,
                height: 300,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/bathroom-1.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                alignment: Alignment.center,
              ),
            ],
          ),
          const Divider(color: Colors.white),

          // Pool Tiling
          Row(
            children: [
              Container(
                width: screenWidth / 2,
                height: 300,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/pool-3.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                alignment: Alignment.center,
              ),
              SizedBox(width: screenWidth / 2,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Wrap(
                      direction: Axis.vertical,
                      children: [
                        SizedBox(
                          width: screenWidth / 2,
                          child: Row(
                            children: [
                              Text('Floor Tiling',
                                style: TextStyle(
                                  color: Colors.pink.shade500,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 5),
                              Container(
                                width: 4,              // thickness of line
                                color: Colors.pink,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10,),
                        SizedBox(width: screenWidth / 2 - 16,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('We bring years of experience in pool tiling for both new and existing pools. Using water-resistant and anti-slip materials, we ensure safety and style.We tile pool interiors, edges, and surrounds with lasting quality. Every job is finished to withstand moisture, sunlight, and time.',
                              style: TextStyle(fontSize: 14, overflow: TextOverflow.visible, color: Colors.black87),),
                          ),
                        ),
                        SizedBox(height: 5,),
                      ]),
                ),
              ),
            ],
          ),
          const Divider(color: Colors.white),

          // Patio Tiling
          Row(
            children: [
              SizedBox(width: screenWidth / 2,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Wrap(
                      direction: Axis.vertical,
                      children: [
                        SizedBox(
                          width: screenWidth / 2,
                          child: Row(
                            children: [
                              Text('Patio & Pergola Tiling',
                                style: TextStyle(
                                  color: Colors.pink.shade500,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 5),
                              Container(
                                width: 4,              // thickness of line
                                color: Colors.pink,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10,),
                        SizedBox(width: screenWidth / 2 - 16,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Our patio and pergola tiling blends indoor style with outdoor strength. We offer slip-resistant, weather-resistant tile options for every design. Each surface is laid with precision for maximum durability and comfort. Ideal for alfresco areas, BBQ zones, and entertainment spaces.',
                              style: TextStyle(fontSize: 14, overflow: TextOverflow.visible, color: Colors.black87),),
                          ),
                        ),
                        SizedBox(height: 5,),
                      ]),
                ),
              ),
              Container(
                width: screenWidth / 2,
                height: 300,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/patio-1.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                alignment: Alignment.center,
              ),
            ],
          ),
          const Divider(color: Colors.white),

          // Stairs Tiling
          Row(
            children: [
              Container(
                width: screenWidth / 2,
                height: 300,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/steps-4.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                alignment: Alignment.center,
              ),
              SizedBox(width: screenWidth / 2,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Wrap(
                      direction: Axis.vertical,
                      children: [
                        SizedBox(
                          width: screenWidth / 2,
                          child: Row(
                            children: [
                              Text('Stairs & Steps',
                                style: TextStyle(
                                  color: Colors.pink.shade500,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 5),
                              Container(
                                width: 4,              // thickness of line
                                color: Colors.pink,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10,),
                        SizedBox(width: screenWidth / 2 - 16,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('We provide safe, durable tiling for both indoor and outdoor steps. Our work combines grip, strength, and visual appeal on every stair. We handle everything from risers to nosing with precision finishes. Perfect for residential entryways, patios, and commercial spaces alike.',
                              style: TextStyle(fontSize: 14, overflow: TextOverflow.visible, color: Colors.black87),),
                          ),
                        ),
                        SizedBox(height: 5,),
                      ]),
                ),
              ),
            ],
          ),
          const Divider(color: Colors.white),*/
        ]);
  }
}
