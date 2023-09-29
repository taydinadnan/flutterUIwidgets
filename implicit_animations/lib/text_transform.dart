import 'package:flutter/material.dart';

class TextTransformAnimation extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final Color color;
  final Duration duration;

  const TextTransformAnimation(
    this.text, {
    Key? key,
    required this.color,
    this.style,
    this.duration = const Duration(seconds: 10),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      key: ValueKey(text),
      tween: Tween(begin: 0.0, end: 1.0),
      duration: duration,
      curve: Curves.easeOutQuint,
      builder: (context, value, child) {
        return ShaderMask(
          shaderCallback: (bounds) {
            return LinearGradient(
              colors: [
                color,
                color.withOpacity(0.5),
                color.withOpacity(0),
              ],
              stops: const [0.0, 0.5, 1.0],
              transform: CustomGradientTransform(
                x: -bounds.width + (bounds.width * value),
                rotation: Tween(begin: 0.0, end: 3.0).transform(value),
              ),
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ).createShader(bounds);
          },
          child: child,
        );
      },
      child: Text(
        text,
        style: style,
      ),
    );
  }
}

class CustomGradientTransform extends GradientTransform {
  final double x;
  final double y;
  final double rotation;

  const CustomGradientTransform({
    this.x = 0,
    this.y = 0,
    this.rotation = 0,
  });

  @override
  Matrix4? transform(Rect bounds, {TextDirection? textDirection}) {
    return Matrix4.translationValues(x, y, 0)..rotateZ(rotation);
  }
}
