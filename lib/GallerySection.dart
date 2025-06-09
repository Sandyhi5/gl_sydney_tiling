// Copyright (c) 2025 Sandeep Chandra
// All rights reserved.


import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';


class GallerySection extends StatelessWidget {
  final GlobalKey sectionKey;
  final BuildContext context;

  GallerySection(this.sectionKey, this.context, {super.key});


  final List<String> imagePaths = List.generate(9,
        (index) {
          return 'images/gl-image-${index + 1}.jpg';
        },
  );

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [

        // Our Services
        SizedBox(
          width: screenWidth / 2,
          child: Container(
            height: 50,
            width: double.infinity, //screenWidth - 10,
            color: Colors.pink.shade700,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Gallery',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),

        SizedBox(height: 10,),

        Container(
          key: sectionKey,
          height: 700, width: screenWidth,
          child: GridView.builder(
              itemCount: imagePaths.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // 3 columns (change to 2 for 2x3 layout)
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                childAspectRatio: 1,
              ),
              itemBuilder: (context, index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    width: screenWidth,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        scale: 0.8,
                        image: AssetImage(imagePaths[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
          ),
        ),
      ],
    );
  }
}
