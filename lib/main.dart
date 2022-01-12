import 'package:flutter/material.dart';
import 'package:flutter_processing/flutter_processing.dart';
// import 'package:snake_game/_processing_demo_sketch_display.dart';
import 'package:snake_game/snake_game_screen.dart';

void main() {
  runApp(const GameScreen());
}

class GameScreen extends StatefulWidget {
  const GameScreen({
    Key? key,
  }) : super(key: key);

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen>
    with SingleTickerProviderStateMixin {
  final _sketchFocusNode = FocusNode();

  @override
  void reassemble() {
    super.reassemble();
    _sketchFocusNode.requestFocus();
  }

  @override
  void dispose() {
    _sketchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      sketchFocusNode: _sketchFocusNode,
      createSketch: () {
        return SnakeGameSketch();
      },
    );
  }
}

typedef SketchFactory = Sketch Function();

class Wrapper extends StatefulWidget {
  Wrapper({
    Key? key,
    this.sketchFocusNode,
    required this.createSketch,
  }) : super(key: key ?? ObjectKey(createSketch));

  final FocusNode? sketchFocusNode;
  final SketchFactory createSketch;

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> with SingleTickerProviderStateMixin {
  Sketch? _sketch;

  @override
  void initState() {
    super.initState();
    _initSketch();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void restartSketch() {
    setState(() {
      if (_sketch != null) {
        _sketch!.dispose();
        _sketch = null;
      }

      _initSketch();
    });
  }

  void _initSketch() {
    _sketch ??= widget.createSketch();

    // Give focus to the sketch so that keyboard keys flow to it.
    widget.sketchFocusNode?.requestFocus();
  }

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
                focusNode: widget.sketchFocusNode,
                sketch: _sketch!,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: FloatingActionButton(
                  tooltip: 'Restart Sketch',
                  onPressed: restartSketch,
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
