// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:first_flutter_app/card.widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Virtual Tackle Box',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      routes: {
        MyHomePage.TAG: (context) => const MyHomePage()
      },
      initialRoute: MyHomePage.TAG,
    );
  }
}

class MyHomePage extends StatefulWidget {
  static const TAG = 'home';

  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  static const redLizardText = "6\" Zoom Lizard";
  static const blueLizardText = "6\" Zoom Lizard";

  var lureCards = [
    Card(
        child: LureCard(
          label: redLizardText,
          description: 'Cherry Red',
          imageUri: 'https://m.media-amazon.com/images/I/41tzBEldZZL._AC_.jpg'
        )
    ),
    Card(
        child: LureCard(
            label: blueLizardText,
            description: 'Electric Blue',
            imageUri: 'https://m.media-amazon.com/images/I/31RA1uGGfZL._AC_.jpg')
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Virtual Tackle Box'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: lureCards,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            lureCards = [...lureCards,
              Card(
                child: LureCard(
                label: blueLizardText,
                imageUri: 'https://m.media-amazon.com/images/I/31RA1uGGfZL._AC_.jpg'
                )
              )
            ];
          });
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
    );
  }
}
