import 'package:flutter/material.dart';

class Shape extends StatelessWidget {
  final double? radius;
  final Color color;
  final Function() onTap;
  const Shape(
      {super.key, this.radius, required this.color, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
            color: color,
            borderRadius:
                (radius != null) ? BorderRadius.circular(radius!) : null),
      ),
    );
  }
}
