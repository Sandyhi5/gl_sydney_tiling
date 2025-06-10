// Copyright (c) 2025 Sandeep Chandra
// All rights reserved.


import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:ionicons/ionicons.dart';


class ContactSection extends StatelessWidget {
  final GlobalKey sectionKey;
  final BuildContext context;
  final bool isMobile;

  const ContactSection(this.sectionKey, this.context, this.isMobile, {super.key});

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    //double screenHeight = MediaQuery.of(context).size.width;

    return isMobile
    ? Container(
      key: sectionKey,
      width: double.infinity,
      color: Colors.black87,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: screenWidth,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child:
                  Text('GL Tiling Sydney',
                    style: TextStyle(
                    color: Colors.pink.shade500,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('For your tiling needs like wall and floor tiling, for your bathroom, shower, floors, patio, stairs or any part of your home or for any Commercial work, simply contact us and our Tiling professionals will look after you.\n\nVery reasonable Quotes.\nPrompt job completion.\nOur aim - a Happy Customer!',
                  style: TextStyle(fontSize: 14, color: Colors.white),
                  softWrap: true,),
              ),
              SizedBox(height: 20,),

/*
              Row(
                children: [
                  // Leader box

                  // Our Services
*/
/*
                  SizedBox(width: screenWidth / 3,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Wrap(
                          direction: Axis.vertical,
                          children: [
                            const Text(
                              'Our Services',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 15,),
                            Text('Floor Tiling\n\n'
                                'Wall Tiling\n\n'
                                'Bathroom\n\n'
                                'Kitchen\n\n'
                                'Laundry\n\n'
                                'Patio & Pergola', style: TextStyle(color: Colors.white),),
                          ]),
                    ),
                  ),
*//*

                ],
              ),
*/

              Row(
                children: [
                  // Contact Info
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Contact Info',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 20,),
                          Text('Email: gltiling@gmail.com\n\n'
                            'Mobile: 0450 341 705\n\n'
                            'Address: 1 Church St, Parramatta, NSW 2140\n\n'
                            'ABN: 01 234 567 890\n\n'
                            'Building License: 451582', style: TextStyle(color: Colors.white),),
                        ]),
                    ),
                  ),

                  // Contact
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center ,
                          children: [
/*
                            Text(
                              'Let\'s Connect',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
*/
                            SizedBox(height: 15,),
                            SizedBox(width: 60, child: IconButton(onPressed: () {}, icon: Icon(Ionicons.logo_facebook, size: 50, color: Colors.purpleAccent,))),
                            SizedBox(height: 5,),
                            SizedBox(width: 60, child: IconButton(onPressed: () {}, icon: Icon(Ionicons.logo_instagram, size: 50, color: Colors.purpleAccent, ))),
                            SizedBox(height: 5,),
                            SizedBox(width: 60, child: IconButton(onPressed: () {}, icon: Icon(Ionicons.logo_pinterest, size: 50, color: Colors.purpleAccent,))),
                          ]),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20,)
            ],
          ),
        ),
      ),
    )

    : Container(
      key: sectionKey,
      width: double.infinity,
      //height: panelHeight,
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
              SizedBox(width: screenWidth * 1/3,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Wrap(
                    direction: Axis.vertical,
                    children: [
                      Text('GL Tiling Sydney',
                        style: TextStyle(
                          color: Colors.pink.shade500,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10,),
                      SizedBox(width: screenWidth * 1/3 - 26,
                        child: Text('For your tiling needs like wall and floor tiling, for your bathroom, shower, floors, patio, stairs or any part of your home or for any Commercial work, simply contact us and our Tiling professionals will look after you.\n\nVery reasonable Quotes.\nPrompt job completion.\nOur aim - a Happy Customer!',
                          style: TextStyle(fontSize: 14, overflow: TextOverflow.visible, color: Colors.white),),
                      ),
                      SizedBox(height: 5,),
                    ]),
                ),
              ),

              // Our Services
              SizedBox(width: screenWidth / 6,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Wrap(
                      direction: Axis.vertical,
                      children: [
                        const Text(
                          'Our Services',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 15,),
                        Text('Floor Tiling\n\n'
                            'Wall Tiling\n\n'
                            'Bathroom\n\n'
                            'Kitchen\n\n'
                            'Laundry\n\n'
                            'Patio & Pergola', style: TextStyle(color: Colors.white),),
                      ]),
                ),
              ),

              // Contact Info
              SizedBox(width: screenWidth * 0.8/3,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Wrap(
                      direction: Axis.vertical,
                      children: [
                        const Text(
                          'Contact Info',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 15,),
                        Text('Email: gltiling@gmail.com\n\n'
                            'Mobile: 0450 341 705\n\n'
                            'Address: 1 Church St, Parramatta, NSW 2140\n\n'
                            'ABN: 01 234 567 890\n\n'
                            'Building License: 451582', style: TextStyle(color: Colors.white),),
                      ]),
                ),
              ),

              // Contact
              SizedBox(width: screenWidth * 0.4/3,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Wrap(
                      direction: Axis.vertical,
                      crossAxisAlignment: WrapCrossAlignment.end,
                      children: [
                        Text(
                          'Let\'s Connect',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 15,),
                        SizedBox(width: 30, child: IconButton(onPressed: () {}, icon: Icon(Ionicons.logo_facebook, color: Colors.purpleAccent,))),
                        SizedBox(height: 5,),
                        SizedBox(width: 30, child: IconButton(onPressed: () {}, icon: Icon(Ionicons.logo_instagram, size: 30, color: Colors.purpleAccent, ))),
                        SizedBox(height: 5,),
                        SizedBox(width: 30, child: IconButton(onPressed: () {}, icon: Icon(Ionicons.logo_pinterest, size: 30, color: Colors.purpleAccent,))),
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
