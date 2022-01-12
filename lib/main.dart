import 'package:flutter/material.dart';
import 'package:flutter_processing/flutter_processing.dart';
// import 'package:snake_game/_processing_demo_sketch_display.dart';
import 'package:snake_game/snake_game_screen.dart';

void main() {
  runApp(const FlutterProcessingExampleApp());
}

class FlutterProcessingExampleApp extends StatefulWidget {
  const FlutterProcessingExampleApp({Key? key}) : super(key: key);

  @override
  State<FlutterProcessingExampleApp> createState() =>
      _FlutterProcessingExampleAppState();
}

class _FlutterProcessingExampleAppState
    extends State<FlutterProcessingExampleApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Processing Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Stack(
          children: [
            Center(
              child: Processing(
                focusNode: FocusNode(),
                sketch: SnakeGameSketch(),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: FloatingActionButton(
                  tooltip: 'Restart Sketch',
                  onPressed: () {
                    setState(() {});
                  },
                  mini: true,
                  backgroundColor: const Color(0xFF333333),
                  child: const Icon(Icons.refresh),
                ),
              ),
            ),
          ],
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
