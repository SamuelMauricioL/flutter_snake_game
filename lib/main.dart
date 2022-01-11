import 'package:flutter/material.dart';
import 'package:snake_game/_processing_demo_sketch_display.dart';
import 'package:snake_game/snake_game_screen.dart';

void main() {
  runApp(const FlutterProcessingExampleApp());
}

class FlutterProcessingExampleApp extends StatelessWidget {
  const FlutterProcessingExampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Processing Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CodingTrainSnakeGameScreen(
        sketchDemoController: SketchDemoController(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
