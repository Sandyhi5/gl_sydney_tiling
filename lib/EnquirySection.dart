// Copyright (c) 2025 Sandeep Chandra
// All rights reserved.


import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:responsive_builder/responsive_builder.dart';
import 'package:ionicons/ionicons.dart';


class EnquirySection extends StatelessWidget {
  final GlobalKey sectionKey;
  final BuildContext context;

  EnquirySection(this.sectionKey, this.context, {super.key});

  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final messageController = TextEditingController();


  Future<void> sendEmail() async {
    const serviceId = 'your_service_id';
    const templateId = 'your_template_id';
    const userId = 'your_public_key'; // Not secret, safe in frontend

    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');

    final response = await http.post(
      url,
      headers: {
        'origin': 'http://localhost',
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'service_id': serviceId,
        'template_id': templateId,
        'user_id': userId,
        'template_params': {
          'from_name': nameController.text,
          'from_email': emailController.text,
          'message': messageController.text,
        }
      }),
    );

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Enquiry sent successfully!')),
      );
      nameController.clear();
      emailController.clear();
      messageController.clear();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to send enquiry.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      key: sectionKey,

      children: [
        SizedBox(
          width: double.infinity,
          child: Container(
            height: 50,
            color: Colors.pink.shade700,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Ask Us for a Quote',
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

        SizedBox(height: 10),

        Wrap(
          children: [
            SizedBox(
              width: screenWidth / 2 - 10,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        labelText: 'Name',
                        labelStyle: TextStyle(fontSize: 14)),
                      validator: (value) => value!.isEmpty ? 'Enter your name' : null,
                    ),
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(fontSize: 14)),
                      validator: (value) => value!.isEmpty ? 'Enter your email' : null,
                    ),
                    TextFormField(
                      controller: messageController,
                      maxLines: 5,
                      decoration: InputDecoration(
                          labelText: 'Message',
                          labelStyle: TextStyle(fontSize: 14)),
                      validator: (value) => value!.isEmpty ? 'Enter your message' : null,
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      child: Text('Send Enquiry',
                      style: TextStyle(color: Colors.white)),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          sendEmail();
                        }
                      },
                    )
                  ],
                ),
                      ),
              ),
            ),

            SizedBox(width: 10,),

            Container(
              width: screenWidth / 2 - 20,
              height: 300,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/image10.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              alignment: Alignment.center,
            ),
          ]),
      ],
    );
  }
}
