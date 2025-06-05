// Copyright (c) 2025 Sandeep Chandra
// All rights reserved.


import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';


class NavButton extends StatelessWidget {

  final GlobalKey sectionKey;

  final String title;
  const NavButton({required this.sectionKey, required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.0),
      child: Container(
          color: Colors.grey.shade100,
          child: TextButton(
            child: Text(title,
              style: TextStyle(
                color: Colors.pink[800],
                fontSize: 14.0),
            ),
            onPressed: () {
              scrollToSection(sectionKey);
            }
          ),
      ),
    );
  }
}


void scrollToSection(GlobalKey key) {
  final context = key.currentContext;
  if (context != null) {
    Scrollable.ensureVisible(
      context,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}

