import 'package:flutter/material.dart';
import 'package:implicit_animations/text_transform.dart';

class MyApp1 extends StatelessWidget {
  const MyApp1({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: TextTransformAnimation(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

class TextAnimation extends StatefulWidget {
  const TextAnimation({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<TextAnimation> createState() => _TextAnimationState();
}

class _TextAnimationState extends State<TextAnimation> {
  double _size = 0;

  bool _showBox = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: AnimatedContainer(
        transformAlignment: Alignment.centerRight,
        duration: const Duration(milliseconds: 1000),
        width: _size,
        height: 200,
        color: Colors.transparent,
        child: AnimatedOpacity(
          curve: Curves.easeIn,
          duration: const Duration(milliseconds: 500),
          opacity: _showBox ? 1.0 : 0.0,
          child: const Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. "),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _size = _size == 0 ? MediaQuery.of(context).size.width : 0;

            _showBox = !_showBox;
          });
        },
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
