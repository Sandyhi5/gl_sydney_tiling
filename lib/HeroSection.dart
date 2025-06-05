// Copyright (c) 2025 Sandeep Chandra
// All rights reserved.


import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';


class HeroSection extends StatelessWidget {
  final BuildContext context;

  HeroSection(this.context, {super.key});


  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.width;

    screenHeight = 500;
    //double screenWidth = 400;

    return Stack(
      children: [
        Container(
        height: 500,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/image10.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        alignment: Alignment.centerLeft,
      ),
        Positioned(
          top: (screenHeight) * 0.35,
          left: (screenWidth) * 0.1,
          child: Wrap(
            direction: Axis.vertical,
            children: [
              Text('Welcome to GL Tiling Sydney',
                style: TextStyle(color: Colors.pink[900], fontSize: 36, fontWeight: FontWeight.bold,
                ),
              ),
              //SizedBox(height: 2,),
              Text('Tilers you can trust', style: TextStyle(fontSize: 28, color: Colors.white70, fontWeight: FontWeight.bold)),
              SizedBox(height: 8,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.pink.shade50,
                ),
                //decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0),),
                child: SizedBox(width: screenHeight * 0.6,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text('GL Tiling Sydney are specialists in wall and floor tiling. Be it for your bathroom, shower, floors, patio, stairs or any part of your home.',
                      style: TextStyle(fontSize: 16, overflow: TextOverflow.visible, color: Colors.black87),),
                  ),
                ),
              ),
              SizedBox(height: 12,),
              ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Container(
                  color: Colors.grey.shade100,
                  child: Row(
                    children: [
                      TextButton(
                        child: Text('Call now',
                          style: TextStyle(
                              color: Colors.black, //Colors.pink[800],
                              fontSize: 14.0),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        }
                      ),
                      //IconButton(onPressed: null, icon: Icon(Icons.arrow_right_alt_rounded)),
                      IconButton(
                        icon: Icon(Icons.phone_android_rounded,
                          color: Colors.black,),
                        onPressed: null,
                      ),
                  ]),
                ),
              ),
            ],
          ),
        ),

    ]);
  }
}
