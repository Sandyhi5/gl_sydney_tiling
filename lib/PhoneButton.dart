// Copyright (c) 2025 Sandeep Chandra
// All rights reserved.


import 'package:flutter/material.dart';


class PhoneButton extends StatelessWidget {
  final String title;
  const PhoneButton({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.0),
      child: ColoredBox(
        color: Colors.grey.shade900,
        child: Wrap(
          children: [
            IconButton(
              icon: Icon(Icons.phone_android_rounded,
              color: Colors.white70,),
              onPressed: null,
            ),
            SizedBox(width: 3,),
            Container(
              child: TextButton(
                  child: Text(title,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
