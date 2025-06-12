// Copyright (c) 2025 Sandeep Chandra
// All rights reserved.


import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:responsive_builder/responsive_builder.dart';
import 'package:ionicons/ionicons.dart';
import 'package:emailjs/emailjs.dart' as emailjs;


class EnquirySection extends StatefulWidget {
  final GlobalKey sectionKey;
  final BuildContext context;

  EnquirySection(this.sectionKey, this.context, {super.key});

  @override
  State<EnquirySection> createState() => _EnquirySectionState();
}

class _EnquirySectionState extends State<EnquirySection> {
  final _formKey = GlobalKey<FormState>();
  final ScrollController _scrollController = ScrollController();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();
  final messageController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    mobileController.dispose();
    messageController.dispose();
    super.dispose();
  }

  Future<bool> sendEmail(BuildContext context, dynamic templateParams) async {

    debugPrint('EnquirySection: sendEmail: Auto-Reply: $templateParams');
    try {
      debugPrint('EnquirySection: sendEmail: $templateParams');
      await emailjs.send(
          'service_jjgu0zk',
          'template_s717r5n',
          templateParams,
          const emailjs.Options(
            publicKey: 'J3eAP5qNkPv282k3z',
            privateKey: 'ru_WgiyYCD3lTBbGWN6aW',
            //origin: 'http://localhost'
          ),
      );
      debugPrint('Email sendMail: New Enquiry: SUCCESS!');

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.pink.shade800,
          elevation: 5,
          content: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Enquiry sent successfully!',
                style: TextStyle(fontSize: 15, color: Colors.white),),
            ),
          ),
          showCloseIcon: true,
          closeIconColor: Colors.grey,
          duration: Duration(seconds: 3),
          ),
      );
      nameController.clear();
      emailController.clear();
      mobileController.clear();
      messageController.clear();

      return true;
    } catch (error) {
      if (error is emailjs.EmailJSResponseStatus) {
        debugPrint('ERROR: Email sendMail: ${error.status}: ${error.text}');
      }
      debugPrint(error.toString());

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.orange,
          elevation: 5,
          content: Container(
            decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Failed to send enquiry. Try after sometime',
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            ),
          ),
          showCloseIcon: true,
          closeIconColor: Colors.grey,
          duration: Duration(seconds: 3),
        ),
      );
      return false;
    }
  }

  /*await emailjs.send(
        'service_jjgu0zk',
        'template_6llekkj',
        templateParams,
        const emailjs.Options(
          publicKey: 'J3eAP5qNkPv282k3z',
          privateKey: 'ru_WgiyYCD3lTBbGWN6aW',
          //origin: 'http://localhost'
        ),
      );
      debugPrint('Email sendMail: Auto-Reply: SUCCESS!');*/
/*
  Future<void> sendEmail() async {
    const serviceId = 'service_jjgu0zk';
    const templateId = 'template_6llekkj';
    const userId = 'J3eAP5qNkPv282k3z'; // Not secret, safe in frontend

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
  }
*/
  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        key: widget.sectionKey,
      
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
                  child: Container(
                    //color: Colors.pink.shade200,
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
                          controller: mobileController,
                          decoration: InputDecoration(
                              labelText: 'Mobile',
                              labelStyle: TextStyle(fontSize: 14)),
                          validator: (value) => value!.isEmpty ? 'Enter your mobile' : null,
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
                          style: TextStyle(color: Colors.pink)),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Map<String, dynamic> templateParams = {
                                'name': nameController.text,
                                'email': emailController.text,
                                'mobile': mobileController.text,
                                'title': 'Re: Your enquiry on GL Tiling Sydney',
                                'message': messageController.text,
                              };
                              sendEmail(context, templateParams);
                              _scrollController.animateTo(
                                0,
                                duration: Duration(milliseconds: 500),
                                curve: Curves.easeInOut,
                              );
                            }
                          },
                        )
                      ],
                    ),
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
      ),
    );
  }
}
