import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ImageRandomDemo(),
    );
  }
}

class ImageRandomDemo extends StatefulWidget {
  @override
  _ImageRandomDemoState createState() => _ImageRandomDemoState();
}

class _ImageRandomDemoState extends State<ImageRandomDemo> {
  List<String> imagePaths = [
    'assets/images/ball1.png',
    'assets/images/ball2.png',
    'assets/images/ball3.png',
    'assets/images/ball4.png',
    'assets/images/ball5.png',
  ];

  Random random = Random();
  List<String> randomImages = [];

  @override
  void initState() {
    super.initState();
    _shuffleImages();
  }

  // Embaralhar as imagens
  void _shuffleImages() {
    randomImages = List.from(imagePaths)..shuffle(random);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Me faça uma pergunta ;)'),
        centerTitle: true,
        backgroundColor: Colors.grey.shade700,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  _shuffleImages();
                });
              },
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                child: Image.asset(
                  randomImages[0],
                  key: Key(randomImages[0]),
                  width: 400,
                  height: 400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
